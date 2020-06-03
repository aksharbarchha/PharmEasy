from flask_mysqldb import MySQL
import mysql.connector
from flask import session
from controller.cart import cart_items
from flask import redirect, url_for, render_template
from flask import flash
from flask import request
import MySQLdb
from controller.utilities import connect






def ssearch():
    se = request.form.get('searc', None)
    typ = request.form.get('type', None)
    sup = session['role']
    if typ:
        query = "SELECT med_name,med_brandname,med_purpose,med_price,med_role,dosage_form,med_quantity,med_id\
                 FROM medicine\
                 WHERE med_name LIKE %s and med_role=%s and med_supplier=%s\
                 OR med_name LIKE %s and med_role=%s and med_supplier=%s\
                 OR med_name LIKE %s and med_role=%s and med_supplier=%s\
                 OR med_name LIKE %s and med_role=%s and med_supplier=%s"
        params = (se+"%", typ, sup, "%"+se, typ, sup, "%"+se+"%", typ, sup, se, typ, sup, )
    else:
        query = "SELECT med_name,med_brandname,med_purpose,med_price,med_role,dosage_form,med_quantity,med_id\
                 FROM medicine\
                 WHERE med_name LIKE %s and med_supplier=%s\
                 OR med_name LIKE %s and med_supplier=%s\
                 OR med_name LIKE %s and med_supplier=%s\
                 OR med_name = %s and med_supplier=%s"
        params = (se+"%", sup, "%"+se, sup, "%"+se+"%", sup, se, sup, )
    connection = connect()
    cur = connection.cursor()
    try:
        cur.execute(query, params)
        items = cur.fetchall()
        if len(items)==0:
            flash("No results found related to your search!!", category="warning")
            return redirect(url_for('supplier'))
        # image = ("static/images/d1.jpg","static/images/d7.jpg","static/images/d2.jpg","static/images/d21.jpg","static/images/d23.jpg","static/images/img16.jpg","static/images/img17.jpg","static/images/img21.jpg","static/images/img15.jpg")
    except mysql.connector.Error as err:
        print(err)
        return []
    finally:
        connection.commit()
        cur.close()
        connection.close()
    return render_template('supsearch.html', items=items)


def supproduct_detail(pur):
    query = "SELECT med_name,med_brandname,med_purpose,med_price,med_role,dosage_form,med_id,med_quantity\
             FROM medicine\
             WHERE med_purpose = %s and med_supplier=%s"
    connection = connect()
    cur = connection.cursor()
    try:
        
        params = (pur, session['role'], )
        cur.execute(query, params)
        items = cur.fetchall()
        # image = ("static/images/d1.jpg","static/images/d7.jpg","static/images/d2.jpg","static/images/d21.jpg","static/images/d23.jpg","static/images/img16.jpg","static/images/img17.jpg","static/images/img21.jpg","static/images/img15.jpg")
    except mysql.connector.Error as err:
        print(err)
        return []
    finally:
        connection.commit()
        cur.close()
        connection.close()
    return render_template("supproduct.html", items=items)