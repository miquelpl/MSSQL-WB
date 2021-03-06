SELECT *
from Produktvarianten as p, groessen as g
where p.GroessenNr = g.GroessenID;

BEGIN TRANSACTION
UPDATE PRODUKTVARIANTEN
SET 
Laenge = ( CASE 
WHEN GroessenNr = 1 THEN 67
WHEN GroessenNr = 2 THEN 70
WHEN GroessenNr = 3 THEN 73
WHEN GroessenNr = 4 THEN 75
WHEN GroessenNr = 5 THEN 77
WHEN GroessenNr = 6 THEN 79
WHEN GroessenNr = 7 THEN 82
WHEN GroessenNr = 8 THEN 84
WHEN GroessenNr = 9 THEN 86
END),
Breite = ( CASE 
WHEN GroessenNr = 1 THEN 45
WHEN GroessenNr = 2 THEN 48
WHEN GroessenNr = 3 THEN 50
WHEN GroessenNr = 4 THEN 52
WHEN GroessenNr = 5 THEN 54
WHEN GroessenNr = 6 THEN 58
WHEN GroessenNr = 7 THEN 60
WHEN GroessenNr = 8 THEN 62
WHEN GroessenNr = 9 THEN 64
END)
;
rollback;

option 2

BEGIN TRANSACTION
UPDATE PRODUKTVARIANTEN
SET Laenge = 67, Breite = 45
WHERE GroessenNr = 1;

UPDATE PRODUKTVARIANTEN
SET Laenge = 70, Breite =  48
WHERE GroessenNr = 2;

UPDATE PRODUKTVARIANTEN
SET Laenge = 73, Breite =  50
WHERE GroessenNr = 3;

UPDATE PRODUKTVARIANTEN
SET Laenge = 75, Breite =  52
WHERE GroessenNr = 4;

UPDATE PRODUKTVARIANTEN
SET Laenge = 77, Breite =  54
WHERE GroessenNr = 5;

UPDATE PRODUKTVARIANTEN
SET Laenge = 79, Breite =  58
WHERE GroessenNr = 6;

UPDATE PRODUKTVARIANTEN
SET Laenge = 82, Breite =  60
WHERE GroessenNr = 7;

UPDATE PRODUKTVARIANTEN
SET Laenge = 84, Breite =  62
WHERE GroessenNr = 8;

UPDATE PRODUKTVARIANTEN
SET Laenge = 86, Breite =  64
WHERE GroessenNr = 9;

rollback;

---------------------
Alle Longshirts sollen 15cm länger sein

SELECT *
from Produktvarianten as pv, Kategorien as k, produkte as p
where pv.ProduktNr = p.ProduktID and
p.KategorieNr = k.KategorieID and
k.Name like 'Longshirt%';


BEGIN TRANSACTION
update Produktvarianten set
Laenge = Laenge + 15
where ProduktNr in(
SELECT DISTINCT pv.ProduktNr
from Produktvarianten as pv, Kategorien as k, produkte as p
where pv.ProduktNr = p.ProduktID and
p.KategorieNr = k.KategorieID and
k.Name like 'Longshirt%');

rollback;

------------------------------------------------------------------

Alle Bekleidungsstücke für Frauen 10cm kürzer, und 15cm weniger Breite

SELECT *
from Produktvarianten as pv, produkte as p, Zielgruppen as z
where pv.ProduktNr = p.ProduktID and
p.KategorieNr = z.ZielgruppenID and
z.Name like 'Frau%';

BEGIN TRANSACTION
update Produktvarianten set
Laenge = Laenge - 10,
Breite = Breite -15
where ProduktNr in(
SELECT DISTINCT pv.ProduktNr
from Produktvarianten as pv, produkte as p, Zielgruppen as z
where pv.ProduktNr = p.ProduktID and
p.KategorieNr = z.ZielgruppenID and
z.Name like 'Frau%'
);

rollback;

------------------------------------------------------------------

Alle Hosen erhalten eine feste Länge von 88

