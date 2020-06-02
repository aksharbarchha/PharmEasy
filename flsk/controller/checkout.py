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


def normal_checkout():

    items, subtotal, items_len = cart_items()
    normalc = session['cdis']
    specialc = session['pdis']
    buid=buyid()
    return render_template("checkout.html", items=items, subtotal=subtotal, items_len=items_len, normalc=normalc, specialc=specialc, buid=buid)

def checkout_details():

    address = (str(request.form.get('address', None)) + ", "+ str(request.form.get('city', None)) + ", "+ str(request.form.get('postcode', None)) + ", "+ str(request.form.get('zone_id', None)))
    cur = connection.cursor()
    try:
        query = "INSERT into address(buyer_id, buyer_address)\
                 VALUES (%s, %s)"
        
        params = (session['user'], address, )
        cur.execute(query, params)

        items, subtotal, item_len = cart_items()
        sum=0.00
        for item in items:
            sum=sum+round(item[1]*item[9]*1.2, 2)
        sum=sum+60-session['cdis']-session['pdis']
        orders = []
        for item in items:
            orders.append((item[9], round(item[1]*item[9]*1.2, 2),
                           'Pending', request.form.get('payment_method', None),
                           address, item[4], item[7], sum, ))

        values = []
        for order in orders:
            params = (session['user'], order[0], order[1], order[2], order[3],
                      order[4], order[5], order[6], order[7])
            values.append(params)
        query = "INSERT into orders(buyer_id, order_quantity,\
                 order_date, order_price,\
                 delivery_status, payment_method, delivery_address,\
                 med_id, med_role, order_total)\
                 VALUES (%s, %s, NOW() , %s, %s, %s, %s, %s, %s, %s)"
        cur.executemany(query, values)

        values = []
        for item in items:
            params = (item[9], item[4], item[7], )
            values.append(params)
        query = "UPDATE medicine SET med_quantity = med_quantity - %s\
                 WHERE med_id = %s and med_role=%s"
        cur.executemany(query, values)

        values = []
        for item in items:
            params = (item[0], )
            values.append(params)

        query = "DELETE FROM cart_items WHERE item_id = %s "
        cur.executemany(query, values)

        connection.commit()
    except mysql.connector.Error as err:
        print(err)
        flash("Could not place your order. Try again later.", category="warning")
        connection.rollback()
        return redirect(url_for('checkout'))
    finally:
        cur.close()
        connection.close()
    session['cdis'] = 0.00
    flash("Order has been placed successfully!!", category="success")
    return redirect(url_for('mhome'))