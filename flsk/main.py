from flask_bcrypt import Bcrypt
from flask import request,session
from flask import flash
from flask_mysqldb import MySQL
import mysql.connector
from flask import Flask
from flask import redirect, url_for, render_template
import yaml
import MySQLdb

app = Flask(__name__)
app.secret_key = "super secret key"


# db = yaml.load(open('db.yaml'))
# app.config['MYSQL_HOST'] = db['mysql_host']
# app.config['MYSQL_USER'] = db['mysql_user']
# app.config['MYSQL_PASSWORD'] = db['mysql_password']
# app.config['MYSQL_DB'] = db['mysql_db']
connection = mysql.connector.connect(host="localhost",database='medicine', user="root", passwd="12345678")

mysql = MySQL(app)
bcrypt = Bcrypt(app)


@app.route("/")
@app.route("/home")
def home():
    return render_template("index.html")


@app.route("/login", methods=['POST', 'GET'])
def login():
    # m=message
    if request.method =='POST':
        email = request.form['email']  # access the data inside 
        password = request.form['pass']
        query = "SELECT * FROM login WHERE user_email = "+"'"+email+"'"
        try:
            cur=connection.cursor()
            cur.execute(query)
            user = cur.fetchone()
            connection.commit()
            if user:
                if bcrypt.check_password_hash(user[2], password):
                    session['email'] = email
                    session['user'] = user[5]
                    # if session['user'] == 'customew'
                    # message = str('Login Successfull!!')
                    flash("Login Successfull!!", 'success')
                    return redirect(url_for('customer'))
                else:
                    flash("Password incorrect!!", 'danger')
                    return redirect(url_for('login'))
            else:
                flash("Email id does not exist!!", 'danger')
                return redirect(url_for('login'))
        except (MySQLdb.Error, MySQLdb.Warning) as e:
            print(e)
            return None
        cur.close()
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
        cur = connection.cursor()
        cur.execute("SELECT * FROM login WHERE user_email = %s", (email, ))
        existing_user = cur.fetchone()
        if existing_user is None:
            cur.execute("INSERT INTO login(user_email, user_pass, user_first_name, user_last_name, user_address, user_category) VALUES(%s, %s, %s, %s, %s, %s)",(email, hashed_pass, fname, lname, address, category))
            connection.commit()
            cur.close()
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
            return redirect(url_for('signup'))
            # message = "User already exists with that email id"
    return render_template("signup.html", title='SignUp')


@app.route("/about")
def about():
    return "About Page"


@app.route("/customer")
def customer():
    return render_template("customer.html", title='Customer')


if __name__ == "__main__":
    app.run(debug=True)