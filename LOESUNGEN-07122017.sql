/*
Lesen Sie im Buch
Kapitel 5: 
98 bis 101	Views

Kapitel 6: 
116 bis 121	Views


View1: Monatsumsatz
- Ansicht mit monatliche Umsätze

View2: Monatskosten
- Ansicht mit monatliche Ausgaben

View3: Monatsbilanz
- Ansicht mit monatliche Umsätze und Ausgaben

View4: Topsellerumsatz
- Wieviel Umsatz mache ich mit den Topsellerprodukten

View5: Leerbestand
- Ausverkaufte Produkte

View6: Gesamtsortiment
- Gesamtsortiment anzeigen (Alle Attribute die zu einem Produkt gehören)
  inkl. Lagerbestand

View7: Mitarbeiterperformance
- Umsatz für jeden Mitarbeiter
*/

use testdatenbank;
------------------------------------------------------------------------------------------
-- View1: Monatsumsatz
-- Ansicht mit monatliche Umsätze

CREATE VIEW MONATSUMSATZ AS
SELECT FORMAT(re.DATUM, 'MM.yyyy') MONAT, FORMAT(SUM(BETRAG-ISNULL(RABATT, 0)*MENGE), '#,##0.00 €') AS Monatsumsatz
FROM PRODUKTVERKAUF pv
INNER JOIN RECHNUNGEN re ON re.RechnungsID=pv.RechnungsNr
WHERE pv.PRODUKTNR IS NOT NULL
GROUP BY FORMAT(re.DATUM, 'MM.yyyy');

ALTER VIEW MONATSUMSATZ AS
SELECT FORMAT(re.DATUM, 'MM.yyyy') MONAT, SUM(BETRAG-ISNULL(RABATT, 0)*MENGE) AS Monatsumsatz
FROM PRODUKTVERKAUF pv
INNER JOIN RECHNUNGEN re ON re.RechnungsID=pv.RechnungsNr
WHERE pv.PRODUKTNR IS NOT NULL
GROUP BY FORMAT(re.DATUM, 'MM.yyyy');

SELECT *
FROM MONATSUMSATZ;


------------------------------------------------------------------------------------------
-- View2: Monatskosten
-- Ansicht mit monatliche Ausgaben

CREATE VIEW MONATSKOSTEN AS
SELECT FORMAT(pe.Datum, 'MM.yyyy') MONAT, FORMAT(SUM(pe.Menge*pe.Einkaufspreis), '#,##0.00 €') AS Monatskosten
FROM PRODUKTEINKAUF pe
GROUP BY FORMAT(pe.DATUM, 'MM.yyyy');

ALTER VIEW MONATSKOSTEN AS
SELECT FORMAT(pe.Datum, 'MM.yyyy') MONAT, SUM(pe.Menge*pe.Einkaufspreis) AS Monatskosten
FROM PRODUKTEINKAUF pe
GROUP BY FORMAT(pe.DATUM, 'MM.yyyy');

SELECT *
FROM MONATSKOSTEN;


------------------------------------------------------------------------------------------
-- View3: Monatsbilanz
-- Ansicht mit monatliche Umsätze und Ausgaben

CREATE VIEW MONATSBILANZ AS
SELECT mu.MONAT MONAT, FORMAT(Monatsumsatz, '#,##0.00 €') Monatsumsatz, FORMAT(Monatskosten, '#,##0.00 €') Monatskosten, FORMAT(Monatsumsatz-Monatskosten, '#,##0.00 €') AS Monatsbilanz
FROM MONATSUMSATZ mu
INNER JOIN MONATSKOSTEN mk ON mk.MONAT=mu.MONAT;

SELECT *
FROM MONATSBILANZ;

------------------------------------------------------------------------------------------
-- View4: Topsellerumsatz
-- Wieviel Umsatz mache ich mit den Topsellerprodukten

CREATE VIEW TOPSELLERUMSATZ AS
SELECT 
	pv.ProduktNr AS PRODUKT, 
	(SELECT PRODUKTDETAIL FROM PRODUKTE WHERE PRODUKTID=pv.PRODUKTNR) AS NAME, 
	FORMAT(SUM(BETRAG-ISNULL(RABATT, 0)*MENGE), '#,##0.00 €') AS Umsatz
FROM PRODUKTVERKAUF pv
WHERE pv.PRODUKTNR IS NOT NULL
GROUP BY pv.ProduktNr;
--ORDER BY Umsatz DESC;

SELECT *
FROM TOPSELLERUMSATZ;

------------------------------------------------------------------------------------------
-- View5: Leerbestand
-- Ausverkaufte Produkte

