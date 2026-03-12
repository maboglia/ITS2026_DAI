import json

f = open('biblioteca.json', 'r')

output = open('biblioteca.html', 'w')

libri = json.load(f)

for libro in libri:
    output.write(f"""
    <div>
        <h1>{libro.get('Titolo')}</h1>
        <h2>{libro.get('Autore')}</h2>
        <h3>{libro.get('Classificazione')}</h3>
        <button>Prenota</button>
    </div>
    """)

f.close()
output.close()
print("File html generato con successo!")