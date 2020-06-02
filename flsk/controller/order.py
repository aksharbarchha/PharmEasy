from flask_mysqldb import MySQL
import mysql.connector
from flask import session
from controller.cart import cart_items
from flask import redirect, url_for, render_template
from flask import flash
from flask import request
import MySQLdb
from controller.utilities import buyid


connection=mysql.connector.connect(host="localhost", database='medicine', user="root", passwd="")

def orhistory(bid):
    query = "SELECT order_id, order_quantity, order_date, order_price, delivery_status, payment_method, delivery_address, med_id, med_role, order_total, buyer_id\
             FROM orders\
             WHERE buyer_id= %s"
    cur = connection.cursor()
    try:
        params = (str(bid), )
        cur.execute(query, params)
        items = cur.fetchall()
        print(items)
        ite, subtotal, len_items = cart_items()  
        buid=buyid()     
        # image = ("static/images/d1.jpg","static/images/d7.jpg","static/images/d2.jpg","static/images/d21.jpg","static/images/d23.jpg","static/images/img16.jpg","static/images/img17.jpg","static/images/img21.jpg","static/images/img15.jpg")
    except mysql.connector.Error as err:
        print(err)
        return []
    finally:
        cur.close()
    return render_template("orderhistory.html", items=items, subtotal=subtotal, len_items=len_items, buid=buid)