# from flask_mysqldb import MySQL
import mysql.connector
from flask import session, flash, Flask
from flask import request
from flask_bcrypt import Bcrypt
from flask import redirect, url_for, render_template




app = Flask(__name__)
app.secret_key = "super secret key"
# mysql = MySQL(app)
bcrypt = Bcrypt(app)
# db = yaml.load(open('db.yaml'))



def connect():
    return mysql.connector.connect(host="remotemysql.com", database="GvRAQlut3Z", user="GvRAQlut3Z", passwd="zz8qpNNOLJ", port = 3306)


def category_items():
    query = "SELECT med_name,med_brandname,med_purpose,med_price,med_role,dosage_form,med_id\
             FROM medicine\
             ORDER BY RAND() LIMIT 9"
    connection = connect()
    cur = connection.cursor()
    try:
        cur.execute(query, )
        items = cur.fetchall()
        # image = ("static/images/d1.jpg","static/images/d7.jpg","static/images/d2.jpg","static/images/d21.jpg","static/images/d23.jpg","static/images/img16.jpg","static/images/img17.jpg","static/images/img21.jpg","static/images/img15.jpg")
    except mysql.connector.Error as err:
        print(err)
        return []
    finally:
        connection.commit()
        cur.close()
        connection.close()
    return items

def buyid():
    query = "SELECT user_id\
             FROM login\
             WHERE user_email = %s"
    connection = connect()
    cur = connection.cursor()
    try:
        params = (session['email'],)
        cur.execute(query, params)
        b = cur.fetchone()
        print(b)
        # image = ("static/images/d1.jpg","static/images/d7.jpg","static/images/d2.jpg","static/images/d21.jpg","static/images/d23.jpg","static/images/img16.jpg","static/images/img17.jpg","static/images/img21.jpg","static/images/img15.jpg")
    except mysql.connector.Error as err:
        print(err)
        return []
    finally:
        connection.commit()
        cur.close()
        connection.close()
    print(b[0])
    return b[0]


def cart_value():
    query = "SELECT item_id, med_price, med_quantity, med_name,\
         medicine.med_id, med_brandname, med_purpose,\
         med_role, dosage_form, cart_items.item_quantity FROM medicine\
         INNER JOIN cart_items ON medicine.med_id = cart_items.med_id and medicine.med_role = cart_items.med_rol\
         WHERE buyer_user = %s"
    connection = connect()   
    cur = connection.cursor()
    try:
        params = (session['user'],)
        cur.execute(query, params)
        items = cur.fetchall()
    except mysql.connector.Error as err:
        return [], 0, 0
    finally:
        cur.close()
        connection.close()
    subtotal = 0
    for item in items:
        subtotal += item[1]*item[9]
    len_items = len(items)
    return subtotal, len_items


def upass():
    ppass = request.form.get('ppass', None)
    npass = request.form.get('npass', None)
    cpass = request.form.get('cpass', None)
    q = "SELECT user_pass FROM login WHERE user_id=%s"
    connection = connect()
    cur = connection.cursor()
    params = (session['user'], )
    cur.execute(q, params)
    hpass = cur.fetchone()
    try:
        if bcrypt.check_password_hash(hpass[0], ppass):
            if npass==cpass:
                hashed_pass = bcrypt.generate_password_hash(npass).decode('utf-8')
                q1 = "UPDATE login SET user_pass = %s WHERE user_id = %s"
                params = (hashed_pass, session['user'], )
                cur.execute(q1, params)
                connection.commit()
                flash("Password Updated!!", category="success")
                return redirect(url_for('mhome'))
            else:
                flash("Passwords do not match!!", category="danger")
                return redirect(url_for('updatepassword'))
        else:
            flash("Wrong Password Entered!!", category="danger")
            return redirect(url_for('updatepassword'))
    except mysql.connector.Error as err:
        print(err)
        return []
    finally:
        cur.close()
        connection.close()
