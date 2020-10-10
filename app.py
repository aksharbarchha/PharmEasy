from flask_bcrypt import Bcrypt
from flask import request,session
from flask import flash
from flask_mysqldb import MySQL
import mysql.connector
from flask import Flask
from flask import redirect, url_for, render_template
import yaml
import MySQLdb,random,datetime
from functools import wraps
from controller.utilities import category_items, cart_value, upass, buyid, connect
from controller.order import orhistory
from controller.cart import add_item, cart_items, delete_item, update_item
from controller.medicines import product_detail
from controller.checkout import normal_checkout, checkout_details
from controller.product import single_product
from controller.search import query_search
from controller.favourites import fav, favourite
from controller.supplier import ssearch, supproduct_detail
from controller.supplier_main import supadd, supupdate

app = Flask(__name__)
app.secret_key = "super secret key"


# db = yaml.load(open('db.yaml'))
app.config['MYSQL_HOST'] = 'remotemysql.com:3306'
app.config['MYSQL_USER'] = 'GvRAQlut3Z'
app.config['MYSQL_PASSWORD'] = 'zz8qpNNOLJ'
app.config['MYSQL_DB'] = 'GvRAQlut3Z'

mysql = MySQL(app)
bcrypt = Bcrypt(app)



@app.route("/")
@app.route("/home")
def home():
    print(dir(mysql))
    return render_template("index.html")


