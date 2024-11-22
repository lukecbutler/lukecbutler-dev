# flask app where users can add, view, and delete contacts

from flask import Flask, render_template, request
import pymysql

app = Flask(__name__)

contacts = []

DB_CONFIG = {
    "host": "tarheelfan2002.mysql.pythonanywhere-services.com",
    "user": "tarheelfan2002",
    "password": "sqlpassword",
    "database": "tarheelfan2002$Pokedex"
}


'''
DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "password",
    "database": "Pokemon"
}
'''

def get_db_connection():
    return pymysql.connect(**DB_CONFIG)

@app.route("/")
def home():
    return render_template("homepage.html")

###################################################################################
'''Projects'''
###################################################################################

@app.route("/projects")
def projects():
    return render_template("projects.html")



###################################################################################
'''Pokedex'''
###################################################################################

@app.route('/pokedex', methods = {'GET', 'POST'})
def get_pokemon():

    # when accessing any host, a get request is automatically sent from the browser to the server, that is why get is called automatically
    if request.method == 'GET':
        return render_template('pokemon.html')

    if request.method == 'POST':

        pokemon_id = request.form['pokemon_id']
        conn = get_db_connection()

        cursor = conn.cursor()

        cursor.execute("SELECT master_id, species, type1, type2 FROM pokemon_data WHERE master_id = %s", (pokemon_id))

        pokemon = cursor.fetchone()

        speciesLow = pokemon[1].lower()

        if pokemon:
            return render_template('pokemon.html', pokemon_id = pokemon[0], speciesLow = speciesLow, type1 = pokemon[2], type2 = pokemon[3])

        else:
            return render_template('pokemon.html', error = "Pokemon not found.")




####################################################################################
"""Contact Book Routes:"""
####################################################################################
#contact book homepage
@app.route("/contact/home")
def contact_home():
    return render_template("home_contact.html")

@app.route("/contact/show")
def show_contacts():
    return render_template("show_contacts.html", contacts = contacts)

@app.route("/contact/add", methods=["GET", "POST"])
def add_contact():

    # if statement occurs when form submission is hit
    if request.method =="POST":
        # Handle form submission
        name = request.form.get("contact-name")
        number = request.form.get("contact-number")

        # Handle missing input
        if not name or not number:
            return render_template("add_contact.html", error = "Please fill out both fields.")

        contacts.append([name, number])
        return render_template("home_contact.html")

    return render_template("add_contact.html")

@app.route("/contact/delete", methods=["GET", "POST"])
def delete_contact():

    if request.method == "POST":
        contact_number_input = request.form.get("contact-number")
        if not contact_number_input.isdigit():
            return render_template("delete_contact.html", contacts=contacts, error="Enter a number bucko")

        contact_number = int(contact_number_input)

        # Checks if contacts list is empty - if empty prompt user no contact to delete
        if not contacts:
            return render_template("delete_contact.html", contacts=contacts, error="No contacts you silly goose.")

        # Check if contact_number is within range - if contact number is not within range return page until user enters appropriate number
        if contact_number < 1 or contact_number > len(contacts):
            return render_template("delete_contact.html", contacts=contacts, error="Add a contact first!!")

        contacts.pop(contact_number-1)

    return render_template("delete_contact.html", contacts = contacts)


if __name__ == "__main__":
    app.run(debug=True, port=80, host="0.0.0.0")
