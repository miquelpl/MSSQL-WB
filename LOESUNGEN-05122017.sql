/*
Lesen Sie im Buch
Kapitel 6: 
Seite 110 bis 112	Joins

1. Zeigen Sie alle Produkte und deren mögliche Farben an
2. Welche Farben hat das Produkt Nr 5
3. Welches Produkt wurde in welcher Farbe verkauft
4. Welches Produkt wurde in welcher Größe verkauft
5. Welche Größen wurden bisher verkauft
6. Welche Kategorien haben Produkte
7. Welche Kategorien haben keine Produkte
8. Welcher Mitarbeiter hat welches Produkt verkauft
9. Welche Produkte wurden mit der ersten Rechnung verkauft
10. Welche Produkte wurden mit der zweiten Rechnung verkauft
*/

------------------------------------------------------------------------------------------
-- 1. Zeigen Sie alle Produkte und deren mögliche Farben an

SELECT pd.ProduktID, pd.Produktdetail, fa.Name
FROM Farbzusammensetzung fs
INNER JOIN PRODUKTE pd ON fs.ProduktNR=pd.ProduktID
INNER JOIN FARBEN fa ON fs.FarbNr=fa.FarbID;

SELECT pd.ProduktID, pd.Produktdetail, fa.Name
FROM PRODUKTE pd, Farbzusammensetzung fs, FARBEN fa
WHERE 
	pd.ProduktID=fs.ProduktNR and
	fs.FarbNr=fa.FarbID;

------------------------------------------------------------------------------------------
-- 2. Welche Farben hat das Produkt Nr 5

SELECT pd.ProduktID, pd.Produktdetail, fa.Name
FROM Farbzusammensetzung fs
INNER JOIN PRODUKTE pd ON fs.ProduktNR=pd.ProduktID
INNER JOIN FARBEN fa ON fs.FarbNr=fa.FarbID
WHERE pd.ProduktID=5;

SELECT pd.ProduktID, pd.Produktdetail, fa.Name
FROM PRODUKTE pd, Farbzusammensetzung fs, FARBEN fa
WHERE 
	pd.ProduktID=fs.ProduktNR and
	fs.FarbNr=fa.FarbID and
	pd.ProduktID=5;

------------------------------------------------------------------------------------------
-- 3. Welches Produkt wurde in welcher Farbe verkauft

SELECT pd.ProduktID, pd.Produktdetail, fa.Name
FROM Produktverkauf pv
INNER JOIN PRODUKTE pd ON pv.ProduktNR=pd.ProduktID
INNER JOIN FARBEN fa ON pv.FarbNr=fa.FarbID;

------------------------------------------------------------------------------------------
-- 4. Welches Produkt wurde in welcher Größe verkauft

SELECT pd.ProduktID, pd.Produktdetail, gr.Name
FROM Produktverkauf pv
INNER JOIN PRODUKTE pd ON pv.ProduktNR=pd.ProduktID
INNER JOIN GROESSEN gr ON pv.GroessenNr=gr.GroessenID;

------------------------------------------------------------------------------------------
-- 5. Welche Größen wurden bisher verkauft

SELECT gr.Name, COUNT(1) "Mal verkauft"
FROM Produktverkauf pv
INNER JOIN GROESSEN gr ON pv.GroessenNr=gr.GroessenID
GROUP BY gr.Name;

------------------------------------------------------------------------------------------
-- 6. Welche Kategorien haben Produkte

SELECT ka.Name, COUNT(1) Einfall
FROM KATEGORIEN ka
INNER JOIN PRODUKTE pr ON ka.KategorieID=pr.KategorieNr
GROUP BY ka.Name;

SELECT *
FROM KATEGORIEN ka
LEFT JOIN PRODUKTE pr ON ka.KategorieID=pr.KategorieNr;

------------------------------------------------------------------------------------------
-- 7. Welche Kategorien haben keine Produkte

SELECT ka.KategorieID, ka.Name
FROM KATEGORIEN ka
LEFT JOIN PRODUKTE pr ON ka.KategorieID=pr.KategorieNr
WHERE pr.ProduktID IS NULL;

------------------------------------------------------------------------------------------
-- 8. Welcher Mitarbeiter hat welches Produkt verkauft

SELECT ma.MitarbeiterID, ma.Name + ', ' + ma.Vorname, pd.ProduktID, pd.Produktdetail
FROM Produktverkauf pv
INNER JOIN PRODUKTE pd ON pv.ProduktNR=pd.ProduktID
INNER JOIN MITARBEITER ma ON pv.MitarbeiterNr=ma.MitarbeiterID;

------------------------------------------------------------------------------------------
-- 9. Welche Produkte wurden mit der ersten Rechnung verkauft

SELECT re.RechnungsID, re.Datum, pd.ProduktID, pd.Produktdetail
FROM Produktverkauf pv
INNER JOIN RECHNUNGEN re ON re.RechnungsID=pv.RechnungsNr
INNER JOIN PRODUKTE pd ON pv.ProduktNR=pd.ProduktID
WHERE re.RechnungsID = (SELECT MIN(RechnungsID) FROM Rechnungen);

SELECT re.RechnungsID, re.Datum, pd.ProduktID, pd.Produktdetail, pv.FarbNr, pv.GroessenNr
FROM Produktverkauf pv
INNER JOIN RECHNUNGEN re ON re.RechnungsID=pv.RechnungsNr
INNER JOIN PRODUKTE pd ON pv.ProduktNR=pd.ProduktID
WHERE re.RechnungsID = 2;

SELECT TOP 1 *
FROM RECHNUNGEN re
ORDER BY re.RechnungsID ASC;

------------------------------------------------------------------------------------------
-- 10. Welche Produkte wurden mit der zweiten Rechnung verkauft

SELECT re.RechnungsID, re.Datum, pd.ProduktID, pd.Produktdetail, pv.FarbNr, pv.GroessenNr
FROM Produktverkauf pv
INNER JOIN RECHNUNGEN re ON re.RechnungsID=pv.RechnungsNr
INNER JOIN PRODUKTE pd ON pv.ProduktNR=pd.ProduktID
WHERE re.RechnungsID = 2;

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
