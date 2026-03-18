SELECT * FROM its2026_dai.alimenti;

use its2026_dai;


create table categorie_alimenti(
	categoria_id int primary key auto_increment,
    categoria_nome varchar(30)
    );

insert into categorie_alimenti (categoria_nome)  -- inserisci nel campo nome  
select distinct  categoria  -- tutto i valori selezionati 
from alimenti -- dalla tabella alimenti

order by categoria -- ordinati alfa per categoria
;

select * from categorie_alimenti;

alter table alimenti 
add column categoria_id int;

desc alimenti;

set sql_safe_updates = 0;

update alimenti a, categorie_alimenti cat
set a.categoria_id = cat.categoria_id
where a.categoria = cat.categoria_nome;

alter table alimenti
drop column categoria;

select * from alimenti;

select *

from alimenti a  -- LEFT

inner join  categorie_alimenti as cat -- RIGHT

using(categoria_id);
-- on a.categoria_id = cat.categoria_id;








