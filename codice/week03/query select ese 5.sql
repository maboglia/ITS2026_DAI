use esercitazione5;
-- Esegui 10 esercizi di SELECT in SQL per esercitarsi con la sintassi e i concetti.

-- 1. Selezionare tutti i dettagli dei prodotti di colore rosso
SELECT * 
FROM Prodotti
WHERE Colore = 'rosso';
-- 2. Trovare i nomi e le sedi dei fornitori con più di 5 soci
SELECT nome_fornitore, Sede
FROM Fornitori
WHERE numero_soci > 5;
-- 3. Trovare il nome e l'email dei clienti registrati negli ultimi 30 giorni
SELECT Nome, Email
FROM Clienti
WHERE Data_Registrazione between '2024-01-05' and '2024-01-07'  ;
-- 4. Calcolare il totale delle vendite per ogni prodotto
SELECT codice_prodotto, SUM(Totale) AS 'Totale Vendite'
FROM Vendite
GROUP BY codice_prodotto
having SUM(Totale) > 150
;
-- 5. Recuperare i dettagli dei fornitori che forniscono almeno un prodotto di colore "verde"
SELECT DISTINCT F.codice_fornitore, F.nome_fornitore, F.Sede
FROM Fornitori F
JOIN Fornitori_Prodotti FP ON F.codice_fornitore = FP.codice_fornitore
JOIN Prodotti P ON FP.codice_prodotto = P.codice_prodotto
WHERE P.Colore = 'verde';
-- 6. Trovare i nomi dei clienti che hanno effettuato ordini
SELECT  C.Nome, count(*), max(o.data_ordine)
FROM Clienti C
JOIN Ordini O ON C.codice_cliente = O.codice_cliente
group by c.nome;
-- 7. Visualizzare i prodotti mai forniti da alcun fornitore
SELECT P.nome_prodotto
FROM Prodotti P
LEFT JOIN Fornitori_Prodotti FP ON P.codice_prodotto = FP.codice_prodotto
WHERE FP.codice_prodotto IS NULL;
-- 8. Trovare i fornitori che forniscono almeno due prodotti diversi
SELECT codice_fornitore
FROM Fornitori_Prodotti
GROUP BY codice_fornitore
HAVING COUNT(DISTINCT codice_prodotto) >= 2;
-- 9. Recuperare i dettagli delle vendite per prodotti il cui prezzo unitario è maggiore della media
SELECT *
FROM Vendite
WHERE PrezzoUnitario > (SELECT AVG(PrezzoUnitario) FROM Vendite);
-- 10. Trovare i prodotti venduti esclusivamente nel magazzino "MZ001"
SELECT P.nome_prodotto
FROM Prodotti P
WHERE P.Magazzino = 'MZ001'
AND NOT EXISTS (
    SELECT 1
    FROM Vendite V
    WHERE V.codice_prodotto = P.codice_prodotto AND P.Magazzino != 'MZ001'
);