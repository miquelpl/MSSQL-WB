/*
Lesen Sie im Buch

Kapitel 10:
Seite 204 bis 208	DML-Trigger

1. Verhindern Sie den Verkauf, wenn die Ware nicht auf Lager ist
2. Nach dem Verkauf Meldung anzeigen, wenn weniger als 5 Artikel vorhanden sind und 
   einen Bestellhinweis anzeigen, wenn der Bestand geringer als 2 ist
3. Erzeugen Sie eine Ereignis-Hinweistabelle für Produktverkauf
4. Produkte (die vorhanden sind) dürfen nicht mehr bearbeitet werden
5. Produkteinkauf bei max. Menge 100 (Bestand) verbieten
*/


---------------------------------------------------------------------------------------
/*
1. Verhindern Sie den Verkauf, wenn die Ware nicht auf Lager ist
*/
---------------------------------------------------------------------------------------
SELECT *
FROM VIEW_BESTAND;

SELECT * --SUM(LAGERBESTAND)
FROM GESAMTSORTIMENT;

/***************************************************************************/
ALTER TRIGGER VERKAUF_VERHINDERN
ON PRODUKTVERKAUF
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @PRODUKTNR int;
	DECLARE @GROESSENNR int;
	DECLARE @FARBNR int;
	DECLARE @MENGE tinyint;
	DECLARE @NEUEMENGE tinyint;
	DECLARE @LAGERBESTAND int;

	IF EXISTS(SELECT * from DELETED)
	BEGIN
		SELECT @PRODUKTNR=PRODUKTNR, @GROESSENNR=GROESSENNR, @FARBNR=FARBNR, @NEUEMENGE=MENGE FROM INSERTED;
		PRINT @NEUEMENGE;
	END

	IF EXISTS(SELECT * from INSERTED)
	BEGIN
		SELECT @PRODUKTNR=PRODUKTNR, @GROESSENNR=GROESSENNR, @FARBNR=FARBNR, @MENGE=MENGE FROM INSERTED;

		SELECT @LAGERBESTAND=ISNULL(LAGERBESTAND, 0) FROM GESAMTSORTIMENT WHERE PRODUKTNR=@PRODUKTNR AND GROESSENNR=@GROESSENNR AND FARBNR=@FARBNR;

		PRINT @LAGERBESTAND;

		IF(@LAGERBESTAND<0)
		BEGIN
			PRINT 'Das Produkt wird nicht verkauft werden';
			PRINT 'Es geben nicht genug Waren in Lager';
			PRINT @PRODUKTNR;
			PRINT @GROESSENNR;
			PRINT @FARBNR;
			PRINT @MENGE;
			PRINT @LAGERBESTAND;
			ROLLBACK TRANSACTION;
		END
	END
END
/***************************************************************************/

SELECT * --SUM(LAGERBESTAND)
FROM GESAMTSORTIMENT
WHERE PRODUKTNR=1 AND GROESSENNR=1 AND FARBNR=1;

BEGIN TRANSACTION
INSERT INTO PRODUKTVERKAUF
VALUES(
1000,
2,
1,
5,
0,
8, --menge
1, --produkt nr
1,
1,  --groesse
1  --farbe
);

ROLLBACK;


---------------------------------------------------------------------------------------
/*
2. Nach dem Verkauf Meldung anzeigen, wenn weniger als 5 Artikel vorhanden sind und 
   einen Bestellhinweis anzeigen, wenn der Bestand geringer als 2 ist
*/
---------------------------------------------------------------------------------------

