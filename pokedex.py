from flask import render_template, request
import sqlite3

# connect with dataebase
def pokemon_db_connection():
    conn = sqlite3.connect('databases/pokedex.db')
    #import datbase as a dictionary
    conn.row_factory = sqlite3.Row
    return conn

# pokedex logic
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

        picture_id = species.lower()

        conn.close()
        return render_template('pokedex.html', pokemon=pokemon,
                               id = id, species = species, type1 = type1.capitalize(), type2 = type2,
                                feet = feet, inches = inches, weight = weight, entry = entry, picture_id = picture_id
                               )


    # GET - returns blank page as user has not entered pokemon yet
    return render_template('pokedex.html')