SELECT *
from Produktvarianten as pv, Kategorien as k, produkte as p
where pv.ProduktNr = p.ProduktID and
p.KategorieNr = k.KategorieID and
k.Name like 'Hose%';


BEGIN TRANSACTION
update Produktvarianten set
Laenge = 88
where ProduktNr in(
SELECT DISTINCT pv.ProduktNr
from Produktvarianten as pv, Kategorien as k, produkte as p
where pv.ProduktNr = p.ProduktID and
p.KategorieNr = k.KategorieID and
k.Name like 'Hose%');

rollback;

------------------------------------------------------------------

Carhartt, Esprit, Superdry fällt 3cm kleiner aus

select *
from produkte as p, Marken m
where p.MarkenNr=m.MarkenID and
m.Name in ('Carhartt', 'Esprit', 'Superdry');


BEGIN TRANSACTION
update Produkte set
Produktdetail = Produktdetail + ', fällt 3cm kleiner aus'
where ProduktID in(
select p.ProduktID
from produkte as p, Marken m
where p.MarkenNr=m.MarkenID and
m.Name in ('Carhartt', 'Esprit', 'Superdry'));

rollback;

------------------------------------------------------------------

Nike und Puma fällt 2cm größer aus

select *
from produkte as p, Marken m
where p.MarkenNr=m.MarkenID and
m.Name in ('Nike', 'Puma');


select SUBSTRING(Produktdetail, 1, IIF(PATINDEX('%,%fällt%', Produktdetail)=0, LEN(Produktdetail), PATINDEX('%,%fällt%', Produktdetail)-1))

select SUBSTRING(Produktdetail, 1, IIF(PATINDEX('%,%fällt%', Produktdetail)=0, LEN(Produktdetail), PATINDEX('%,%fällt%', Produktdetail)-1)) + ', fällt 2cm größer aus'

select *
from produkte as p, Marken m
where p.MarkenNr=m.MarkenID and
m.Name in ('Nike', 'Puma');

BEGIN TRANSACTION
update Produkte set
Produktdetail = SUBSTRING(Produktdetail, 1, IIF(PATINDEX('%,%fällt%', Produktdetail)=0, LEN(Produktdetail), PATINDEX('%,%fällt%', Produktdetail)-1)) + ', fällt 2cm größer aus'
where ProduktID in(
select p.ProduktID
from produkte as p, Marken m
where p.MarkenNr=m.MarkenID and
m.Name in ('Nike', 'Puma'));

rollback;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

SELECT pr.ProduktID ID, pr.Produktdetail, ma.Name Marke, zg.Name Zielgruppe, ka.Name Kategorie, gr.Name Groesse, pv.Breite, pv.Laenge, pv.Verkaufspreis, fa.Name Farbe
FROM Produkte pr, Produktvarianten pv, Groessen gr, Farbzusammensetzung fz, Farben fa, Marken ma, Zielgruppen zg, Kategorien ka
WHERE
pr.ProduktID=pv.ProduktNr and
pv.GroessenNr=gr.GroessenID and
fz.ProduktNr=pr.ProduktID and
fa.FarbID=fz.FarbNr and
ma.MarkenID=pr.MarkenNr and
zg.ZielgruppenID=pr.ZielgruppenNr and
ka.KategorieID=pr.KategorieNr

SELECT DISTINCT pr.Produktdetail as  "Produkt", pv.Verkaufspreis

SELECT pr.Produktdetail as  "Produkt", pv.Verkaufspreis
SELECT DISTINCT pr.ProduktID, pr.Produktdetail as  "Produkt", pv.Verkaufspreis
FROM Produkte pr, Produktvarianten pv
WHERE
pr.ProduktID=pv.ProduktNr;

