from flask_mysqldb import MySQL
import mysql.connector
from flask import session
from flask import flash


connection = mysql.connector.connect(host="localhost", database='medicine', user="root", passwd="")

def cart_items():
    query = "SELECT item_id, med_price, med_quantity, med_name,\
         medicine.med_id, med_brandname, med_purpose,\
         med_role, dosage_form, cart_items.item_quantity FROM medicine\
         INNER JOIN cart_items ON medicine.med_id = cart_items.med_id and medicine.med_role = cart_items.med_rol\
         WHERE buyer_user = %s"
    cur = connection.cursor()
    try:
        
        params = (session['user'],)
        cur.execute(query, params)
        items = cur.fetchall()
        print(items)
    except mysql.connector.Error as err:
        return [], 0, 0
    finally:
        cur.close()
    subtotal = 0
    couponcode = 0
    for item in items:
        subtotal += item[1]*item[9]
    items_len = len(items)
    return items, subtotal, items_len


def add_item(med_id, quantity, med_role):
    query = "SELECT med_quantity FROM medicine WHERE med_id = %s and med_role = %s"
    cur = connection.cursor()
    try:
        
        params = (med_id, med_role, )
        cur.execute(query, params)
        med_quantity = cur.fetchone()
        if not med_quantity:
            print("wrong id")
        elif int(quantity) > int(med_quantity[0]):
            quantity = int(med_quantity[0])
            flash("Available Quantity is " + str(med_quantity[0])
                  + " sheets only !! Minimum quantity should be 200 sheets", category="danger")
        else:
            buyer_user = session['user']
            query = "INSERT into cart_items \
                     (item_quantity, buyer_user, med_id, med_rol)\
                     VALUES (%s, %s, %s, %s)"
            try:
                cur = connection.cursor()
                params = (quantity, buyer_user, med_id, med_role, )
                cur.execute(query, params)
                flash("Medicine added to the cart!!","success")
                connection.commit()
            except mysql.connector.Error as err:
                print(err)
            finally:
                cur.close()
    except mysql.connector.Error as err:
        print(err)
        return
    finally:
        cur.close()

    



def delete_item(item_id):
    query = "DELETE FROM cart_items WHERE item_id = %s"
    cur = connection.cursor()

    try:
        params = (item_id,)
        cur.execute(query, params)
        connection.commit()
    except mysql.connector.Error as err:
        print(err)
    finally:
        cur.close()



def update_item(item_id, quantity, med_id, med_role):
    query = "SELECT med_quantity FROM medicine WHERE med_id = %s and med_role = %s"
    cur = connection.cursor()
    try:
        params = (med_id, med_role, )
        print(params)
        cur.execute(query, params)
        med_quantity = cur.fetchone()
        if not med_quantity:
            print("wrong id")
        else:
            if int(quantity) > int(med_quantity[0]):
                msg = "Could not update quantity. Total "+ med_quantity[0] +" sheets available!!"
                cat = "danger"
                return msg, cat
    except mysql.connector.Error as err:
        print(err)
    finally:
        cur.close()

    query = "UPDATE cart_items SET item_quantity = %s WHERE item_id = %s and med_rol = %s"
    try:
        cur = connection.cursor()
        params = (int(quantity), item_id, med_role, )
        cur.execute(query, params)
        connection.commit()
    except mysql.connector.Error as err:
        print(err)
    finally:
        cur.close()
    msg = "Quantity Updated successfully!!"
    cat = "success"
    return msg, cat