# flask app where users can add, view, and delete contacts

from flask import Flask, render_template, request
import sqlite3

app = Flask(__name__)

contacts = []

#connect with database
def pokemon_db_connection():
    conn = sqlite3.connect('pokedex.db')
    #import datbase as a dictionary
    conn.row_factory = sqlite3.Row
    return conn



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



@app.route("/pokedex", methods=["GET", "POST"])
def pokedex():
    # if statement gets hit when form is submitted
    if request.method == "POST":

        # start connection with database
        conn = pokemon_db_connection()

        # receive pokemon ID from form
        pokemonID = request.form.get("pokemon-id")

        # if user has not entered pokemonID pass error they need to do so
        if not pokemonID:
            return render_template("pokedex.html", error = "Please enter a Pokemon ID.")


        # try to get the id number of pokemon
        try:
            pokemon = conn.execute('SELECT master_id, species, type1, type2, feet, inches, weight, pokedex_entry from pokemon WHERE master_id = ?', (pokemonID,)).fetchone()

        # catches inproper input
        except (sqlite3.OperationalError, sqlite3.ProgrammingError):
            return render_template("pokedex.html", error = "Pokemon must be within 1-151")
        
        if not pokemon:
            return render_template("pokedex.html", error = "Pokemon must be within 1-151")


        # acts as variables to pass in - since pokemon is coming through as a list we index the info out
        id, species, type1, type2 = pokemon[0], pokemon[1], pokemon[2], pokemon[3]
        feet, inches, weight, entry = pokemon[4], pokemon[5], pokemon[6], pokemon[7]

        
        # special cases to account for
        if type2 != None:
            type2 = type2.capitalize()
        
        if id == 122:
            species = "Mr. Mime"
        else:
            species = species.capitalize()

        conn.close()
        return render_template('pokedex.html', pokemon=pokemon,
                               id = id, species = species, type1 = type1.capitalize(), type2 = type2,
                                feet = feet, inches = inches, weight = weight, entry = entry
                               )


    # GET - returns blank page as user has not entered pokemon yet
    return render_template('pokedex.html')
 


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
