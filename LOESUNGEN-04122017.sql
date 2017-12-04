/*
Lesen Sie im Buch
Funktionen 
Seite 391

Seite 190,191


b) Funktionen anwenden


4. Erstellen Sie eine Ausgabe der Produktdetail-Spalte (ohne Marke)
   Ersetzen Sie dazu die Marke in der Spalte gegen eine leere Zeichenkette 
   (Die Datenbank selbst darf nicht geändert werden)

5. Wie groß ein Artikel ausfällt soll in einer eigenen Spalte ausgegeben werden

6. Zeigen Sie alle Artikel an, die groß ausfallen
7. Zeigen Sie alle Artikel an, die klein ausfallen
8. Berechnen Sie die Anzahl der Tage seit Rechnungserstellung bis heute

c) ERSTELLEN SIE DATENSÄTZE MIT INSERT INTO... um auszuprobieren, ob Ihre Befehle auch eine gültige Antwort liefern

9. Welche Verkäufe sind älter als 30 Tage
10. Welche Produkte wurden die letzten 10 Tage eingekauft
11. Welche Produkte wurden die letzten 10 Tage verkauft
12. Welches Produkt wurde als letztes Verkauft
*/


a) Alle Funktionen einmal ausprobieren
SELECT LEN('EINS ZWEI DREI');
SELECT LEFT('EINS ZWEI DREI', 5);
SELECT RIGHT('EINS ZWEI DREI', 5);
SELECT SUBSTRING('EINS ZWEI DREI', 5, 5);
SELECT LTRIM('    :      EINS ZWEI DREI');
SELECT RTRIM('    :      EINS ZWEI DREI       ,     ');
SELECT UPPER(' abCdäüÄ sxccjueikeke#');
SELECT LOWER('DEGHSUDN abCdäüÄ sxccjueikeke#');
SELECT CONCAT('Deutsch', 'land');

SELECT COMPATIBILITY_LEVEL;
SELECT * FROM STRING_SPLIT('Es war;eine Mutter;die hatte;vier Kinder', ';');
SELECT value FROM STRING_SPLIT('Lorem ipsum dolor sit amet.', ' ');
ALTER DATABASE Datenbankname SET COMPATIBILITY_LEVEL = 130;
ALTER DATABASE Datenbankname SET COMPATIBILITY_LEVEL = 120;
SELECT compatibility_level  FROM sys.databases WHERE name = 'testdatenbank'; 

SELECT GETDATE();
SELECT YEAR(GETDATE());
SELECT MONTH(GETDATE());
SELECT DAY(GETDATE());

SELECT DATENAME(year, GETDATE())  
    ,DATENAME(month, GETDATE())  
    ,DATENAME(day, GETDATE())  
    ,DATENAME(dayofyear, GETDATE())  
    ,DATENAME(weekday, GETDATE());  

SELECT DATEPART(year, GETDATE())  
    ,DATEPART(month, GETDATE())  
    ,DATEPART(day, GETDATE())  
    ,DATEPART(dayofyear, GETDATE())  
    ,DATEPART(weekday, GETDATE());  

SELECT DATEADD(month, 1, GETDATE());
SELECT DATEADD(month, 1, '30.08.2006');
SELECT DATEADD(month, 1, '31.08.2006');

SELECT DATEDIFF(year, '31.12.2005 23:59:59.9999999', GETDATE());
SELECT DATEDIFF(quarter, '31.12.2005 23:59:59.9999999', GETDATE());
SELECT DATEDIFF(month, '31.12.2005 23:59:59.9999999', GETDATE());
SELECT DATEDIFF(dayofyear, '31.12.2005 23:59:59.9999999', GETDATE());
SELECT DATEDIFF(day, '31.12.2005 23:59:59.9999999', GETDATE());
SELECT DATEDIFF(week, '31.12.2005 23:59:59.9999999', GETDATE());
SELECT DATEDIFF(hour, '31.12.2005 23:59:59.9999999', GETDATE());
SELECT DATEDIFF(minute, '31.12.2005 23:59:59.9999999', GETDATE());
SELECT DATEDIFF(second, '31.12.2005 23:59:59.9999999', GETDATE());
SELECT DATEDIFF(millisecond, '31.12.2005 23:59:59.9999999', GETDATE());

SELECT DATEFROMPARTS ( 2010, 12, 31 ) AS Result;

SELECT ISDATE('04/15/2008'); --Returns 0.  
SELECT ISDATE('15.08.2008'); --Returns 1.  

