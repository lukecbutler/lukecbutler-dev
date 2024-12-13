from flask import Flask, render_template, request
from java_project import java_project
from contacts import contact_book, add_contact, delete_contact, update_contact, save_contact
from pokedex import pokedex

app = Flask(__name__)


#homepage
@app.route("/")
def about():
    return render_template("about.html")


@app.route("/projects")
def projects():
    return render_template("projects.html")


@app.route("/contact_info")
def contact():
    return render_template('contact_info.html')


@app.route("/skills_and_experience")
def skills_and_experience():
    return render_template('skills_and_experience.html')



# pokedex
app.add_url_rule('/projects/pokedex', view_func=pokedex, methods=["GET", "POST"])

# contact book
app.add_url_rule('/projects/contact_book', view_func=contact_book)
app.add_url_rule('/projects/add_contact', view_func=add_contact, methods=["GET", "POST"])
app.add_url_rule('/projects/delete_contact', view_func=delete_contact, methods=["GET", "POST"])
app.add_url_rule('/projects/update_contact', view_func=update_contact, methods=["GET", "POST"])
app.add_url_rule('/projects/save_contact', view_func=save_contact, methods=["GET", "POST"])

# java project
app.add_url_rule('/projects/java_project', view_func=java_project)


if __name__ == "__main__":
    app.run(debug=True, port=80, host="0.0.0.0")