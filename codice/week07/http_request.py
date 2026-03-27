"""Modulo per testare richieste"""

import requests
import sqlite3

URL = 'https://raw.githubusercontent.com/maboglia/ProgrammingResources/refs/heads/master/tabelle/film/rotten-tomatoes-best-cartoons.json'

db = sqlite3.connect('film.db')

navetta = db.cursor()

query = """
CREATE TABLE IF NOT EXISTS film(
cartoon_id INTEGER PRIMARY KEY AUTOINCREMENT,
titolo TEXT NOT NULL,
anno INTEGER DEFAULT 0
);
"""

navetta.execute(query)

risposta = requests.get(URL)

cartoni = risposta.json()

for cartone in cartoni:
    if cartone['titolo']:
        navetta.execute("INSERT into film (titolo) VALUES (?);", (cartone['titolo'],))


db.commit()

db.close()