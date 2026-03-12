import json

f = open('biblioteca.json', 'r')

output = open('biblioteca.html', 'w')

output.write(f'''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css"
>

</head>
<body>
   <div class="container">

    <h1>Biblioteca civica</h1>
''')


libri = json.load(f)

for libro in libri:
    if libro.get('Classificazione') == 'Romanzo':
        output.write(f"""
        <div>
            <h1>{libro.get('Titolo')}</h1>
            <h2>{libro.get('Autore')}</h2>
            <h3>{libro.get('Classificazione')}</h3>
            <button>Prenota</button>
        </div>
        """)

output.write(f'''
   </div>
</body>
</html>
''')

f.close()
output.close()
print("File html generato con successo!")