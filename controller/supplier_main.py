# from flask_mysqldb import MySQL
import mysql.connector
from flask import session
from controller.cart import cart_items
from flask import redirect, url_for, render_template
from flask import flash
from flask import request
# import MySQLdb
from controller.utilities import connect





def supadd():
    mid = request.form.get('medid', None)
    nam = request.form.get('mname', None)
    bran = request.form.get('bname', None)
    purpos = request.form.get('purpose', None)
    typ = request.form.get('role', None)
    expir = request.form.get('expiry', None)
    dosag = request.form.get('dform', None)
    pric = request.form.get('price', None)
    quantit = request.form.get('quantity', None)
    query = "INSERT into medicine(med_id, med_name, med_brandname, med_purpose,\
             med_expiry, dosage_form,\
             med_price, med_role, med_quantity,\
             med_supplier)\
             VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
    connection = connect()
    cur = connection.cursor()
    try:
        params = (str(mid), nam, bran, purpos, str(expir), dosag, str(pric), typ, str(quantit), session['role'], )
        print(params)
        print(query)
        cur.execute(query, params)
        # flash("Medicine added to the database!!", category="success")
        connection.commit()
    except mysql.connector.Error as err:
        print(err)
        return False
    finally:
        cur.close()
        connection.close()
    return True


def supupdate():
    name = request.form.get('mname', None)
    rol = request.form.get('role', None)
    pric = request.form.get('price', None)
    quantit = request.form.get('quantity', None)
    q = "SELECT med_brandname FROM medicine WHERE med_name=%s and med_role=%s"
    connection = connect()
    cur = connection.cursor()
    params = (name, rol, )
    cur.execute(q, params)
    it = cur.fetchone()
    try:
        if it:
            q1 = "SELECT med_supplier FROM medicine WHERE med_name = %s and med_role=%s"
            params = (name, rol, )
            cur.execute(q1, params)
            it1 = cur.fetchone()
            if it1[0]==session['role']:
                query = "UPDATE medicine SET med_quantity = %s WHERE med_name = %s and med_role = %s and med_supplier = %s"
                query1 = "UPDATE medicine SET med_price = %s WHERE med_name = %s and med_role = %s and med_supplier = %s"
                params = (str(quantit), name, rol, session['role'], )
                params1 = (str(pric), name, rol, session['role'], )
                cur.execute(query, params)
                cur.execute(query1, params1)
                # flash("Medicine updated successfully!!", category="success")
                connection.commit()
                msg = "Medicine updated in the database!!"
                category ="success"
                return msg, category
            else:
                msg = "Medicine is not supplied by you!!"
                category = "warning"
                return msg, category
        else:
            msg = "Medicine does not exist!!"
            category="danger"
            return msg, category
    except mysql.connector.Error as err:
        print(err)
        return []
    finally:
        cur.close()
        connection.close()
