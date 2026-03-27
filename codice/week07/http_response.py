import sqlite3
from flask import Flask, jsonify

db = sqlite3.connect('film.db')

cursore = db.cursor()

query = "SELECT * FROM film"

cursore.execute(query)

rows = cursore.fetchall()

for row in rows:
    print(row[1])

app = Flask(__name__)



app.run()