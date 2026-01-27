-- data control language

-- creare nuovi utenti
create user pippo@localhost identified by 'password';

-- creare uno spazio di lavoro
create database prova;

-- attribuire i permessi di accesso e scrittura completa all'utente pippo
grant all on prova.* to pippo@localhost;

flush privileges;

-- togli i permessi a pippo
revoke all on prova.* from pippo@localhost;

-- elimino db
drop database prova;

-- elimino utente
drop user pippo@localhost;

-- ------ DDL -------------------

/* 1:
Crea una tabella chiamata "Products" con i seguenti campi:
- code (stringa esatta di 8 caratteri, chiave primaria)
- name (stringa di lunghezza massima 30 caratteri)
- price (decimale(6,2))
- quantity (intero)
nb: il valore assegnabile al campo quantità non supera il valore intero 100
*/
-- istruzione SQL di seguito

CREATE TABLE products(
    `code` char(8) primary key,
    `name` varchar(30),
    price decimal(6,2),
    quantity smallint check (quantity <= 100)
);


/* 2:
Modifica la tabella "products" aggiungendo un nuovo campo chiamato "description" di tipo testo.
Inserite il nuovo campo dopo il campo "name"
*/
-- istruzione SQL di seguito
