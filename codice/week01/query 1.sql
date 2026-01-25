use dai2026;
drop table prodotti;
create table `prodotti`(
	id int primary key auto_increment,
    nome varchar(30),
    prezzo decimal(6,2)
);
