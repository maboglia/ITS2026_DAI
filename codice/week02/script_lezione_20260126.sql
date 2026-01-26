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






