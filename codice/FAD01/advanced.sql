-- pomodori

-- indici
-- stored functions
-- stored procedures
-- trigger
-- subqueries
-- views


-- indici
CREATE INDEX idx_cognome ON studenti(cognome);
DROP INDEX idx_cognome ON studenti;

-- funzioni built-in
SELECT UPPER(cognome) AS cognome_maiuscolo FROM studenti;
SELECT CONCAT(nome, ' ', cognome) AS nome_completo FROM studenti;
SELECT LENGTH(nome) AS lunghezza_nome FROM studenti;
SELECT SUBSTRING(cognome, 1, 3) AS cognome_troncato FROM studenti;
SELECT NOW() AS data_ora_corrente;
SELECT YEAR(data_nascita) AS anno_nascita FROM studenti;
SELECT COUNT(*) AS numero_studenti FROM studenti;
SELECT AVG(eta) AS eta_media FROM studenti;
SELECT MAX(eta) AS eta_massima FROM studenti;
SELECT MIN(eta) AS eta_minima FROM studenti;
SELECT SUM(crediti) AS totale_crediti FROM corsi;
SELECT ROUND(voto, 1) AS voto_arrotondato FROM esami;
SELECT IF(eta >= 18, 'Maggiorenne', 'Minorenne') AS stato_maggiorenne FROM studenti;
SELECT CASE
    WHEN eta < 18 THEN 'Minorenne'
    WHEN eta >= 18 AND eta < 65 THEN 'Adulto'
    ELSE 'Anziano'
END AS fascia_eta FROM studenti;

-- stored functions
DELIMITER //
CREATE FUNCTION calcola_media(voto1 FLOAT, voto2 FLOAT) RETURNS FLOAT
BEGIN
    RETURN (voto1 + voto2) / 2;
END //
DELIMITER ;

-- stored procedures
DELIMITER //
CREATE PROCEDURE inserisci_studente(IN p_nome VARCHAR(50), IN p_cognome VARCHAR(50), IN p_eta INT)
BEGIN
    INSERT INTO studenti (nome, cognome, eta) VALUES (p_nome, p_cognome, p_eta);
END //
DELIMITER ;   