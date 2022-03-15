from flask import Flask, render_template
import psycopg2
app = Flask(__name__)


conn = psycopg2.connect(
	host='192.168.0.20',
	database='csdashboard',
	user='webuser1',
	password='ecu1')



@app.route('/')
def index():
	cur = conn.cursor()
	cur.execute("SELECT * from faculty;")
	faculty = cur.fetchall()
	col_names = [desc[0] for desc in cur.description]
	cur.close()
	conn.close()
	
	return render_template("index.html", col_names=col_names, faculty = faculty)

if __name__ == "__main__":
	app.run()
