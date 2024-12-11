from flask import Flask, render_template
from java_project import java_project
from contacts import contact_book, add_contact, delete_contact, update_contact, save_contact
from pokedex import pokedex

app = Flask(__name__)


#homepage
@app.route("/")
def home():
    return render_template("homepage.html")

# pokedex
app.add_url_rule('/pokedex', view_func=pokedex, methods=["GET", "POST"])

# contact book
app.add_url_rule('/contact_book', view_func=contact_book)
app.add_url_rule('/add_contact', view_func=add_contact, methods=["GET", "POST"])
app.add_url_rule('/delete_contact', view_func=delete_contact, methods=["GET", "POST"])
app.add_url_rule('/update_contact', view_func=update_contact, methods=["GET", "POST"])
app.add_url_rule('/save_contact', view_func=save_contact, methods=["GET", "POST"])

# java project
app.add_url_rule('/java_project', view_func=java_project)


if __name__ == "__main__":
    app.run(debug=True, port=80, host="0.0.0.0")