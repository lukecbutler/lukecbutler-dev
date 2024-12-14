from flask import render_template, request, redirect, url_for
import sqlite3

############################################################
# Main Contact Page #
############################################################

def contact_book():
    conn = sqlite3.connect('databases/contacts.db')
    contacts = conn.execute("""SELECT id, first_name, last_name, phone_number FROM contacts""").fetchall()
    return render_template("contacts/contact_book.html", contacts = contacts)


def add_contact():
    #connect to db & get form values
    conn = sqlite3.connect('databases/contacts.db')
    cursor = conn.cursor()
    contacts = conn.execute("""SELECT id, first_name, last_name, phone_number FROM contacts""").fetchall()

    firstName = request.form.get('contact_first_name')
    lastName = request.form.get('contact_last_name')
    phoneNumber = request.form.get('contact_phone_number')

    # error handling
    if not firstName or not lastName or not phoneNumber:
        return render_template('contact_book.html', contacts=contacts, error = "Please fill in all fields.")

    if not phoneNumber.isdigit():
        return render_template('contact_book.html', contacts=contacts, error="Phone number must contain only numbers.")


    #commit sql query with form values
    cursor.execute("""INSERT INTO contacts (first_name, last_name, phone_number)
                    VALUES(?, ?, ?)""", (firstName, lastName, phoneNumber,))
    conn.commit()
    contacts = conn.execute('SELECT id, first_name, last_name, phone_number FROM contacts').fetchall()
    conn.close()
    return redirect(url_for("contact_book"))


def delete_contact():
    conn = sqlite3.connect('databases/contacts.db')
    contact_id = request.form.get("contact_id")
    conn.execute('DELETE FROM contacts WHERE id = ?', (contact_id,))
    conn.commit()

    return redirect(url_for("contact_book"))


def update_contact():
    conn = sqlite3.connect('databases/contacts.db')
    cursor = conn.cursor()
    contact_id = request.form.get("contact_id")
    # Fetch current contact details
    contact = cursor.execute("SELECT first_name, last_name, phone_number FROM contacts WHERE id = ?", (contact_id,)).fetchone()
    return render_template("contacts/update_contact.html", contact=contact, contact_id=contact_id)


def save_contact():
    newFirstName = request.form.get('new_contact_first_name')
    newLastName = request.form.get('new_contact_last_name')
    newPhoneNumber = request.form.get('new_contact_phone_number')
    contact_id = request.form.get('contact_id')

    conn = sqlite3.connect('databases/contacts.db')
    cursor = conn.cursor()

    if not newFirstName or not newLastName or not newPhoneNumber:
        return render_template(
            'update_contact.html',
            contact=(newFirstName, newLastName, newPhoneNumber),
            contact_id=contact_id,
            error="Please fill in all fields."
        )

    if not newPhoneNumber.isdigit():
        return render_template(
            'update_contact.html',
            contact=(newFirstName, newLastName, newPhoneNumber),
            contact_id=contact_id,
            error="Phone number must contain only numbers."
        )


    # Update the database
    cursor.execute("""
        UPDATE contacts
        SET first_name = ?, last_name = ?, phone_number = ?
        WHERE id = ?
    """, (newFirstName, newLastName, newPhoneNumber, contact_id))
    conn.commit()


    # Render the updated contact_book.html
    return redirect(url_for("contact_book"))