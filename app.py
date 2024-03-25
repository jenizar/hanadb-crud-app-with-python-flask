from flask import Flask,render_template,request,redirect,url_for,flash
import sqlite3 as sql
import platform
from hdbcli import dbapi
app=Flask(__name__)

@app.route("/")
@app.route("/index")
def index():
    con = dbapi.connect(
    address="2a5b9eaa-3a38-42fd-b10f-fc34db808672.hana.trial-us10.hanacloud.ondemand.com",
    port=443,
    user="DBADMIN",
    password="MyHanadb911_")

    #con=sql.connect("db_web.db")
    #con.row_factory=sql.Row
    cur=con.cursor()
    cur.execute("select * from HOTEL.CITY ORDER BY NAME;")

    data=cur.fetchall()
    cur.execute("SELECT COUNT(*) FROM HOTEL.CITY;")
    data_count = cur.fetchone()[0]
    data_records = str(data_count)
    
    return render_template("index.html",datas=data,dbrecords=data_records)

@app.route("/add_data",methods=['POST','GET'])
def add_data():
    if request.method=='POST':
        zip1=request.form['zip']
        name1=request.form['name']
        state1=request.form['state']        
        con = dbapi.connect(
       address="2a5b9eaa-3a38-42fd-b10f-fc34db808672.hana.trial-us10.hanacloud.ondemand.com",
       port=443,
       user="DBADMIN",
       password="MyHanadb911_")
        cur=con.cursor()
        sql = "INSERT INTO hotel.city(zip, name, state) VALUES (?,?,?)"
        val = (zip1,name1,state1)
        cur.execute(sql, val)
        con.commit()
        flash('Data Added','success')
        return redirect(url_for("index"))
    return render_template("add_data.html")

@app.route("/edit_data/<string:zip>",methods=['POST','GET'])
def edit_data(zip):
    if request.method=='POST':
        zip=request.form['zip']
        name=request.form['name']
        state=request.form['state']
        con = dbapi.connect(
       address="2a5b9eaa-3a38-42fd-b10f-fc34db808672.hana.trial-us10.hanacloud.ondemand.com",
       port=443,
       user="DBADMIN",
       password="MyHanadb911_")
        cur=con.cursor()
        cur.execute("update hotel.city set NAME=?,STATE=? where ZIP=?",(name,state,zip))
        con.commit()
        flash('Data Updated','success')
        return redirect(url_for("index"))
    con = dbapi.connect(
       address="2a5b9eaa-3a38-42fd-b10f-fc34db808672.hana.trial-us10.hanacloud.ondemand.com",
       port=443,
       user="DBADMIN",
       password="MyHanadb911_")
    cur=con.cursor()
    cur.execute("select * from hotel.city where zip=?",(zip,))
    data=cur.fetchone()
    return render_template("edit_data.html",datas=data)
    
@app.route("/delete_data/<string:zip>",methods=['GET'])
def delete_data(zip):
    con = dbapi.connect(
       address="2a5b9eaa-3a38-42fd-b10f-fc34db808672.hana.trial-us10.hanacloud.ondemand.com",
       port=443,
       user="DBADMIN",
       password="MyHanadb911_")
    cur=con.cursor()
    cur.execute("delete from hotel.city where zip=?",(zip))
    con.commit()
    flash('Data Deleted','warning')
    return redirect(url_for("index"))
    
if __name__=='__main__':
    app.secret_key='admin911'
    app.run(debug=True)