# def index():
#     return "Hello"
def login_required(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if 'email' in session:
            return f(*args, **kwargs)
        else:
            # if(request.endpoint in ['auth', 'registration']):
            #     return f(*args, **kwargs)
            flash("You need to login first!!", category="danger")
            return redirect(url_for('login'))
    return wrap


def customer_required(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if 'email' in session:
            if session['type']=='customer' or 'powner':
                return f(*args, **kwargs)
            else :
                flash("You need to login as customer first!!", category="danger")
                return redirect(url_for('login'))
        else:
            # if(request.endpoint in ['auth', 'registration']):
            #     return f(*args, **kwargs)
            flash("You need to login first!!", category="danger")
            return redirect(url_for('login'))
    return wrap


def supplier_required(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if 'email' in session:
            if session['type']=='supplier':
                return f(*args, **kwargs)
            else :
                flash("You need to login as supplier first!!", category="danger")
                return redirect(url_for('login'))
        else:
            # if(request.endpoint in ['auth', 'registration']):
            #     return f(*args, **kwargs)
            flash("You need to login first!!", category="danger")
            return redirect(url_for('login'))
    return wrap


@app.route("/logout")
@login_required
def logout():
    session.clear()
    flash("You have been successfully logged out!!", category="success")
    return redirect(url_for('home'))


@app.route("/login", methods=['POST', 'GET'])
def login():
    # m=message
    if request.method =='POST':
        email = request.form['email']  # access the data inside 
        password = request.form['pass']
        query = "SELECT * FROM login WHERE user_email = "+"'"+email+"'"
        # query1 = "SELECT user_category FROM login WHERE user_email=%s"
        connection = connect()
        cur=connection.cursor()
        try:
            cur.execute(query)
            user = cur.fetchone()
            connection.commit()
            if user:
                if bcrypt.check_password_hash(user[2], password):
                    session['email'] = email
                    session['user'] = user[0]
                    session['type'] = user[6]
                    session['person'] = user[3]
                    session['cdis'] = 0.00
                    session['pdis'] = 0.00
                    # if session['user'] == 'customew'
                    if user[6]=="supplier":
                        session['role'] = user[3]
                        flash("Login Successfull!!", 'success')
                        return redirect(url_for('supplier'))
                    else:
                        flash("Login Successfull!!", 'success')
                        return redirect(url_for('mhome'))
                else:
                    flash("Password incorrect!!", 'danger')
                    return redirect(url_for('login'))
            else:
                flash("Email id does not exist!!", 'danger')
                return redirect(url_for('login'))
        except (MySQLdb.Error, MySQLdb.Warning) as e:
            print(e)
            return None
        finally:
            cur.close()
            connection.close()
    #     user = Login.query.filter_by(user_email=email).first()
 
        # if user and bcrypt.check_password(password=password):
        #     connection.commit()
        #     cur.close()
        #     # message = 'Logged In Successfully!!'
        #     return redirect(url_for('customer'))
        # else:
        #     return redirect(url_for('login'))
        #     # message = 'Wrong email or password'
    return render_template("abc.html", title='Login')

@app.route("/signup", methods=['POST', 'GET'])
def signup():
    # message = ' '
    if request.method == 'POST':
        hashed_pass = bcrypt.generate_password_hash(request.form['pass']).decode('utf-8')
        fname = request.form['fname']
        lname = request.form['lname']
        email = request.form['email']
        address = request.form['address']
        category = request.form['category']
        connection = connect()
        cur = connection.cursor()
        cur.execute("SELECT * FROM login WHERE user_email = %s", (email, ))
        existing_user = cur.fetchone()
        if existing_user is None:
            cur.execute("INSERT INTO login(user_email, user_pass, user_first_name, user_last_name, user_address, user_category) VALUES(%s, %s, %s, %s, %s, %s)",(email, hashed_pass, fname, lname, address, category))
            connection.commit()
            cur.close()
            connection.close()
            # message = "SignUp successfull!!"
            flash("SignUp Successfull!!", 'success')
            return redirect(url_for('login'))
        # existing_user = Login.query.filter_by(user_email=email).first()  # Check if user exists
        # if existing_user is None:
        #     user = Login(user_id=i, user_email=email, user_pass=hashed_pass, user_first_name=fname, user_last_name=lname, user_address=address, user_category=category)
        #     db.session.add(user)
        #     db.session.commit()
        
        else:
            flash("Email id already exists!!", 'danger')
            cur.close()
            connection.close()
            return redirect(url_for('signup'))
            # message = "User already exists with that email id"
    return render_template("signup.html", title='SignUp')


@app.route("/cart")
@customer_required
def cart():
    items, subtotal, items_len = cart_items()
    buid = buyid()
    coupon = 0.00
    if session['type']=='powner':
        dis = subtotal*0.25
        session['pdis'] = dis
        val = 200
    else:
        dis = 0.00
        val = 1
    return render_template("cart.html", items=items, val=val, subtotal=subtotal, items_len=items_len, coupon=coupon, dis=dis, buid=buid)


@app.route("/ccoupon", methods=['POST'])
@customer_required
def coupon():
    items, subtotal, items_len = cart_items()
    buid = buyid()
    couponcode = request.form.get('coupo', None)
    if session['type']=='customer':
        if couponcode=='SOMAIYA15':
            flash("Coupon applied successfully!!", category="success")
            coupon = subtotal*0.15
            session['cdis'] = coupon
            dis = 0.00
            val = 1
            return render_template("cart.html", items=items, val=val, subtotal=subtotal, items_len=items_len, coupon=coupon, dis=dis, buid=buid)
        else:
            flash("Coupon Invalid!!", category="danger")
            coupon = 0.00
            dis = 0.00
            val = 1
            return render_template("cart.html", items=items, val=val, subtotal=subtotal, items_len=items_len, coupon=coupon, dis=dis, buid=buid)
    else:
        flash("Coupon Discount is only for Normal Customers and not for Pharmacy Store Owners!!", category="danger")
        coupon = 0.00
        dis = subtotal*0.25
        session['pdis'] = dis
        val = 200
        return render_template("cart.html", items=items, val=val, subtotal=subtotal, items_len=items_len, coupon=coupon, dis=dis, buid=buid)



@app.route("/product/<pur>", methods=['POST','GET'])
@customer_required
def product(pur):
    return product_detail(pur)


@app.route("/supproduct/<pur>", methods=['POST','GET'])
@supplier_required
def supproduct(pur):
    return supproduct_detail(pur)


@app.route("/checkout", methods=['POST','GET'])
@customer_required
def checkout():
    if(request.method == 'POST'):
        return checkout_details()
    if(request.method == 'GET'):
        return normal_checkout()
    

@app.route("/search", methods=['POST','GET'])
@customer_required
def qsearch():
    return query_search()



@app.route("/favourites", methods=['POST','GET'])
@customer_required
def favourites():
    if (request.method == 'GET'):
        return favourite()
    if (request.method == 'POST'): 
        return fav()


@app.route("/hdemo", methods=['POST', 'GET'])
def demo():
    if request.method=='POST':
        flash("Thank you for your Feedback!!", category="success")
        return redirect(request.referrer)


@app.route("/supplier", methods=['POST','GET'])
@supplier_required
def supplier():
    if request.method == 'GET':
        return render_template("supplier.html")
    if request.method == 'POST':
        if(request.form.get('type', None) == 'add'):
            if(supadd()):
                flash("Medicine added to the database!!", category="success")
            else:
                flash("Failed to add medicine to the database!!", category="danger")
        if(request.form.get('type', None) == 'update'):
            msg, category=supupdate()
            flash(msg, category=category)
        return redirect(request.referrer)

@app.route("/supsearch", methods=['POST','GET'])
@supplier_required
def qsearchsup():
    return ssearch()


@app.route("/ohistory/<bid>", methods=['POST','GET'])
@customer_required
def ohistory(bid):
    return orhistory(bid)


@app.route("/updatepassword", methods=['POST','GET'])
@login_required
def updatepassword():
    if request.method=='GET':
        return render_template("password.html")
    if request.method=='POST':
        return upass()



@app.route("/singleproduct/<pid>/<rol>", methods=['POST','GET'])
@customer_required
def singleproduct(pid, rol):
    return single_product(pid, rol)



@app.route("/cart_item", methods=['POST'])
@customer_required
def item():
    if request.method == "POST":
        if(request.form.get('type', None) == 'delete'):
            delete_item(request.form.get('item_id'))
            flash("Item removed from the cart!!", category="success")
        elif(request.form.get('type', None) == 'update'):
            msg, cat = update_item(request.form.get('item_id', None),
                              request.form.get('quantity', None),
                              request.form.get('med_id', None),
                              request.form.get('med_role', None))
            flash(msg, category=cat)
        else:
            if session['type']=="powner":
                add_item(request.form.get('med_id', None),
                     200,
                     request.form.get('med_role', None))
            else:
                add_item(request.form.get('med_id', None),
                         request.form.get('quantity', None),
                         request.form.get('med_role', None))
        return redirect(request.referrer)
    


@app.route("/mhome")
@customer_required
def mhome():
    categories=category_items()
    categories1=category_items()
    categories2=category_items()
    subtotal, len_items = cart_value()
    buid = buyid()
    return render_template("home.html", categories=categories, categories1=categories1, categories2=categories2 ,subtotal=subtotal, len_items=len_items, buid=buid)



if __name__ == "__main__":
    app.run(debug=True)