/***************************************************************************/
CREATE TRIGGER VERKAUF_LAGERBESTAND
ON PRODUKTVERKAUF
AFTER INSERT
AS
BEGIN
	DECLARE @PRODUKTNR int;
	DECLARE @GROESSENNR int;
	DECLARE @FARBNR int;
	DECLARE @MENGE tinyint;
	DECLARE @NEUEMENGE tinyint;
	DECLARE @LAGERBESTAND int;

	IF EXISTS(SELECT * from INSERTED)
	BEGIN
		SELECT @PRODUKTNR=PRODUKTNR, @GROESSENNR=GROESSENNR, @FARBNR=FARBNR, @MENGE=MENGE FROM INSERTED;

		SELECT @LAGERBESTAND=ISNULL(LAGERBESTAND, 0) FROM GESAMTSORTIMENT WHERE PRODUKTNR=@PRODUKTNR AND GROESSENNR=@GROESSENNR AND FARBNR=@FARBNR;

		IF(@LAGERBESTAND<5)
		BEGIN
			PRINT 'Weniger als 5 Artikel';
		END

		IF(@LAGERBESTAND<=2)
		BEGIN
			DECLARE @PRODUKTDETAIL VARCHAR(255) = (SELECT PRODUKTDETAIL FROM PRODUKTE WHERE PRODUKTID=@PRODUKTNR);
			DECLARE @GROESSENAME VARCHAR(20) = (SELECT NAME FROM GROESSEN WHERE GROESSENID=@GROESSENNR);
			DECLARE @FARBENAME VARCHAR(20) = (SELECT NAME FROM FARBEN WHERE FARBID=@FARBNR);

			PRINT 'Weniger als 2 Artikel';
			PRINT 'Bestellhinweis';
			PRINT @PRODUKTDETAIL;
			PRINT @GROESSENAME;
			PRINT @FARBENAME;
			PRINT 'NUR ' + CAST(@LAGERBESTAND AS VARCHAR);
		END

	END
END
/***************************************************************************/

---------------------------------------------------------------------------------------
/*
3. Erzeugen Sie eine Ereignis-Hinweistabelle für Produktverkauf
*/
---------------------------------------------------------------------------------------

SELECT *
FROM EREIGNISSE;

DELETE EREIGNISSE;

SELECT * --SUM(LAGERBESTAND)
FROM GESAMTSORTIMENT
WHERE PRODUKTNR=1 AND GROESSENNR=1 AND FARBNR=1;

BEGIN TRANSACTION
INSERT INTO PRODUKTVERKAUF
VALUES(
1000,
2,
1,
5,
0,
12, --menge
1, --produkt nr
1,
1,  --groesse
1  --farbe
);

ROLLBACK;


/***************************************************************************/
ALTER TRIGGER VERKAUF_VERHINDERN
ON PRODUKTVERKAUF
FOR INSERT
AS
BEGIN
	DECLARE @PRODUKTNR int;
	DECLARE @GROESSENNR int;
	DECLARE @FARBNR int;
	DECLARE @MENGE tinyint;
	DECLARE @NEUEMENGE tinyint;
	DECLARE @LAGERBESTAND int;

	IF EXISTS(SELECT * from INSERTED)
	BEGIN
		SELECT @PRODUKTNR=PRODUKTNR, @GROESSENNR=GROESSENNR, @FARBNR=FARBNR, @MENGE=MENGE FROM INSERTED;

		SELECT @LAGERBESTAND=ISNULL(LAGERBESTAND, 0) FROM GESAMTSORTIMENT WHERE PRODUKTNR=@PRODUKTNR AND GROESSENNR=@GROESSENNR AND FARBNR=@FARBNR;

		IF(@LAGERBESTAND<0)
		BEGIN
			ROLLBACK TRANSACTION;

			BEGIN TRANSACTION;
				INSERT INTO EREIGNISSE
				VALUES(GETDATE(), 'Das Produkt wird nicht verkauft werden; Es geben nicht genug Waren in Lager', 
						'PRODUKT NR: '+CAST(@PRODUKTNR AS VARCHAR) +
						'; GROESSE NR: '+CAST(@GROESSENNR AS VARCHAR) +
						'; FARB NR: '+CAST(@FARBNR AS VARCHAR) +
						'; MENGE: '+CAST(@MENGE AS VARCHAR) +
						'; LAGERBESTAND: '+CAST((@LAGERBESTAND+@MENGE) AS VARCHAR) );
			COMMIT TRANSACTION;
		END
	END
