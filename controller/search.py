# from flask_mysqldb import MySQL
import mysql.connector
from flask import session
from controller.cart import cart_items
from flask import redirect, url_for, render_template
from flask import flash
from flask import request
import MySQLdb
from controller.utilities import buyid
from controller.utilities import connect





def query_search():
    ite, subtotal, items_len = cart_items()
    se = request.form.get('searc', None)
    typ = request.form.get('type', None)
    buid=buyid()
    if typ:
        query = "SELECT med_name,med_brandname,med_purpose,med_price,med_role,dosage_form,med_id,med_quantity\
                 FROM medicine\
                 WHERE med_name LIKE %s and med_role=%s\
                 OR med_name LIKE %s and med_role=%s\
                 OR med_name LIKE %s and med_role=%s\
                 OR med_name LIKE %s and med_role=%s"
        params = (se+"%", typ, "%"+se, typ, "%"+se+"%", typ, se, typ, )
    else:
        query = "SELECT med_name,med_brandname,med_purpose,med_price,med_role,dosage_form,med_id,med_quantity\
                 FROM medicine\
                 WHERE med_name LIKE %s \
                 OR med_name LIKE %s \
                 OR med_name LIKE %s \
                 OR med_name = %s "
        params = (se+"%", "%"+se, "%"+se+"%", se, )
    connection = connect()
    cur = connection.cursor()
    try:
        cur.execute(query, params)
        items = cur.fetchall()
        print(query)
        if len(items)==0:
            flash("No results found related to your search!!", category="warning")
            return redirect(url_for('mhome'))
        # image = ("static/images/d1.jpg","static/images/d7.jpg","static/images/d2.jpg","static/images/d21.jpg","static/images/d23.jpg","static/images/img16.jpg","static/images/img17.jpg","static/images/img21.jpg","static/images/img15.jpg")
    except mysql.connector.Error as err:
        print(err)
        return render_template('search.html', items=ite, subtotal=subtotal, items_len=items_len, buid=buid)
    finally:
        connection.commit()
        cur.close()
        connection.close()
    return render_template('search.html', items=items, subtotal=subtotal, items_len=items_len, buid=buid)
    