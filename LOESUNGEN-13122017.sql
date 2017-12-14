/*
Lesen Sie im Buch

Kapitel 10:
Seite 198 bis 202 	Benutzerdefinierte Funktionen

1. Erstellen Sie eine Funktion zur Generierung einer EinkaufID, bestehend aus Datum und laufender Nummer.
------------------------------------------------------------------------------------
2. Erstellen Sie eine Funktion welche die Farbnr anhand einer Farbe zurückliefert. 
	Verwenden Sie die Funktion um Alle Produkte anzeigen zu lassen, 
	welche die ausgewählte Farbe haben.
------------------------------------------------------------------------------------	
3. Erstellen Sie eine Funktion welche die GroessenNr anhand einer Groesse zurückliefert.
	Verwenden Sie die Funktion um Alle Produkte anzeigen zu lassen, 
	welche die ausgewählte Größe haben.
------------------------------------------------------------------------------------
4. Erstellen Sie Eine Funktion welche den Durchschnittwert der Länge zurückliefert.
   Schicken Sie danach einen weiteren SQL Befehl an die Datenbank um herauszufinden, 
   ob ein Produkt größer oder kleiner ausfällt.
------------------------------------------------------------------------------------   
5. Erstellen Sie Eine Funktion welche den Durchschnittwert der 
Länge+Breite zurückliefert, wenn man eine Größe auswählt.
   Schicken Sie danach einen weiteren SQL Befehl an die Datenbank um herauszufinden, 
   ob ein Produkt größer oder kleiner ausfällt.
------------------------------------------------------------------------------------   
6. Erstellen Sie eine Funktion zur Ermittlung der Anzahl der verkauften Produkte. 
Eine andere Select Anweisung soll die Funktion verwenden
um nur die Produkte anzuzeigen, welche mindestens 10x verkauft wurden.
*/

/*
1. Erstellen Sie eine Funktion zur Generierung einer EinkaufID, bestehend aus Datum und laufender Nummer.
------------------------------------------------------------------------------------
*/
USE TESTDATENBANK;


ALTER FUNCTION FNC_EINKAUF_ID_GENERIERUNG()
RETURNS TABLE
AS
	RETURN
	SELECT MAX(EINKAUFID)+1 AS EINKAUFID, GETDATE() AS DATUM FROM PRODUKTEINKAUF;

SELECT * FROM dbo.FNC_EINKAUF_ID_GENERIERUNG();


/*
2. Erstellen Sie eine Funktion welche die Farbnr anhand einer Farbe zurückliefert. 
	Verwenden Sie die Funktion um Alle Produkte anzeigen zu lassen, 
	welche die ausgewählte Farbe haben.
------------------------------------------------------------------------------------	
*/
---V-01---------------------------------------------------------------------------------   
ALTER FUNCTION FNC_FARBE_ANZEIGEN(@FARBE AS VARCHAR(20))
RETURNS TABLE
AS
RETURN
SELECT pd.Produktdetail, fs.FarbNr, fa.Name
FROM Farbzusammensetzung fs
INNER JOIN PRODUKTE pd ON pd.ProduktID=fs.ProduktNr
INNER JOIN FARBEN fa ON fa.FarbID=fs.FarbNr
WHERE FARBNR IN(SELECT DISTINCT FARBID FROM FARBEN WHERE FARBEN.Name LIKE '%'+@FARBE+'%');

SELECT * FROM dbo.FNC_FARBE_ANZEIGEN('oRANGE');
---V-02---------------------------------------------------------------------------------   
ALTER FUNCTION FNC_FARBE_FINDEN(@FARBE AS VARCHAR(20))
RETURNS int
AS
BEGIN
	DECLARE @FARBENR int;
	SET @FARBENR = (SELECT DISTINCT TOP 1 FARBID FROM FARBEN WHERE FARBEN.Name LIKE '%'+@FARBE+'%');
	RETURN(@FARBENR);
END

