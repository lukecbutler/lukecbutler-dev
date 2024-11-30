from flask import render_template, request, redirect
import sqlite3


def contacts_db_connection():
    conn = sqlite3.connect('databases/contacts.db')
    #import datbase as a dictionary
    conn.row_factory = sqlite3.Row
    return conn

#contact book homepage
def contact_home():
    return render_template("contacts/home_contact.html")

def show_contacts():

    conn = contacts_db_connection()
    contacts = conn.execute('SELECT id, contact_name, contact_number FROM contacts').fetchall()

    return render_template("contacts/show_contacts.html", contacts = contacts)


def add_contact():
    conn = contacts_db_connection()
    
    if request.method == "POST":

        # Retrieve name and number from the form
        name = request.form.get("contact-name")
        number = request.form.get("contact-number")

        # Validate input
        if not name or not number:
            return render_template("contacts/add_contact.html", error="Please fill out both fields.")

        # Find the current maximum ID in the database
        max_id = conn.execute('SELECT MAX(id) FROM contacts').fetchone()[0]

        # If no contacts exist yet, start with ID 1
        if max_id is None:
            next_id = 1
        else:
            next_id = max_id + 1

        # Insert the new contact into the database
        conn.execute('''
            INSERT INTO contacts (id, contact_name, contact_number)
            VALUES (?, ?, ?)
        ''', (next_id, name, number))

        # Commit changes and close the connection
        conn.commit()
        conn.close()

        print(next_id, name, number)

        # Redirect to the home contact page after adding a contact
        return render_template("contacts/home_contact.html")

    # Render the Add Contact form if the request is GET
    return render_template("contacts/add_contact.html")


def delete_contact():
    conn = contacts_db_connection()

    # Fetch all contacts for display
    contacts = conn.execute('SELECT id, contact_name, contact_number FROM contacts').fetchall()

    if request.method == "POST":
        # Retrieve the contact ID from the form
        contact_id_input = request.form.get("contact-id")

        # Validate the input
        if not contact_id_input:
            return render_template("contacts/delete_contact.html", contacts=contacts, error="Please enter a Contact ID.")
        
        if not contact_id_input.isdigit():
            return render_template("contacts/delete_contact.html", contacts=contacts, error="Contact ID must be a number.")

        contact_id = int(contact_id_input)

        # Check if the contact exists
        contact_exists = conn.execute('SELECT 1 FROM contacts WHERE id = ?', (contact_id,)).fetchone()
        if not contact_exists:
            return render_template("contacts/delete_contact.html", contacts=contacts, error="Contact ID does not exist.")

        # Delete the contact
        conn.execute('DELETE FROM contacts WHERE id = ?', (contact_id,))
        conn.commit()

        # Reassign IDs to keep them sequential
        all_contacts = conn.execute('SELECT id FROM contacts ORDER BY id').fetchall()
        index = 1 # reorder contacts starting at 1
        for contact in all_contacts:
            current_id = contact['id'] # Grab current ID from the contact
            conn.execute('UPDATE contacts SET id = ? WHERE id = ?', (index, current_id))
            index += 1 # Increment the index for the next contact        
        
        conn.commit()

        # Fetch updated contacts list after deletion and reindexing
        contacts = conn.execute('SELECT id, contact_name, contact_number FROM contacts').fetchall()

        # Render the updated page
        return render_template("contacts/delete_contact.html", contacts=contacts)

    # Render the delete contact page if request is GET
    return render_template("contacts/delete_contact.html", contacts=contacts)