insert into prodotti (id,nome,prezzo) values (100,'kinder delice',1.50);
insert into prodotti (nome,prezzo) values ('kinder delice',1.50);
alter table prodotti auto_increment = 1118;
SELECT * FROM prodotti;
truncate prodotti;
delete from prodotti where id = 3;