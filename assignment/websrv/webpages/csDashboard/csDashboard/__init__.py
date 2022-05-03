from flask import Flask, render_template, flash, request, url_for, redirect
import psycopg2
from flask_navigation import Navigation

app = Flask(__name__)

nav = Navigation(app)

conn = psycopg2.connect(
	host='192.168.0.20',
	database='csdashboard',
	user='webuser1',
	password='ecu1')

nav.Bar('top', [
	nav.Item('Faculty', 'create'),
	nav.Item('FTE', 'FTE'),
	nav.Item('Courses', 'courses'),
])

RESULTS_PER_PAGE = 10

@app.route("/sortNameAsc", methods=['GET', 'POST'])
def sortByNameAsc():
	cur = conn.cursor()
	cur.execute("SELECT * from faculty ORDER BY first_name ASC;")
	faculty = cur.fetchall()
	col_names = [desc[0] for desc in cur.description]
	return render_template("index.html", col_names=col_names, faculty = faculty)
@app.route("/sortNameDesc", methods=['GET', 'POST'])
def sortByNameDesc():

	cur = conn.cursor()
	cur.execute("SELECT * from faculty ORDER BY first_name DESC;")
	faculty = cur.fetchall()
	col_names = [desc[0] for desc in cur.description]
	return render_template("index.html", col_names=col_names, faculty = faculty)
@app.route("/sortRankAsc", methods=['GET', 'POST'])
def sortByRankAsc():
	cur = conn.cursor()
	cur.execute("SELECT * from faculty ORDER BY rank ASC;")
	faculty = cur.fetchall()
	col_names = [desc[0] for desc in cur.description]
	return render_template("index.html", col_names=col_names, faculty = faculty)
@app.route("/sortRankDesc", methods=['GET', 'POST'])
def sortByRankDesc():

	cur = conn.cursor()
	cur.execute("SELECT * from faculty ORDER BY rank DESC;")
	faculty = cur.fetchall()
	col_names = [desc[0] for desc in cur.description]
	return render_template("index.html", col_names=col_names, faculty = faculty)

def createQuery(search):
	try:
		str = f"SELECT * FROM faculty WHERE LOWER(first_name) LIKE  '%{search}%';"
	#str = f"SELECT * FROM faculty WHERE faculty_id LIKE '{search}' UNION SELECT * FROM faculty WHERE LOWER(faculty_id) UNION SELECT * FROM faculty WHERE LOWER(prefix) LIKE '{search}' UNION SELECT * FROM faculty WHERE LOWER(first_name) LIKE '{search}' UNION SELECT * FROM faculty WHERE LOWER(middle_initial) LIKE '{search}' UNION SELECT * FROM faculty WHERE LOWER(last_name) LIKE '{search}' UNION SELECT * FROM faculty WHERE LOWER(email) LIKE '{search}' UNION SELECT * FROM faculty WHERE LOWER(phone) LIKE '{search}' UNION SELECT * FROM faculty WHERE LOWER(office) LIKE '{search}' UNION SELECT * FROM faculty WHERE LOWER(research) LIKE '{search}' UNION SELECT * FROM faculty WHERE LOWER(rank) LIKE '{search}' UNION SELECT * FROM faculty WHERE LOWER(remarks) LIKE '{search}' UNION SELECT * FROM faculty WHERE LOWER(employed) LIKE '{search}';"
	#str = f"SELECT * FROM faculty;"
	
	except:
		str= 'SELECT * FROM faculty'
	return str
@app.route('/search', methods=["POST"])
def search():
	searchInput = request.form.get("search")
	
	if request.method == 'POST':
		
		if not searchInput:
			flash('Search')
		else:
			try:
				cur = conn.cursor()
				query = createQuery(searchInput.lower())
				cur.execute(query)
				faculty = cur.fetchall()
				col_names = [desc[0] for desc in cur.description]
				return render_template("index.html", col_names=col_names, faculty = faculty)

			except:
				print('error search')
				return render_template("index.html")
	#sreturn render_template("search.html",input=query)
@app.route('/',methods=["GET","POST"])
def create():
	'''if request.method == 'POST':
		if request.form.get('nameDesc') == '^':
			sortByNameDesc()
		elif request.form.get('nameAsc') == 'V':
			sortByNameAsc()
		elif request.form.get('rankDesc') == '^':
			sortByNameDesc()
		elif request.form.get('rankAsc') == 'V':
			sortByNameAsc()'''
	
	cur = conn.cursor()
	cur.execute("SELECT * from faculty;")
	faculty = cur.fetchall()
	col_names = [desc[0] for desc in cur.description]
	
	return render_template("index.html", col_names=col_names, faculty = faculty)

			
@app.route('/courses')
def courses():

	cur = conn.cursor()
	cur.execute("SELECT * from course_history;")
	courses = cur.fetchall()
	col_names = [desc[0] for desc in cur.description]
	return render_template("courses.html", col_names=col_names, courses = courses)

  
  
@app.route('/FTE')
def FTE():
	cur = conn.cursor()
	cur.execute("SELECT * from course_directors;")
	FTE = cur.fetchall()
	col_names = [desc[0] for desc in cur.description]
	return render_template("FTE.html", col_names=col_names, FTE=FTE)




#def search()
if __name__ == "__main__":
	app.run()
