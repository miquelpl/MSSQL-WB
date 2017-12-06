/*
Lesen Sie im Buch
Kapitel 7
Seite 127 - 137		Group By, Unterabfragen, komplexe Abfragen


1. Wieviele verschiedene Shirts sind im Angebot
2. Welche Bekleidung passt am besten bei 90cm Hüftumfang?
3. Welche Bekleidung passt am besten ab einer Länge von 80cm?
4. Berechnen Sie den Warenwert aller Jacken
5. Berechnen Sie den Warenwert aller Kapuzenpullover
6. Berechnen Sie den Warenwert je Kategorie
7. Welcher Artikelpreis ist der günstigste
8. Was ist das teuerste Produkt
9. Was ist das günstigste Produkt
10. Lassen sie sich die TOP 3 günstigsten Produkte anzeigen
11. Lassen Sie sich die TOP 10 teuersten Produkte anzeigen

12. Welche Farben sind für ein Produkt Fruit of the Loom Kapuzenpullover nicht verfügbar
13. Welche Größen wurden bisher nicht verkauft

*/

use testdatenbank;
------------------------------------------------------------------------------------------
-- 1. Wieviele verschiedene Shirts sind im Angebot

SELECT Produktdetail, COUNT(1) MENGE
FROM ANGEBOTE
WHERE kategorie LIKE 'T-Shirt%'
GROUP BY Produktdetail;

SELECT *
FROM ANGEBOTE
WHERE kategorie LIKE 'T-Shirt%'
ORDER BY Produktdetail;

------------------------------------------------------------------------------------------
-- 2. Welche Bekleidung passt am besten bei 90cm Hüftumfang?

SELECT pd.Produktdetail, pv.Breite, gr.Name
FROM PRODUKTVARIANTEN pv
INNER JOIN PRODUKTE pd ON pd.ProduktID=pv.ProduktNr
INNER JOIN Groessen gr ON gr.GroessenID=pv.GroessenNr
WHERE pv.Breite=(90/2);

------------------------------------------------------------------------------------------
-- 3. Welche Bekleidung passt am besten ab einer Länge von 80cm?

SELECT pd.Produktdetail, pv.Laenge, gr.Name
FROM PRODUKTVARIANTEN pv
INNER JOIN PRODUKTE pd ON pd.ProduktID=pv.ProduktNr
INNER JOIN Groessen gr ON gr.GroessenID=pv.GroessenNr
WHERE pv.Laenge>79
ORDER BY pv.Laenge ASC;

------------------------------------------------------------------------------------------
-- 4. Berechnen Sie den Warenwert aller Jacken

SELECT pd.Produktdetail,
FORMAT((((SELECT ISNULL(SUM(MENGE), 0) FROM PRODUKTEINKAUF pe WHERE pe.ProduktNr=pd.ProduktID) -
(SELECT ISNULL(SUM(MENGE), 0) FROM PRODUKTVERKAUF pv WHERE pv.ProduktNr=pd.ProduktID)) *
(SELECT AVG(pe.Einkaufspreis) FROM PRODUKTEINKAUF pe WHERE pe.ProduktNr=pd.ProduktID)), '#,##0.00 EUR') AS WARENWERT
FROM PRODUKTE pd
WHERE pd.KategorieNr IN(SELECT ka.KategorieID FROM KATEGORIEN ka WHERE ka.Name LIKE 'Jacke%');

------------------------------------------------------------------------------------------
-- 5. Berechnen Sie den Warenwert aller Kapuzenpullover

SELECT pd.Produktdetail,
FORMAT((((SELECT ISNULL(SUM(MENGE), 0) FROM PRODUKTEINKAUF pe WHERE pe.ProduktNr=pd.ProduktID) -
(SELECT ISNULL(SUM(MENGE), 0) FROM PRODUKTVERKAUF pv WHERE pv.ProduktNr=pd.ProduktID)) *
(SELECT AVG(pe.Einkaufspreis) FROM PRODUKTEINKAUF pe WHERE pe.ProduktNr=pd.ProduktID)), '#,##0.00 EUR') AS WARENWERT
FROM PRODUKTE pd
WHERE pd.KategorieNr IN(SELECT ka.KategorieID FROM KATEGORIEN ka WHERE ka.Name LIKE 'Kapuzenpullover%');

