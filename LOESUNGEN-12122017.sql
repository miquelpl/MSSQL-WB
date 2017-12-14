/*
Lesen Sie im Buch

Kapitel 10:
Seite 187 bis 197	Prozeduren

Prozeduren:
=======================
1. Erstellen Sie ein Programm, wo man eingeben kann, 
welches Produkt man genauer betrachten möchte.
Hat man ein Produkt gewählt soll angezeigt werden, in welchen Farben und Größen das Produkt verfügbar ist.
z.B.
Produktheadline: NoName T-Shirt
Produktbeschreibung: Das Standardshirt in vielen Varianten
Das Produkt gibt es in rot (5x), grün (10x), blau(3x)

Das Produkt gibt es in
M (mehr als 10mal)
L (3mal)
XL (nur noch 1mal)
XXL (ausverkauft)
*/

/*
2. Erstellen Sie eine Prozedur
um über Variablen Produkte zu verkaufen
(Denken Sie daran, welche Tabellen daran beteiligt sind, 
verwenden Sie auch eine Sequenz und Transaktionen)
*/

/*
1. Erstellen Sie ein Programm, wo man eingeben kann, 
welches Produkt man genauer betrachten möchte.
Hat man ein Produkt gewählt soll angezeigt werden, in welchen Farben und Größen das Produkt verfügbar ist.
z.B.
Produktheadline: NoName T-Shirt
Produktbeschreibung: Das Standardshirt in vielen Varianten
Das Produkt gibt es in rot (5x), grün (10x), blau(3x)

Das Produkt gibt es in
M (mehr als 10mal)
L (3mal)
XL (nur noch 1mal)
XXL (ausverkauft)
*/



SELECT 
pe.ProduktNR, 
pe.GroessenNr, 
SUM(pe.MENGE) AS MENGEEK, 
(SELECT ISNULL(SUM(pv.MENGE), 0) AS MENGEVK FROM PRODUKTVERKAUF pv WHERE pv.ProduktNR IS NOT NULL AND pv.ProduktNR=pe.ProduktNR AND pv.GroessenNr=pe.GroessenNr) MENGEVK,
SUM(pe.MENGE)
-
(SELECT ISNULL(SUM(pv.MENGE), 0) AS MENGEVK FROM PRODUKTVERKAUF pv WHERE pv.ProduktNR IS NOT NULL AND pv.ProduktNR=pe.ProduktNR AND pv.GroessenNr=pe.GroessenNr) TOTAL
FROM PRODUKTEINKAUF pe
GROUP BY pe.ProduktNR, pe.GroessenNr
ORDER BY pe.ProduktNR, pe.GroessenNr ASC;

SELECT 
pe.ProduktNR, 
pe.GroessenNr, 
SUM(pe.MENGE) AS MENGEEK, 
(SELECT ISNULL(SUM(pv.MENGE), 0) AS MENGEVK FROM PRODUKTVERKAUF pv WHERE pv.ProduktNR IS NOT NULL AND pv.ProduktNR=pe.ProduktNR AND pv.GroessenNr=pe.GroessenNr) MENGEVK,
SUM(pe.MENGE)
-
(SELECT ISNULL(SUM(pv.MENGE), 0) AS MENGEVK FROM PRODUKTVERKAUF pv WHERE pv.ProduktNR IS NOT NULL AND pv.ProduktNR=pe.ProduktNR AND pv.GroessenNr=pe.GroessenNr) TOTAL
FROM PRODUKTEINKAUF pe
WHERE pe.ProduktNR=2
GROUP BY pe.ProduktNR, pe.GroessenNr
ORDER BY pe.ProduktNR, pe.GroessenNr ASC;






SELECT PRODUKTNR, PRODUKTDETAIL, GROESSE, COUNT(*)
FROM GESAMTSORTIMENT
GROUP BY PRODUKTNR, PRODUKTDETAIL, GROESSE;

GROUP BY PRODUKTNR, PRODUKTDETAIL, GROESSENNR, FARBNR;

ORDER BY 1 DESC;


SELECT pe.ProduktNR, pe.GroessenNr, SUM(pe.MENGE) AS MENGEEK
FROM PRODUKTEINKAUF pe
GROUP BY pe.ProduktNR, pe.GroessenNr
ORDER BY pe.ProduktNR, pe.GroessenNr ASC;

SELECT pv.ProduktNR, pv.GroessenNr, ISNULL(SUM(pv.MENGE), 0) AS MENGEVK
FROM PRODUKTVERKAUF pv
WHERE pv.ProduktNR IS NOT NULL
GROUP BY pv.ProduktNR, pv.GroessenNr
ORDER BY pv.ProduktNR, pv.GroessenNr ASC;