SELECT DISTINCT ABS(pv.Verkaufspreis*-2) FROM Produktvarianten pv;
SELECT DISTINCT CEILING(pv.Verkaufspreis) FROM Produktvarianten pv;
SELECT DISTINCT COS(pv.Verkaufspreis) FROM Produktvarianten pv;
SELECT DISTINCT EXP(pv.Verkaufspreis) FROM Produktvarianten pv;
SELECT DISTINCT FLOOR(pv.Verkaufspreis) FROM Produktvarianten pv;
SELECT DISTINCT LOG(pv.Verkaufspreis) FROM Produktvarianten pv;
SELECT PI();
SELECT DISTINCT RAND(pv.Verkaufspreis) FROM Produktvarianten pv;
SELECT DISTINCT ROUND(pv.Verkaufspreis, 3) FROM Produktvarianten pv;
SELECT DISTINCT ROUND(pv.Verkaufspreis, 2) FROM Produktvarianten pv;
SELECT DISTINCT ROUND(pv.Verkaufspreis, 1) FROM Produktvarianten pv;
SELECT DISTINCT ROUND(pv.Verkaufspreis, 0) FROM Produktvarianten pv;
SELECT DISTINCT SIGN(pv.Verkaufspreis) FROM Produktvarianten pv;
SELECT DISTINCT SIN(pv.Verkaufspreis) FROM Produktvarianten pv;
SELECT DISTINCT SQRT(pv.Verkaufspreis) FROM Produktvarianten pv;
SELECT DISTINCT SQUARE(pv.Verkaufspreis) FROM Produktvarianten pv;
SELECT DISTINCT TAN(pv.Verkaufspreis) FROM Produktvarianten pv;
SELECT DISTINCT AVG(pv.Verkaufspreis) FROM Produktvarianten pv;
SELECT DISTINCT MAX(pv.Verkaufspreis) FROM Produktvarianten pv;
SELECT DISTINCT MIN(pv.Verkaufspreis) FROM Produktvarianten pv;

SELECT DISTINCT SUM(pv.Verkaufspreis) FROM Produktvarianten pv;
SELECT SUM(pv.Verkaufspreis) FROM Produktvarianten pv;

SELECT CHOOSE ( 3, 'Manager', 'Director', 'Developer', 'Tester' ) AS Result;

SELECT IIF(1=1, '1=1 true', '1=1 false');
SELECT IIF(1=0, '1=0 true', '1=0 false');

SELECT ISNULL(NULL, 50);
SELECT ISNULL(6, 50);

SELECT NEWID();
SELECT APP_NAME();
SELECT DB_NAME();
SELECT HOST_NAME();
SELECT USER_NAME();

-----------------------------------------------------------------------------------------------------------------------------------------------

USE testdatenbank;

1. Formatieren Sie ein Datum aus in ein deutsches Format

SELECT FORMAT( GETDATE(), 'd', 'de-de' );
SELECT FORMAT( GETDATE(), 'D', 'de-de' );


2. Erstellen Sie die Ausgabe: Das Produkt '###' ist in der Größe '###' verfügbar
							 (Das Produkt NIKE T-Shirt ist in der Größe XL verfügbar)

SELECT DISTINCT 'Das Produkt ' + ma.Name + ' ' + ka.Name + ' ist in der Größe ' + gr.Name + ' verfügbar ' AS Verfügbarkeit
FROM Produkte pr, Produktvarianten pv, Groessen gr, Farbzusammensetzung fz, Farben fa, Marken ma, Zielgruppen zg, Kategorien ka
WHERE
pr.ProduktID=pv.ProduktNr and
pv.GroessenNr=gr.GroessenID and
fz.ProduktNr=pr.ProduktID and
fa.FarbID=fz.FarbNr and
ma.MarkenID=pr.MarkenNr and
zg.ZielgruppenID=pr.ZielgruppenNr and
ka.KategorieID=pr.KategorieNr

-----------------------------------------------------------------------------------------------------------------------------------------------

3. Erstellen Sie die Ausgabe: Das Produkt '###' wurde am Datum '###' verkauft
							 (Das Produkt NIKE T-Shirt wurde am Datum 26.05.2017 verkauft)


SELECT 'Das Produkt ' + ma.Name + ' ' + ka.Name + ' wurde am Datum ' + FORMAT( re.Datum, 'd', 'de-de' ) + ' verkauft ' AS Verkaufen, pvk.Betrag, *
FROM  Produktverkauf pvk, Produkte pr, Produktvarianten pv, Marken ma, Kategorien ka, Rechnungen re
WHERE
pvk.ProduktNr=pr.ProduktID AND
pvk.ProduktNr=pv.ProduktNr and
ma.MarkenID=pr.MarkenNr and
ka.KategorieID=pr.KategorieNr and
re.RechnungsID=pvk.RechnungsNr



SELECT DISTINCT 'Das Produkt ' + ma.Name + ' ' + ka.Name + ' wurde am Datum ' + FORMAT( re.Datum, 'd', 'de-de' ) + ' verkauft ' AS Verkaufen

SELECT *
FROM Produkte pr, Rechnungen re, Produktverkauf pvk
WHERE
re.RechnungsID=pvk.RechnungsNr and
pvk.ProduktNr=pr.ProduktID;

 SELECT *
  FROM Produkteinkauf
  WHERE GroessenNr=4 AND
  FarbNr=4;



[dbo].[Rechnungen].[RechnungsID]

[dbo].[Produktverkauf].[RechnungsNr]
-----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------