CREATE VIEW VIEW_BESTAND AS
SELECT 
pd.ProduktID, 
pd.Produktdetail, 
(SELECT ISNULL(SUM(pe.Menge), 0) FROM PRODUKTEINKAUF pe WHERE pe.ProduktNr=pd.ProduktID) AS "Eingekaufte Menge",
(SELECT ISNULL(SUM(pv.Menge), 0) FROM PRODUKTVERKAUF pv WHERE pv.ProduktNr=pd.ProduktID) AS "Verkaufte Menge",
(SELECT ISNULL(SUM(pe.Menge), 0) FROM PRODUKTEINKAUF pe WHERE pe.ProduktNr=pd.ProduktID) -
(SELECT ISNULL(SUM(pv.Menge), 0) FROM PRODUKTVERKAUF pv WHERE pv.ProduktNr=pd.ProduktID) AS "Lagerbestand"
FROM PRODUKTE pd;

CREATE VIEW LEERBESTAND AS
SELECT *
FROM VIEW_BESTAND
WHERE LAGERBESTAND=0;

SELECT *
FROM VIEW_BESTAND
WHERE LAGERBESTAND<100;

SELECT *
FROM LEERBESTAND;

/*
ALTER VIEW LEERBESTAND AS
SELECT 
pd.ProduktID, 
pd.Produktdetail, 
(SELECT ISNULL(SUM(pe.Menge), 0) FROM PRODUKTEINKAUF pe WHERE pe.ProduktNr=pd.ProduktID) AS "Eingekaufte Menge",
(SELECT ISNULL(SUM(pv.Menge), 0) FROM PRODUKTVERKAUF pv WHERE pv.ProduktNr=pd.ProduktID) AS "Verkaufte Menge",
(SELECT ISNULL(SUM(pe.Menge), 0) FROM PRODUKTEINKAUF pe WHERE pe.ProduktNr=pd.ProduktID) -
(SELECT ISNULL(SUM(pv.Menge), 0) FROM PRODUKTVERKAUF pv WHERE pv.ProduktNr=pd.ProduktID) AS [Lagerbestand]
FROM PRODUKTE pd
WHERE
(SELECT ISNULL(SUM(pe.Menge), 0) FROM PRODUKTEINKAUF pe WHERE pe.ProduktNr=pd.ProduktID) -
(SELECT ISNULL(SUM(pv.Menge), 0) FROM PRODUKTVERKAUF pv WHERE pv.ProduktNr=pd.ProduktID)=0;

SELECT 
pe.ProduktNr, 
pd.Produktdetail, 
SUM(pe.Menge) "Eingekauft Menge", 
(SELECT ISNULL(SUM(pv.Menge), 0) FROM PRODUKTVERKAUF pv WHERE pv.ProduktNr=pe.ProduktNr) AS "Verkauft Menge",
SUM(pe.Menge) - 
(SELECT ISNULL(SUM(pv.Menge), 0) FROM PRODUKTVERKAUF pv WHERE pv.ProduktNr=pe.ProduktNr) AS "Lagerbestand"
FROM Produkteinkauf pe
INNER JOIN PRODUKTE pd ON pd.ProduktID=pe.ProduktNr
GROUP BY pe.ProduktNr, pd.Produktdetail;
*/

------------------------------------------------------------------------------------------
-- View6: Gesamtsortiment
-- Gesamtsortiment anzeigen (Alle Attribute die zu einem Produkt gehören)  inkl. Lagerbestand

CREATE VIEW GESAMTSORTIMENT AS
SELECT 
pd.ProduktID, 
pd.Produktdetail,
(SELECT NAME FROM MARKEN ma WHERE ma.MarkenID=pd.MarkenNr) AS MARKE,
FORMAT((SELECT AVG(pe.Einkaufspreis) FROM Produkteinkauf pe WHERE pe.ProduktNr=pd.PRODUKTID GROUP BY pe.ProduktNr), '#,##0.00 €') AS "Einkauf PREIS",
FORMAT((SELECT AVG(pv.Verkaufspreis) FROM Produktvarianten pv WHERE pv.ProduktNr=pd.PRODUKTID GROUP BY pv.ProduktNr), '#,##0.00 €') AS "Verkauf PREIS",
(SELECT ISNULL(SUM(pe.Menge), 0) FROM PRODUKTEINKAUF pe WHERE pe.ProduktNr=pd.ProduktID) AS "Eingekaufte Menge",
(SELECT ISNULL(SUM(pv.Menge), 0) FROM PRODUKTVERKAUF pv WHERE pv.ProduktNr=pd.ProduktID) AS "Verkaufte Menge",
(SELECT ISNULL(SUM(pe.Menge), 0) FROM PRODUKTEINKAUF pe WHERE pe.ProduktNr=pd.ProduktID) -
(SELECT ISNULL(SUM(pv.Menge), 0) FROM PRODUKTVERKAUF pv WHERE pv.ProduktNr=pd.ProduktID) AS "Lagerbestand"
FROM PRODUKTE pd;

