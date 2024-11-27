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

def contacts_db_connection():
    conn = sqlite3.connect('contacts.db')
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

    conn = contacts_db_connection()

    contacts = conn.execute('''
                 SELECT contact_name, contact_number FROM contacts
                 ''')

    return render_template("show_contacts.html", contacts = contacts)

@app.route("/contact/add", methods=["GET", "POST"])
def add_contact():
    conn = contacts_db_connection()
    # if statement occurs when form submission is hit
    if request.method =="POST":
        # Handle form submission

        name = request.form.get("contact-name")
        number = request.form.get("contact-number")

        # Handle missing input
        if not name or not number:
            return render_template("add_contact.html", error = "Please fill out both fields.")


        ## where contact is entered into db
        conn.execute('''
                     INSERT INTO contacts (contact_name, contact_number)
                     VALUES (?, ?)
                     ''', (name, number))
        

        conn.commit()
        conn.close()
        print(name, number)


        return render_template("home_contact.html")

    return render_template("add_contact.html")

@app.route("/contact/delete", methods=["GET", "POST"])
def delete_contact():

    # display contacts on delte
    conn = contacts_db_connection()
    contacts = conn.execute('''
                    SELECT id, contact_name, contact_number FROM contacts
                    ''').fetchall()

    if request.method == "POST":
        contact_id_input = request.form.get("contact-id")

        if not contact_id_input.isdigit():
            return render_template("delete_contact.html", contacts=contacts, error="Enter a number bucko")
        
        contact_id = int(contact_id_input)

        #check if contact exists
        contact_exists = conn.execute('''
                            SELECT 1 FROM contacts WHERE id = ?
                                      ''', (contact_id,)).fetchone()

        if not contact_exists:
            return render_template("delete_contact.html", contacts=contacts, error="Contact ID does not exist.")
        


        # delete the contact
        conn.execute('''
                    DELETE FROM contacts WHERE id = ?
                    ''', (contact_id,))
        conn.commit()

        # redisplay contacts once contact has been deleted
        contacts = conn.execute('''
                SELECT id, contact_name, contact_number FROM contacts
                ''').fetchall()
    
        #display delete contact.html as the ui
        return render_template("delete_contact.html", contacts=contacts)

    # homepage of delete contact
    return render_template("delete_contact.html", contacts = contacts)

if __name__ == "__main__":
    app.run(debug=True, port=80, host="0.0.0.0")