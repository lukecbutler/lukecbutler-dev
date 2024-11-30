# flask app where users can add, view, and delete contacts

from flask import Flask, render_template, request
import sqlite3

app = Flask(__name__)


#homepage
@app.route("/")
def home():
    return render_template("homepage.html")

# pokedex
app.add_url_rule('/pokedex', view_func=pokedex, methods=["GET", "POST"])

# contact book
app.add_url_rule('/contact/home', view_func=contact_home)
app.add_url_rule('/contact/add', view_func=add_contact, methods=["GET", "POST"])
app.add_url_rule('/contact/delete', view_func=delete_contact, methods=["GET", "POST"])
app.add_url_rule('/contact/show', view_func=show_contacts)

# java project
app.add_url_rule('/java_project', view_func=java_project)


if __name__ == "__main__":
    app.run(debug=True, port=80, host="0.0.0.0")