SELECT pr.ProduktID ID, pr.Produktdetail, ma.Name Marke, zg.Name Zielgruppe, ka.Name Kategorie, gr.Name Groesse, pv.Breite, pv.Laenge, pv.Verkaufspreis, fa.Name Farbe
FROM Produkte pr, Produktvarianten pv, Groessen gr, Farbzusammensetzung fz, Farben fa, Marken ma, Zielgruppen zg, Kategorien ka
WHERE
pr.ProduktID=pv.ProduktNr and
pv.GroessenNr=gr.GroessenID and
fz.ProduktNr=pr.ProduktID and
fa.FarbID=fz.FarbNr and
ma.MarkenID=pr.MarkenNr and
zg.ZielgruppenID=pr.ZielgruppenNr and
ka.KategorieID=pr.KategorieNr and
zg.Name like 'Männer%';


SELECT pr.ProduktID ID, pr.Produktdetail, ma.Name Marke, zg.Name Zielgruppe, ka.Name Kategorie, gr.Name Groesse, pv.Breite, pv.Laenge, pv.Verkaufspreis, fa.Name Farbe
FROM Produkte pr, Produktvarianten pv, Groessen gr, Farbzusammensetzung fz, Farben fa, Marken ma, Zielgruppen zg, Kategorien ka
WHERE
pr.ProduktID=pv.ProduktNr and
pv.GroessenNr=gr.GroessenID and
fz.ProduktNr=pr.ProduktID and
fa.FarbID=fz.FarbNr and
ma.MarkenID=pr.MarkenNr and
zg.ZielgruppenID=pr.ZielgruppenNr and
ka.KategorieID=pr.KategorieNr and
zg.Name like 'Frau%';

SELECT pr.ProduktID ID, pr.Produktdetail, ma.Name Marke, zg.Name Zielgruppe, ka.Name Kategorie, gr.Name Groesse, pv.Breite, pv.Laenge, pv.Verkaufspreis, fa.Name Farbe
FROM Produkte pr, Produktvarianten pv, Groessen gr, Farbzusammensetzung fz, Farben fa, Marken ma, Zielgruppen zg, Kategorien ka
WHERE
pr.ProduktID=pv.ProduktNr and
pv.GroessenNr=gr.GroessenID and
fz.ProduktNr=pr.ProduktID and
fa.FarbID=fz.FarbNr and
ma.MarkenID=pr.MarkenNr and
pr.ZielgruppenNr IN (SELECT ZielgruppenID FROM Zielgruppen WHERE zg.Name like 'Frau%') and
ka.KategorieID=pr.KategorieNr;


SELECT pr.ProduktID ID, pr.Produktdetail, ma.Name Marke, zg.Name Zielgruppe, ka.Name Kategorie, gr.Name Groesse, pv.Breite, pv.Laenge, pv.Verkaufspreis, fa.Name Farbe
FROM Produkte pr, Produktvarianten pv, Groessen gr, Farbzusammensetzung fz, Farben fa, Marken ma, Zielgruppen zg, Kategorien ka
WHERE
pr.ProduktID=pv.ProduktNr and
pv.GroessenNr=gr.GroessenID and
fz.ProduktNr=pr.ProduktID and
fa.FarbID=fz.FarbNr and
ma.MarkenID=pr.MarkenNr and
pr.ZielgruppenNr IN (SELECT ZielgruppenID FROM Zielgruppen WHERE zg.Name IN ('Frauen', 'Männer')) and
ka.KategorieID=pr.KategorieNr
ORDER BY 4 ASC, 9 DESC;

SELECT pr.ProduktID ID, pr.Produktdetail, ma.Name Marke, zg.Name Zielgruppe, ka.Name Kategorie, gr.Name Groesse, pv.Breite, pv.Laenge, pv.Verkaufspreis, fa.Name Farbe
FROM Produkte pr, Produktvarianten pv, Groessen gr, Farbzusammensetzung fz, Farben fa, Marken ma, Zielgruppen zg, Kategorien ka
WHERE
pr.ProduktID=pv.ProduktNr and
pv.GroessenNr=gr.GroessenID and
fz.ProduktNr=pr.ProduktID and
fa.FarbID=fz.FarbNr and
ma.MarkenID=pr.MarkenNr and
zg.ZielgruppenID=pr.ZielgruppenNr and
ka.KategorieID=pr.KategorieNr and
pr.Produktdetail LIKE '%Jacke%';


