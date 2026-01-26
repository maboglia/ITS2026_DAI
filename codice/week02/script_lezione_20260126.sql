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

-- **4. Creazione della tabella "clienti":**  
-- Crea una tabella chiamata `clienti` con i seguenti campi:  

-- - `id`: intero, chiave primaria.  
-- - `nome`: stringa con lunghezza massima di 30 caratteri.  
-- - `cognome`: stringa con lunghezza massima di 30 caratteri.  
-- - `email`: stringa con lunghezza massima di 100 caratteri.  
-- - `provincia`: stringa con lunghezza di 2 caratteri.  

-- Scrivere l'istruzione SQL.

create table clienti(
	id int primary key auto_increment,
    nome varchar(30) NOT NULL,
    cognome varchar(30) NOT NULL,
    email varchar(100) NOT NULL,
    provincia char(2)
);

---

-- **5. Modifica della tabella "clienti":**  

-- - Cambia la lunghezza massima del campo `cognome` da 30 a 50 caratteri.  
-- - Aggiungi un nuovo campo chiamato `telefono` di tipo stringa con lunghezza massima di 20 caratteri, posizionandolo dopo il campo `cognome`.  

-- Scrivere un'unica istruzione SQL.
ALTER TABLE clienti
MODIFY COLUMN cognome VARCHAR(50);

ALTER TABLE clienti
ADD telefono varchar(20) after cognome;

-- **6. Creazione delle tabelle "americhe", "europa" e "africa":**  
-- Crea tre tabelle chiamate `americhe`, `europa` e `africa`.  
-- Ogni tabella deve avere i seguenti campi:  

-- - `id`: intero, chiave primaria.  
-- - `stato`: stringa con lunghezza massima di 50 caratteri.  
-- - `capitale`: stringa con lunghezza massima di 50 caratteri.  

-- Scrivere le istruzioni SQL per le tre tabelle.

create table americhe (
	id int primary key auto_increment, 
    stato varchar(50) not null,
    capitale varchar(50) not null
);

create table europa like americhe;
create table africa like americhe;

-- **7. Creazione della tabella "libro":**  
-- Crea una tabella chiamata `libro` con i seguenti campi:  

-- - `id`: intero, chiave primaria.  
-- - `titolo`: stringa con lunghezza massima di 100 caratteri.  
-- - `prezzo`: decimale con precisione 6,2.  
-- - `pagine`: intero.  
-- - `id_editore`: intero.  

-- Scrivere l'istruzione SQL.

create table libro(
	id int primary key auto_increment,
    titolo varchar(100) not null,
    prezzo decimal(6,2) not null default 0,
    pagine int not null default 0,
    id_editore int
);