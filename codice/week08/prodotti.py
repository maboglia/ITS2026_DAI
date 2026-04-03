'''Collegamento tra python e mysql'''

# driver di collegamento: pip install mysql-connector-python

import mysql.connector

# connessione al db magazzino
db_magazzino = mysql.connector.connect(
    host = 'localhost',
    user = 'root',
    password = 'root',
    database = 'magazzino'
)

# cursore: oggetto per portare istruzioni al database e riportare indietro i risultati della query
cursore = db_magazzino.cursor(dictionary=True)
# cursore = db_magazzino.cursor()

query = """
    SELECT 
    nome, prezzo_unitario, quantita_stock 
    FROM Prodotti
    ORDER BY prezzo_unitario desc
    """
# Mostrare le categorie che hanno almeno un prodotto fornito da un fornitore di 'Torino'.
query = """
    select distinct c.nome 
    from prodotti p 
    join categorie c using(id_categoria)
    join fornitori f using(id_fornitore)
    where f.citta = 'Torino';
    """
# Elencare i prodotti insieme alla ragione sociale del loro fornitore.
query = """
    SELECT 
        p.nome, f.ragione_sociale, c.nome
    FROM prodotti p
    join fornitori f using(id_fornitore)
    join categorie c using(id_categoria)

"""
query = "SELECT * FROM view_prodotti_fornitori_categorie order by ragione_sociale limit 3"

cursore.execute(query)

result_set = cursore.fetchall()


output = open("magazzino.txt", "a")

output.write("\n")
output.write(query)
output.write("\n")

for row in result_set:
    # output.write(" | ".join(row))
    output.write(str(row))
    output.write("\n")
    # nome = row[0]
    # prezzo = row[1]
    # giacenza = row[2]
    # nome, prezzo, giacenza = row

    # print(f"Il prodotto {nome} costa €{prezzo} e in magazzino ne abbiamo {giacenza} pezzi")

output.close()
print("Programma terminato con successo")
