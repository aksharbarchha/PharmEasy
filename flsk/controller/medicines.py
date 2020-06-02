from flask_mysqldb import MySQL
import mysql.connector
from flask import session
from flask import redirect, url_for, render_template
from controller.cart import cart_items
from controller.utilities import buyid

connection = mysql.connector.connect(host="localhost", database='medicine', user="root", passwd="")



def product_detail(pur):
    query = "SELECT med_name,med_brandname,med_purpose,med_price,med_role,dosage_form,med_id\
             FROM medicine\
             WHERE med_purpose = %s"
    try:
        cur = connection.cursor()
        params = (pur, )
        cur.execute(query, params)
        items = cur.fetchall()
        ite, subtotal, items_len = cart_items()
        buid=buyid()
        # image = ("static/images/d1.jpg","static/images/d7.jpg","static/images/d2.jpg","static/images/d21.jpg","static/images/d23.jpg","static/images/img16.jpg","static/images/img17.jpg","static/images/img21.jpg","static/images/img15.jpg")
    except mysql.connector.Error as err:
        print(err)
        return []
    finally:
        connection.commit()
        cur.close()
    return render_template("product.html", items=items, subtotal=subtotal, items_len=items_len, buid=buid)