SELECT pr.ProduktID ID, pr.Produktdetail, ma.Name Marke, zg.Name Zielgruppe, ka.Name Kategorie, gr.Name Groesse, pv.Breite, pv.Laenge, pv.Verkaufspreis, fa.Name Farbe
FROM Produkte pr, Produktvarianten pv, Groessen gr, Farbzusammensetzung fz, Farben fa, Marken ma, Zielgruppen zg, Kategorien ka
WHERE
pr.ProduktID=pv.ProduktNr and
pv.GroessenNr=gr.GroessenID and
fz.ProduktNr=pr.ProduktID and
fa.FarbID=fz.FarbNr and
ma.MarkenID=pr.MarkenNr and
zg.ZielgruppenID=pr.ZielgruppenNr and
ka.KategorieID=pr.KategorieNr and
fa.Name IN ('rot', 'gelb', 'orange')
ORDER BY fa.Name, gr.GroessenID ASC;

SELECT pr.ProduktID ID, pr.Produktdetail, ma.Name Marke, zg.Name Zielgruppe, ka.Name Kategorie, gr.Name Groesse, pv.Breite, pv.Laenge, pv.Verkaufspreis, fa.Name Farbe
FROM Produkte pr, Produktvarianten pv, Groessen gr, Farbzusammensetzung fz, Farben fa, Marken ma, Zielgruppen zg, Kategorien ka
WHERE
pr.ProduktID=pv.ProduktNr and
pv.GroessenNr=gr.GroessenID and
fz.ProduktNr=pr.ProduktID and
fa.FarbID=fz.FarbNr and
ma.MarkenID=pr.MarkenNr and
zg.ZielgruppenID=pr.ZielgruppenNr and
ka.KategorieID=pr.KategorieNr and
pv.Verkaufspreis NOT IN (39.95, 29.95);

SELECT pr.ProduktID ID, pr.Produktdetail, ma.Name Marke, zg.Name Zielgruppe, ka.Name Kategorie, gr.Name Groesse, pv.Breite, pv.Laenge, pv.Verkaufspreis, fa.Name Farbe
FROM Produkte pr, Produktvarianten pv, Groessen gr, Farbzusammensetzung fz, Farben fa, Marken ma, Zielgruppen zg, Kategorien ka
WHERE
pr.ProduktID=pv.ProduktNr and
pv.GroessenNr=gr.GroessenID and
fz.ProduktNr=pr.ProduktID and
fa.FarbID=fz.FarbNr and
ma.MarkenID=pr.MarkenNr and
zg.ZielgruppenID=pr.ZielgruppenNr and
ka.KategorieID=pr.KategorieNr and
pv.Verkaufspreis NOT IN (39.95, 29.95)
order by pv.Verkaufspreis ASC;

select *
from produkte as p, Marken m
where p.MarkenNr=m.MarkenID and
m.Name LIKE ('[AEIOU]%');

SELECT pr.ProduktID ID, pr.Produktdetail, ma.Name Marke, zg.Name Zielgruppe, ka.Name Kategorie, gr.Name Groesse, pv.Breite, pv.Laenge, pv.Verkaufspreis, fa.Name Farbe
FROM Produkte pr, Produktvarianten pv, Groessen gr, Farbzusammensetzung fz, Farben fa, Marken ma, Zielgruppen zg, Kategorien ka
WHERE
pr.ProduktID=pv.ProduktNr and
pv.GroessenNr=gr.GroessenID and
fz.ProduktNr=pr.ProduktID and
fa.FarbID=fz.FarbNr and
ma.MarkenID=pr.MarkenNr and
zg.ZielgruppenID=pr.ZielgruppenNr and
ka.KategorieID=pr.KategorieNr and
pv.Verkaufspreis NOT BETWEEN 25 AND 75
order by pv.Verkaufspreis ASC;

use fashionshop