SELECT pd.Produktdetail, fs.FarbNr, fa.Name
FROM Farbzusammensetzung fs
INNER JOIN PRODUKTE pd ON pd.ProduktID=fs.ProduktNr
INNER JOIN FARBEN fa ON fa.FarbID=fs.FarbNr
WHERE FARBNR=dbo.FNC_FARBE_FINDEN('ora');

SELECT dbo.FNC_FARBE_FINDEN('ora');

------------------------------------------------------------------------------------   
/*
3. Erstellen Sie eine Funktion welche die GroessenNr anhand einer Groesse zurückliefert.
	Verwenden Sie die Funktion um Alle Produkte anzeigen zu lassen, 
	welche die ausgewählte Größe haben.
------------------------------------------------------------------------------------
*/

ALTER FUNCTION FNC_GROESSE_FINDEN(@GROESSE AS VARCHAR(20))
RETURNS int
AS
BEGIN
	DECLARE @GROESSENR int;
	SET @GROESSENR = (SELECT DISTINCT TOP 1 GROESSENID FROM GROESSEN WHERE Name LIKE '%'+@GROESSE+'%');
	RETURN(@GROESSENR);
END

SELECT DISTINCT pd.Produktdetail, gr.GroessenID, gr.Name
FROM Produkteinkauf pe
INNER JOIN GROESSEN gr ON gr.GroessenID=pe.GroessenNr
INNER JOIN PRODUKTE pd ON pd.ProduktID=pe.ProduktNr
WHERE pe.GROESSENNR=dbo.FNC_GROESSE_FINDEN('XL');

SELECT dbo.FNC_GROESSE_FINDEN('XL');

DECLARE @GROESSE VARCHAR(20) = 'XS';
SELECT DISTINCT GROESSENID FROM GROESSEN WHERE Name LIKE '%'+@GROESSE+'%'

SELECT *
FROM GROESSEN;

/*
4. Erstellen Sie Eine Funktion welche den Durchschnittwert der Länge zurückliefert.
   Schicken Sie danach einen weiteren SQL Befehl an die Datenbank um herauszufinden, 
   ob ein Produkt größer oder kleiner ausfällt.
------------------------------------------------------------------------------------   
*/

ALTER FUNCTION FNC_DURCHNITTWERT_FINDEN(@PRODUKT AS int)
RETURNS int
AS
BEGIN
	DECLARE @WERT int;
--	SET @WERT = (SELECT AVG(pv.Laenge) FROM PRODUKTVARIANTEN pv WHERE pv.ProduktNr=@PRODUKT);
	SET @WERT = (SELECT AVG(pv.Laenge) FROM PRODUKTVARIANTEN pv);
	RETURN(@WERT);
END

SELECT DISTINCT pd.Produktdetail, pv.Laenge, dbo.FNC_DURCHNITTWERT_FINDEN(pv.ProduktNr) DURCHNITT, pv.Laenge-dbo.FNC_DURCHNITTWERT_FINDEN(pv.ProduktNr) UNTERSCHIED
FROM Produktvarianten pv
INNER JOIN PRODUKTE pd ON pd.ProduktID=pv.ProduktNr
WHERE pv.Laenge IS NOT NULL;

SELECT dbo.FNC_DURCHNITTWERT_FINDEN(2);

SELECT pv.ProduktNr, AVG(pv.Laenge)
FROM PRODUKTVARIANTEN pv
GROUP BY pv.ProduktNr

SELECT AVG(pv.Laenge)
FROM PRODUKTVARIANTEN pv
WHERE pv.ProduktNr=2;

SELECT AVG(pv.Laenge)
FROM PRODUKTVARIANTEN pv

/*
5. Erstellen Sie Eine Funktion welche den Durchschnittwert der 
Länge+Breite zurückliefert, wenn man eine Größe auswählt.
   Schicken Sie danach einen weiteren SQL Befehl an die Datenbank um herauszufinden, 
   ob ein Produkt größer oder kleiner ausfällt.
------------------------------------------------------------------------------------   
*/

