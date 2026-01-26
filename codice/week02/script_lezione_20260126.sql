use its2026_dai;


-- **1. Creazione della tabella "prodotti":**  
-- Crea una tabella chiamata `prodotti` con i seguenti campi:  

-- - `id`: intero, chiave primaria.  
-- - `nome`: stringa con lunghezza massima di 50 caratteri.  
-- - `prezzo`: decimale con precisione 6,2.  
-- - `quantita`: intero (il valore massimo non supera 100).  

-- Scrivere l'istruzione SQL.

create table prodotti(
	id int unsigned primary key auto_increment,
    nome varchar(50) NOT NULL,
    prezzo decimal(6,2),
    quantita int unsigned check (quantita <= 100)
);

alter table prodotti
add column
categoria varchar(45) NULL;

SELECT * FROM its2026_dai.prodotti;

INSERT INTO prodotti (nome, prezzo, quantita, categoria) 
VALUES
('maglia verde', 10.50, 15, 'abbigliamento'),
('tavolo verde', 85.75, 10, 'arredamento');


-- **3. Creazione della tabella "ordini":**  
-- Crea una tabella chiamata `ordini` con i seguenti campi:  

-- - `id`: intero, chiave primaria.  
-- - `data_ordine`: data.  
-- - `totale`: decimale con precisione 10,2.  
-- - `id_cliente`: intero.  

-- Scrivere l'istruzione SQL.

create table ordini(
	id int primary key auto_increment,
	data_ordine date,
    totale decimal(10,2),
    id_cliente int
);