SELECT pe.ProduktNR, pe.GroessenNr, SUM(pe.MENGE)-ISNULL(SUM(pv.MENGE), 0) AS MENGE, (SELECT pd.Produktdetail FROM PRODUKTE pd WHERE pd.ProduktID=pe.ProduktNR) AS NAME
FROM PRODUKTEINKAUF pe
LEFT OUTER JOIN PRODUKTVERKAUF pv ON pv.ProduktNr=pe.ProduktNr AND pv.GroessenNr=pe.GroessenNr
GROUP BY pe.ProduktNR, pe.GroessenNr
;

USE TESTDATENBANK;

EXEC MENGE_IN_LAGER_PER_PRODUKT_ID 2;


EXEC MENGE_IN_LAGER_PER_PRODUKT_NAME 'T-SHIRT';

DROP PROCEDURE MENGE_IN_LAGER_PER_NAME;

RENAME MENGE_IN_LAGER_PER_NAME



, (SELECT pd.Produktdetail FROM PRODUKTE pd WHERE pd.ProduktID=pe.ProduktNR) AS NAME



SELECT pe.ProduktNR, pe.GroessenNr, ISNULL(SUM(pe.MENGE), 0)-ISNULL(SUM(pv.MENGE), 0) AS MENGE
FROM PRODUKTEINKAUF pe
LEFT OUTER JOIN PRODUKTVERKAUF pv ON pv.ProduktNr=pe.ProduktNr AND pv.GroessenNr=pe.GroessenNr AND pv.ProduktNr IS NOT NULL
WHERE pe.ProduktNr=2
GROUP BY pe.ProduktNR, pe.GroessenNr;

SELECT pe.ProduktNR, pe.FarbNR, ISNULL(SUM(pe.MENGE), 0)-ISNULL(SUM(pv.MENGE), 0) AS MENGE
FROM PRODUKTEINKAUF pe
LEFT OUTER JOIN PRODUKTVERKAUF pv ON pv.ProduktNr=pe.ProduktNr AND pv.FarbNR=pe.FarbNR AND pv.ProduktNr IS NOT NULL
WHERE pe.ProduktNr=2
GROUP BY pe.ProduktNR, pe.FarbNR;

SELECT pe.ProduktNR, ISNULL(SUM(pe.MENGE), 0)-ISNULL(SUM(pv.MENGE), 0) AS MENGE
FROM PRODUKTEINKAUF pe
INNER JOIN PRODUKTVERKAUF pv ON pv.ProduktNr=pe.ProduktNr AND pv.ProduktNr IS NOT NULL
WHERE pe.ProduktNr=2
GROUP BY pe.ProduktNR

SELECT pe.ProduktNR, ISNULL((pe.MENGE), 0),ISNULL((pv.MENGE), 0) AS MENGE
FROM PRODUKTEINKAUF pe
LEFT OUTER JOIN PRODUKTVERKAUF pv ON pv.ProduktNr=pe.ProduktNr AND pv.ProduktNr IS NOT NULL
WHERE pe.ProduktNr=2

SELECT pe.ProduktNR, ISNULL((pe.MENGE), 0),ISNULL((pv.MENGE), 0) AS MENGE
FROM PRODUKTEINKAUF pe
INNER JOIN PRODUKTVERKAUF pv ON pv.ProduktNr=pe.ProduktNr AND pv.ProduktNr IS NOT NULL
WHERE pe.ProduktNr=2

SELECT pe.ProduktNR, ISNULL((pe.MENGE), 0),ISNULL((pv.MENGE), 0) AS MENGE
FROM PRODUKTEINKAUF pe, PRODUKTVERKAUF pv
WHERE pv.ProduktNr=pe.ProduktNr AND pe.ProduktNr=2 AND pv.FarbNR=pe.FarbNR AND pv.GroessenNr=pe.GroessenNr 



SELECT pe.ProduktNR, ISNULL(SUM(pe.MENGE), 0) EINKAUF
FROM PRODUKTEINKAUF pe
WHERE pe.ProduktNr=2
GROUP BY pe.ProduktNR


SELECT pv.ProduktNR, ISNULL(SUM(pv.MENGE), 0) AS VERKAUF
FROM PRODUKTVERKAUF pv
WHERE pv.ProduktNr=2
GROUP BY pv.ProduktNR







 AND pv.ProduktNr IS NOT NULL
pe.ProduktNr=2





SELECT *
FROM PRODUKTEINKAUF
WHERE PRODUKTNR=14;

SELECT *
FROM PRODUKTVERKAUF
WHERE PRODUKTNR=14;


SELECT *
FROM PRODUKTEINKAUF pe
LEFT OUTER JOIN PRODUKTVERKAUF pv ON pv.ProduktNr=pe.ProduktNr AND pv.GroessenNr=pe.GroessenNr
WHERE pe.ProduktNr=1