ALTER FUNCTION FNC_LANG_BREIT_DURCHNITTWERT_FINDEN(@GROESSE AS int)
RETURNS int
AS
BEGIN
	DECLARE @WERT int;
	SET @WERT = (SELECT AVG(pv.Laenge+pv.Breite) FROM PRODUKTVARIANTEN pv WHERE pv.GroessenNr=@GROESSE);

	RETURN(@WERT);
END

SELECT dbo.FNC_LANG_BREIT_DURCHNITTWERT_FINDEN(1);

SELECT pd.Produktdetail, gr.Name, pv.Laenge, pv.Breite, pv.Laenge+pv.Breite SUMA, dbo.FNC_LANG_BREIT_DURCHNITTWERT_FINDEN(pv.GroessenNr) DURCHNITTW,
pv.Laenge+pv.Breite-dbo.FNC_LANG_BREIT_DURCHNITTWERT_FINDEN(pv.GroessenNr) UNTERSCHIED
FROM Produktvarianten pv
INNER JOIN PRODUKTE pd ON pd.ProduktID=pv.ProduktNr
INNER JOIN GROESSEN gr ON gr.GroessenID=pv.GroessenNr
WHERE pv.Laenge IS NOT NULL OR pv.Breite IS NOT NULL
ORDER BY pv.GroessenNr ASC;


SELECT DISTINCT pd.Produktdetail, pv.GroessenNr, AVG(pv.Laenge+pv.Breite)
FROM Produktvarianten pv
INNER JOIN PRODUKTE pd ON pd.ProduktID=pv.ProduktNr
GROUP BY pd.Produktdetail, pv.GroessenNr;

SELECT DISTINCT pd.Produktdetail, pv.GroessenNr, AVG(pv.Laenge+pv.Breite)
FROM Produktvarianten pv
INNER JOIN PRODUKTE pd ON pd.ProduktID=pv.ProduktNr
GROUP BY pd.Produktdetail, pv.GroessenNr;

SELECT AVG(pv.Laenge+pv.Breite) FROM PRODUKTVARIANTEN pv WHERE pv.ProduktNr=2


/*
6. Erstellen Sie eine Funktion zur Ermittlung der Anzahl der verkauften Produkte. 
Eine andere Select Anweisung soll die Funktion verwenden
um nur die Produkte anzuzeigen, welche mindestens 10x verkauft wurden.
------------------------------------------------------------------------------------   
*/

ALTER FUNCTION FNC_ANZAHL_VERKAUFTE_PRODUKT(@PRODUKT AS int)
RETURNS int
AS
BEGIN
	DECLARE @WERT int;
	SET @WERT = (SELECT SUM(pv.Menge) MENGE FROM PRODUKTVERKAUF pv WHERE PRODUKTNR IS NOT NULL AND pv.ProduktNr=@PRODUKT);
	RETURN(@WERT);
END

SELECT DISTINCT pd.Produktdetail PRODUKT, dbo.FNC_ANZAHL_VERKAUFTE_PRODUKT(pv.ProduktNr) MENGE
FROM PRODUKTVERKAUF pv
INNER JOIN PRODUKTE pd ON pd.ProduktID=pv.ProduktNr
WHERE pv.PRODUKTNR IS NOT NULL AND dbo.FNC_ANZAHL_VERKAUFTE_PRODUKT(pv.ProduktNr)>=0;




SELECT pv.ProduktNr PRODUKTNR, SUM(pv.Menge) MENGE
FROM PRODUKTVERKAUF pv
WHERE PRODUKTNR IS NOT NULL
GROUP BY pv.ProduktNr

SELECT SUM(pv.Menge) MENGE FROM PRODUKTVERKAUF pv WHERE PRODUKTNR IS NOT NULL AND pv.ProduktNr=5


------------------------------------------------------------------------------------   