SELECT 
pd.ProduktID, 
pd.Produktdetail,
(SELECT NAME FROM MARKEN ma WHERE ma.MarkenID=pd.MarkenNr) AS MARKE,
FORMAT((SELECT AVG(pe.Einkaufspreis) FROM Produkteinkauf pe WHERE pe.ProduktNr=pd.PRODUKTID GROUP BY pe.ProduktNr), '#,##0.00 €') AS "Einkauf PREIS",
FORMAT((SELECT AVG(pv.Verkaufspreis) FROM Produktvarianten pv WHERE pv.ProduktNr=pd.PRODUKTID GROUP BY pv.ProduktNr), '#,##0.00 €') AS "Verkauf PREIS",
(SELECT ISNULL(SUM(pe.Menge), 0) FROM PRODUKTEINKAUF pe WHERE pe.ProduktNr=pd.ProduktID) AS "Eingekaufte Menge",
(SELECT ISNULL(SUM(pv.Menge), 0) FROM PRODUKTVERKAUF pv WHERE pv.ProduktNr=pd.ProduktID) AS "Verkaufte Menge",
(SELECT ISNULL(SUM(pe.Menge), 0) FROM PRODUKTEINKAUF pe WHERE pe.ProduktNr=pd.ProduktID) -
(SELECT ISNULL(SUM(pv.Menge), 0) FROM PRODUKTVERKAUF pv WHERE pv.ProduktNr=pd.ProduktID) AS "Lagerbestand"

SELECT pe.ProduktNr, pe.GroessenNr, pe.FarbNr, sum(pe.Menge)
FROM PRODUKTEINKAUF pe
INNER JOIN PRODUKTE pd ON 
GROUP BY pe.ProduktNr, pe.GroessenNr, pe.FarbNr;







SELECT *
FROM GESAMTSORTIMENT
WHERE ProduktID=5;


------------------------------------------------------------------------------------------
-- View7: Mitarbeiterperformance
-- Umsatz für jeden Mitarbeiter

CREATE VIEW MITARBEITERPERFORMANCE AS
SELECT 
pv.MitarbeiterNr, 
(SELECT ma.Name + ', ' + ma.Vorname FROM MITARBEITER ma WHERE ma.MitarbeiterID=pv.MitarbeiterNr) "VERKÄUFER/IN",
FORMAT(SUM(BETRAG-ISNULL(RABATT, 0)*MENGE), '#,##0.00 €') AS Umsatz
FROM PRODUKTVERKAUF pv
WHERE pv.ProduktNr IS NOT NULL
GROUP BY pv.MitarbeiterNr;

SELECT *
FROM MITARBEITERPERFORMANCE;

SELECT *
FROM MITARBEITERPERFORMANCE
WHERE MitarbeiterNr=2;


/*
SELECT *
FROM MITARBEITER

SELECT *
FROM RECHNUNGEN

SELECT *
FROM PRODUKTVERKAUF

SELECT pv.MitarbeiterNr, FORMAT(SUM(BETRAG-ISNULL(RABATT, 0)*MENGE), '#,##0.00 €') AS Umsatz
FROM PRODUKTVERKAUF pv
INNER JOIN MITARBEITER ma ON ma.MitarbeiterID=pv.MitarbeiterNr
WHERE pv.ProduktNr IS NOT NULL
GROUP BY pv.MitarbeiterNr;
*/

------------------------------------------------------------------------------------------

--INSERT INTO Produktverkauf VALUES(12,1,6,79.95,5,80,14,2,5,6)
INSERT INTO Produktverkauf VALUES(13,2,6,79.95,5,80,14,2,5,6)
INSERT INTO Produktverkauf VALUES(14,3,6,79.95,5,80,14,2,5,6)

INSERT INTO Produktverkauf VALUES(15,1,7,79.95,5,80,14,3,5,6)
INSERT INTO Produktverkauf VALUES(16,1,6,79.95,5,80,14,2,5,6)
INSERT INTO Produktverkauf VALUES(17,1,6,79.95,5,80,14,2,5,6)
INSERT INTO Produktverkauf VALUES(18,1,6,79.95,5,80,14,2,5,6)
INSERT INTO Produktverkauf VALUES(19,1,6,79.95,5,80,14,2,5,6)
INSERT INTO Produktverkauf VALUES(20,1,6,79.95,5,80,14,2,5,6)
INSERT INTO Produktverkauf VALUES(21,1,6,79.95,5,80,14,2,5,6)

