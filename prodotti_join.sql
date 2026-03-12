Create table categorie as
SELECT 
	distinct categoria 

FROM its2026_dai.prodotti;

select * from categorie;
select * from prodotti;


alter table categorie
add column categoria_id int primary key auto_increment first;

insert into categorie (categoria) value ('Pesce');

alter table prodotti
add column categoria_id int; 

set sql_safe_updates = 0;

update 
	prodotti p,
    categorie c
set p.categoria_id = c.categoria_id
where 
		p.categoria = c.categoria;
    
create table prodotti_copy like prodotti;
insert into prodotti_copy select * from prodotti;
select * from prodotti_copy;

alter table prodotti
drop column categoria;

alter table categorie
add column category varchar(30);

select
	p.nome as 'Nome prodotto',
    c.categoria as 'Italiano',
    c.category as 'Inglese',
    p.prezzo
from
	prodotti p
right join categorie c on p.categoria_id = c.categoria_id  

-- where p.prezzo between 15 and 30  

order by prezzo, 'Nome prodotto';


-- raggruppamento: group by -> count, sum, min, max, avg

select 
	c.categoria,
    count(p.nome) as conteggio,
    avg(p.prezzo) as prezzo_medio,
    min(p.prezzo) as prezzo_minimo,
    max(p.prezzo) as prezzo_massimo,
    sum(p.prezzo) as valore_categoria

from prodotti p
join categorie c on p.categoria_id = c.categoria_id

where p.giacenza > 0

group by categoria
having prezzo_medio > 57
order by valore_categoria desc
;

create table corsi (
	corso_id int primary key auto_increment,
    materia varchar(120),
    ore int
);

INSERT INTO corsi (materia) values ('(DAI_25-27-00) Materiale condiviso - Cartella del partecipante');
 INSERT INTO corsi (materia) values ('(DAI_25-27-00) Materiale condiviso - Docenti');
 INSERT INTO corsi (materia) values ('(DAI_25-27-01) Approfondimenti didattici e Orientamento');
 INSERT INTO corsi (materia) values ('(DAI_25-27-02) Analisi di Serie Temporali (R Framework)');
 INSERT INTO corsi (materia) values ('(DAI_25-27-03) Big Data');
 INSERT INTO corsi (materia) values ('(DAI_25-27-04) Cloud Computing');
 INSERT INTO corsi (materia) values ('(DAI_25-27-05) Copyright e norme giuridiche del mondo digitale');
 INSERT INTO corsi (materia) values ('(DAI_25-27-06) Data Management');
 INSERT INTO corsi (materia) values ('(DAI_25-27-07) Deep Learning e NPL');
 INSERT INTO corsi (materia) values ('(DAI_25-27-08) Design Thinking 4.0');
 INSERT INTO corsi (materia) values ('(DAI_25-27-09) Etica dei Dati e Privacy');
 INSERT INTO corsi (materia) values ('(DAI_25-27-10) Fondamenti di basi di dati');
 INSERT INTO corsi (materia) values ('(DAI_25-27-11) Fondamenti di programmazione');
 INSERT INTO corsi (materia) values ('(DAI_25-27-12) Inglese');
 INSERT INTO corsi (materia) values ('(DAI_25-27-13) Introduzione al Calcolo Scientifico');
 INSERT INTO corsi (materia) values ('(DAI_25-27-14) Introduzione alla Data Science');
 INSERT INTO corsi (materia) values ('(DAI_25-27-15) Laboratorio di preparazione project work');
 INSERT INTO corsi (materia) values ('(DAI_25-27-16) Learning by Project - Soft Skill');
 INSERT INTO corsi (materia) values ('(DAI_25-27-17) Learning by Project - Tech');
 INSERT INTO corsi (materia) values ('(DAI_25-27-18) Machine Learning - Supervised e Unsupervised');
 INSERT INTO corsi (materia) values ('(DAI_25-27-19) Matematica e Statistica');
 INSERT INTO corsi (materia) values ('(DAI_25-27-20) Orientamento al lavoro');
 INSERT INTO corsi (materia) values ('(DAI_25-27-21) Parità fra uomini e donne e non discriminazione');
 INSERT INTO corsi (materia) values ('(DAI_25-27-22) Percorso di sviluppo soft skills');
 INSERT INTO corsi (materia) values ('(DAI_25-27-23) Programmazione - Python');
 INSERT INTO corsi (materia) values ('(DAI_25-27-24) Sicurezza sul lavoro');
 INSERT INTO corsi (materia) values ('(DAI_25-27-25) Strumenti AI e Prompt Engineering');


