/*
Lesen Sie im Buch
Kapitel 9
180 - 186	Transaktionen

1. Erstellen Sie vorab eine Sicherung Ihrer Datenbank
2. Testen Sie Rollback Transaction
3. Testen Sie Commit Transaction
4. Testen Sie Sperren und Deadlocks mit 2 Abfragefenster (1. Benutzer, 2. Benutzer)

-- Sachverhalt Einkauf (Produkteinkauf)

NEUES Produkt:
Handschuhe
1. Marke: Alfa Training
2. Farbe: Pink
3. Groesse: ONE SIZE
4. Kategorie: Accesoires
5. Preis Einkauf: 1,50 EURO
6. Preis Verkauf: 5 EURO
7. Produktdetail: Alfa Training Handschuhe in Pink, 100% Baumwolle
8. Zielgruppe: Frauen

Transaktionsinhalt:
BEGIN
1. Neue Marke zu Tabelle Marken hinzufügen
2. Neue Farbe zu Tabelle Farbe hinzufügen
3. Neue Groesse zu Tabelle Groesse hinzufügen
4. Neue Kategorie zu Tabelle Kategorien hinzufügen
5. Neues Produkt zu Tabelle Produkte hinzufügen
6. Produktdetails in Tabelle Produkte eintragen
7. Produkteinkauf in Tabelle Produkteinkauf eintragen (an den Mitarbeiter 2 denken)
ENDE (COMMIT / ROLLBACK)

BEGIN
8. Die Rechnung erstellen in Tabelle Rechnungen
9. Produktverkauf Daten in Tabelle Produktverkauf eintragen
ENDE (COMMIT / ROLLBACK)

2 Benutzer sollen sich gegenseitig stören!!!
*/

/*
NEUES Produkt:
Handschuhe
1. Marke: Alfa Training
2. Farbe: Pink
3. Groesse: ONE SIZE
4. Kategorie: Accesoires
5. Preis Einkauf: 1,50 EURO
6. Preis Verkauf: 5 EURO
7. Produktdetail: Alfa Training Handschuhe in Pink, 100% Baumwolle
8. Zielgruppe: Frauen
*/

BEGIN TRANSACTION

INSERT INTO KATEGORIEN
VALUES(13, 'Accesoires');

INSERT INTO MARKEN
VALUES((SELECT MAX(MARKENID)+1 FROM MARKEN), 'Alfa Training' );

INSERT INTO PRODUKTE
VALUES((SELECT MAX(PRODUKTID)+1 FROM PRODUKTE), 15, 2, 13, 'Alfa Training Handschuhe in Pink, 100% Baumwolle');

INSERT INTO FARBEN
VALUES(14, 'Pink');

INSERT INTO GROESSEN
VALUES(10, 'ONE SIZE');

INSERT INTO FARBZUSAMMENSETZUNG
VALUES(21, 14);

INSERT INTO PRODUKTVARIANTEN
VALUES(21, 10, 5, NULL, NULL);

INSERT INTO LIEFERANTEN
VALUES(15, '', 'Alfa Training', NULL);

INSERT INTO PRODUKTEINKAUF
VALUES((SELECT MAX(einkaufid)+1 FROM Produkteinkauf), 1.50, 200, 21, 2, 15, GETDATE(), 10, 14);

INSERT INTO RECHNUNGEN
VALUES(15, GETDATE());

INSERT INTO Produktverkauf 
VALUES(13, 1, 15, 5, 0, 10, 21, 3, 10, 14);

COMMIT;


SELECT *
FROM KATEGORIEN;

SELECT *
FROM MARKEN
ORDER BY 1 DESC;

SELECT *
FROM ZIELGRUPPEN;

SELECT *
FROM FARBEN;

SELECT *
FROM GROESSEN;

UPDATE FARBEN
SET NAME='Pink'
WHERE FARBID=14;

DELETE FARBEN
WHERE FARBID=15;

SELECT *
FROM GESAMTSORTIMENT
WHERE ProduktNR=21;

BEGIN TRANSACTION

INSERT INTO RECHNUNGEN
VALUES(16, GETDATE());

INSERT INTO Produktverkauf 
VALUES(14, 1, 16, 5, 0, 40, 21, 4, 10, 14);

COMMIT;

SELECT *
FROM MONATSBILANZ;

SELECT *
FROM GESAMTSORTIMENT
WHERE ProduktNR=8;

SELECT *
FROM TOPSELLERUMSATZ;

SELECT *
FROM VIEW_BESTAND
WHERE LAGERBESTAND<100;

SELECT *
FROM MITARBEITERPERFORMANCE;


INSERT INTO Produktverkauf 
VALUES((SELECT MAX(VERKAUFID)+1 FROM PRODUKTVERKAUF), 3, 8, 39.95, 4.95, 1, 4, 8, 1, 10);































