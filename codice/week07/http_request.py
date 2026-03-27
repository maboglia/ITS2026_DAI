"""Modulo per testare richieste"""

import requests

URL = 'https://raw.githubusercontent.com/maboglia/ProgrammingResources/refs/heads/master/tabelle/film/rotten-tomatoes-best-cartoons.json'

risposta = requests.get(URL)

cartoni = risposta.json()

for cartone in cartoni:
    print(f"INSERT into cartoni (titolo) VALUES ('{cartone['titolo']}');")
