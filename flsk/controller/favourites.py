from flask_mysqldb import MySQL
import mysql.connector
from flask import session
from controller.cart import cart_items
from flask import redirect, url_for, render_template
from flask import flash
from flask import request
import MySQLdb


connection=mysql.connector.connect(host="localhost", database='medicine', user="root", passwd="")


def favourite():
    query = "SELECT med_name,med_brandname,med_purpose,med_price,medicine.med_role,dosage_form,medicine.med_id,med_quantity\
             FROM medicine\
             INNER JOIN favourite ON medicine.med_id = favourite.med_id and medicine.med_role = favourite.med_role\
             WHERE buyer_user = %s"
    cur = connection.cursor()
    try:
        params = (session['user'], )
        cur.execute(query, params)
        items = cur.fetchall()
        ite, subtotal, items_len = cart_items()
        # image = ("static/images/d1.jpg","static/images/d7.jpg","static/images/d2.jpg","static/images/d21.jpg","static/images/d23.jpg","static/images/img16.jpg","static/images/img17.jpg","static/images/img21.jpg","static/images/img15.jpg")
    except mysql.connector.Error as err:
        print(err)
        return []
    finally:
        cur.close()
    return render_template("favourite.html", items=items, subtotal=subtotal, items_len=items_len)




def fav():
    mid = request.form.get('med_id', None)
    r = request.form.get('med_role', None)
    buyer_user = session['user']
    query = "INSERT into favourite \
             (med_id,med_role,buyer_user)\
             VALUES (%s, %s, %s)"
    cur = connection.cursor()
    try:
        params = (mid, r, str(buyer_user), )
        cur.execute(query, params)
        flash("Medicine added to Favourites!!","success")
        connection.commit()
    except mysql.connector.Error as err:
        print(err)
    finally:
        cur.close()
    return redirect(url_for('favourites'))