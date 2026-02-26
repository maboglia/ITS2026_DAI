import json

inserimenti = []

nome_file = input('Inserisci il nome del file input: ')

with open(nome_file, 'r', encoding='utf-8') as f:

    games = json.load(f)

    for game in games:
        nome = game['Game']
        genere = game.get('Genre', 'generico')
        publisher = game.get("Publisher", 'publisher')
        platform = game.get("Original platform(s)[a]", 'platform')
        anno = int(game.get('year', 0))
        
        query = f'INSERT INTO games (nome, genere, publisher, platform, anno) values ("{nome}","{genere}","{publisher}","{platform}",{anno});';
        inserimenti.append(query)



query_table = """
CREATE TABLE games (
    game_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    genere VARCHAR(100),
    publisher VARCHAR(100),
    platform VARCHAR(100),
    anno INT
);
"""

nome_file = input('Inserisci il nome del file ouput: ')

with open(nome_file, 'w', encoding='utf-8') as f:

    f.write(query_table)

    for query in inserimenti:
        f.write(query)
        f.write('\n')

print("Elaborazione terminata!!!!!!!!!!!!!!!!!!!!!!!!!!")