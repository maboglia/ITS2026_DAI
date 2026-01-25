SELECT 
 `type 1` as tipo,
 count(id) as conteggio
FROM dai2026.pokemon
group by tipo
order by conteggio desc
;