END
/***************************************************************************/
ALTER TRIGGER VERKAUF_LAGERBESTAND
ON PRODUKTVERKAUF
AFTER INSERT
AS
BEGIN
	DECLARE @PRODUKTNR int;
	DECLARE @GROESSENNR int;
	DECLARE @FARBNR int;
	DECLARE @MENGE tinyint;
	DECLARE @NEUEMENGE tinyint;
	DECLARE @LAGERBESTAND int;

	IF EXISTS(SELECT * from INSERTED)
	BEGIN
		SELECT @PRODUKTNR=PRODUKTNR, @GROESSENNR=GROESSENNR, @FARBNR=FARBNR, @MENGE=MENGE FROM INSERTED;

		SELECT @LAGERBESTAND=ISNULL(LAGERBESTAND, 0) FROM GESAMTSORTIMENT WHERE PRODUKTNR=@PRODUKTNR AND GROESSENNR=@GROESSENNR AND FARBNR=@FARBNR;

		IF(@LAGERBESTAND<=2)
		BEGIN
			DECLARE @PRODUKTDETAIL VARCHAR(255) = (SELECT PRODUKTDETAIL FROM PRODUKTE WHERE PRODUKTID=@PRODUKTNR);
			DECLARE @GROESSENAME VARCHAR(20) = (SELECT NAME FROM GROESSEN WHERE GROESSENID=@GROESSENNR);
			DECLARE @FARBENAME VARCHAR(20) = (SELECT NAME FROM FARBEN WHERE FARBID=@FARBNR);

			BEGIN TRANSACTION;
				INSERT INTO EREIGNISSE
				VALUES(GETDATE(), 'Weniger als 2 Artikel; Bestellhinweis', 
						'PRODUKT NR: '+CAST(@PRODUKTNR AS VARCHAR) + ' ' + @PRODUKTDETAIL +
						'; GROESSE NR: '+CAST(@GROESSENNR AS VARCHAR) + ' ' +  @GROESSENAME +
						'; FARB NR: '+CAST(@FARBNR AS VARCHAR) + ' ' + @FARBENAME +
						'; MENGE: '+CAST(@MENGE AS VARCHAR) +
						'; LAGERBESTAND NUR: '+CAST((@LAGERBESTAND+@MENGE) AS VARCHAR) );
			COMMIT TRANSACTION;

		END
		ELSE IF(@LAGERBESTAND<5)
		BEGIN
			BEGIN TRANSACTION;
				INSERT INTO EREIGNISSE
				VALUES(GETDATE(), 'Weniger als 5 Artikel', 
						'PRODUKT NR: '+CAST(@PRODUKTNR AS VARCHAR) + ' ' + @PRODUKTDETAIL +
						'; GROESSE NR: '+CAST(@GROESSENNR AS VARCHAR) + ' ' +  @GROESSENAME +
						'; FARB NR: '+CAST(@FARBNR AS VARCHAR) + ' ' + @FARBENAME +
						'; MENGE: '+CAST(@MENGE AS VARCHAR) +
						'; LAGERBESTAND NUR: '+CAST((@LAGERBESTAND+@MENGE) AS VARCHAR) );
			COMMIT TRANSACTION;
		END

	END
END
/***************************************************************************/


---------------------------------------------------------------------------------------
/*
4. Produkte (die vorhanden sind) dürfen nicht mehr bearbeitet werden
*/
---------------------------------------------------------------------------------------




---------------------------------------------------------------------------------------
/*
5. Produkteinkauf bei max. Menge 100 (Bestand) verbieten
*/
---------------------------------------------------------------------------------------

CREATE TRIGGER EINKAUF_VERHINDERN
ON PRODUKTEINKAUF
FOR INSERT
AS
BEGIN
	DECLARE @PRODUKTNR int;
	DECLARE @GROESSENNR int;
	DECLARE @FARBNR int;
	DECLARE @MENGE tinyint;
	DECLARE @NEUEMENGE tinyint;
	DECLARE @LAGERBESTAND int;

	IF EXISTS(SELECT * from INSERTED)
	BEGIN
		SELECT @PRODUKTNR=PRODUKTNR, @GROESSENNR=GROESSENNR, @FARBNR=FARBNR, @MENGE=MENGE FROM INSERTED;

		SELECT @LAGERBESTAND=ISNULL(LAGERBESTAND, 0) FROM GESAMTSORTIMENT WHERE PRODUKTNR=@PRODUKTNR AND GROESSENNR=@GROESSENNR AND FARBNR=@FARBNR;

		IF(@LAGERBESTAND>100)
		BEGIN
			ROLLBACK TRANSACTION;

			BEGIN TRANSACTION;
				INSERT INTO EREIGNISSE
				VALUES(GETDATE(), 'Das Produkt wird nicht eingekauft werden; Es geben genug Waren in Lager', 
						'PRODUKT NR: '+CAST(@PRODUKTNR AS VARCHAR) +
						'; GROESSE NR: '+CAST(@GROESSENNR AS VARCHAR) +
						'; FARB NR: '+CAST(@FARBNR AS VARCHAR) +
						'; MENGE: '+CAST(@MENGE AS VARCHAR) +
						'; LAGERBESTAND: '+CAST((@LAGERBESTAND+@MENGE) AS VARCHAR) );
			COMMIT TRANSACTION;
		END
	END
END

---------------------------------------------------------------------------------------





