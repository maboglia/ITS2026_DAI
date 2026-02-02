use its2026_dai;

DROP TABLE IF EXISTS `pokemon`;


CREATE TABLE `pokemon` (
  `Id` int UNSIGNED PRIMARY KEY auto_increment,
  `Name` varchar(100),
  `Type 1` varchar(20),
  `Type 2` varchar(20),
  `Total` int DEFAULT NULL,
  `HP` int DEFAULT NULL,
  `Attack` int DEFAULT NULL,
  `Defense` int DEFAULT NULL,
  `Sp_Atk` int DEFAULT NULL,
  `Sp_Def` int DEFAULT NULL,
  `Speed` int DEFAULT NULL,
  `Generation` smallint DEFAULT NULL,
  `Legendary` varchar(10)
);

CREATE TABLE `pokemon_copy` (
  `Id` int ,
  `Name` varchar(100),
  `Type 1` varchar(20),
  `Type 2` varchar(20),
  `Total` int DEFAULT NULL,
  `HP` int DEFAULT NULL,
  `Attack` int DEFAULT NULL,
  `Defense` int DEFAULT NULL,
  `Sp_Atk` int DEFAULT NULL,
  `Sp_Def` int DEFAULT NULL,
  `Speed` int DEFAULT NULL,
  `Generation` smallint DEFAULT NULL,
  `Legendary` varchar(10)
);

TRUNCATE pokemon;

INSERT INTO pokemon (`Name`, `Type 1`, `Type 2`, `Total`, `HP`, `Attack`, `Defense`, `Sp_Atk`, `Sp_Def`, `Speed`, `Generation`, `Legendary` )
select `Name`, `Type 1`, `Type 2`, `Total`, `HP`, `Attack`, `Defense`, `Sp_Atk`, `Sp_Def`, `Speed`, `Generation`, `Legendary` 
from pokemon_copy;

select `Name`, `Type 1`, `Type 2` from pokemon;

select distinct `Type 1` from pokemon;-- seleziona i valori distinti per il campo type 1

select distinct `Type 1` as tipo from pokemon order by tipo;-- seleziona i valori distinti per il campo type 1

create table pokemon_type as 
select distinct `Type 1` as tipo from pokemon order by `Type 1`;


drop table pokemon_type;
select * from pokemon_type;

select * from pokemon
where Generation > 3 and Generation < 6 and (`Type 1` = 'Dragon' or `Type 2` = 'Dragon')
order by total desc 
limit 0, 10;

select * from pokemon
where name like '%fro%';