------------------------------------------------------------------------------------------
-- 6. Berechnen Sie den Warenwert je Kategorie

SELECT pd.KategorieNr,
FORMAT((ISNULL(SUM(MENGE), 0)-(SELECT ISNULL(SUM(MENGE), 0)FROM PRODUKTVERKAUF pv INNER JOIN PRODUKTE pd2 ON pd2.ProduktID=pv.ProduktNr WHERE pd2.KategorieNr=pd.KategorieNr)), '#,##0.00 EUR') AS WARENWERT
FROM PRODUKTEINKAUF pe
INNER JOIN PRODUKTE pd ON pd.ProduktID=pe.ProduktNr
GROUP BY pd.KategorieNr;


/*
SELECT pd.KategorieNr,
FORMAT(ISNULL(SUM(MENGE), 0)*AVG(pe.Einkaufspreis), '#,##0.00 EUR') AS WARENWERT
FROM PRODUKTEINKAUF pe
INNER JOIN PRODUKTE pd ON pd.ProduktID=pe.ProduktNr
GROUP BY pd.KategorieNr;
*/
------------------------------------------------------------------------------------------
-- 7. Welcher Artikelpreis ist der günstigste

SELECT MIN(an.Verkaufspreis)
FROM ANGEBOTE an;

SELECT DISTINCT an.Produktdetail, an.marke, an.verkaufspreis
FROM ANGEBOTE an
WHERE an.Verkaufspreis=(SELECT MIN(an.Verkaufspreis) FROM ANGEBOTE an);

/*
SELECT MIN(pv.Verkaufspreis)
FROM PRODUKTVARIANTEN pv;

*/
------------------------------------------------------------------------------------------
-- 8. Was ist das teuerste Produkt

SELECT DISTINCT an.Produktdetail, an.marke, an.verkaufspreis
FROM ANGEBOTE an
WHERE an.Verkaufspreis=(SELECT MAX(an.Verkaufspreis) FROM ANGEBOTE an);

------------------------------------------------------------------------------------------
-- 9. Was ist das günstigste Produkt

SELECT DISTINCT an.Produktdetail, an.marke, an.verkaufspreis
FROM ANGEBOTE an
WHERE an.Verkaufspreis=(SELECT MIN(an.Verkaufspreis) FROM ANGEBOTE an);

------------------------------------------------------------------------------------------
-- 10. Lassen sie sich die TOP 3 günstigsten Produkte anzeigen

SELECT TOP 3 an.Verkaufspreis, an.Produktdetail
FROM ANGEBOTE an
GROUP BY an.Verkaufspreis, an.Produktdetail
ORDER BY an.Verkaufspreis ASC;

------------------------------------------------------------------------------------------
-- 11. Lassen Sie sich die TOP 10 teuersten Produkte anzeigen

SELECT TOP 10 an.Verkaufspreis, an.Produktdetail
FROM ANGEBOTE an
GROUP BY an.Verkaufspreis, an.Produktdetail
ORDER BY an.Verkaufspreis DESC;

------------------------------------------------------------------------------------------
-- 12. Welche Farben sind für ein Produkt Fruit of the Loom Kapuzenpullover nicht verfügbar

SELECT *
FROM FARBEN fa
WHERE fa.FarbID NOT IN(
	SELECT DISTINCT FARBNR
	FROM Farbzusammensetzung fz
	WHERE fz.ProduktNr IN(
		SELECT pd.ProduktID
		FROM PRODUKTE pd
		WHERE pd.Produktdetail LIKE 'Fruit of the Loom Kapuzenpullover%')
);

------------------------------------------------------------------------------------------
-- 13. Welche Größen wurden bisher nicht verkauft

SELECT *
FROM GROESSEN
WHERE NAME NOT IN(
	SELECT gr.Name
	FROM Produktverkauf pv
	INNER JOIN GROESSEN gr ON pv.GroessenNr=gr.GroessenID
	WHERE pv.ProduktNr IS NOT NULL);

------------------------------------------------------------------------------------------

