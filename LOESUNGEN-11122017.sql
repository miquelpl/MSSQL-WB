/*
Lesen Sie im Buch

Kapitel 7:
Seite 125 bis 130	Komplexe SQL Selects, Fallunterscheidungen

Kapitel 9:
Seite 165 bis 173	SQL-Skripte, Variablen, Fallunterscheidungen, Temporäre Tabellen

Kapitel 10: 
Seite 209 - 210		Cursor

1.) Schreiben Sie ein Script welches eine Farbe hinzufügt, falls nicht vorhanden.
Ist die Farbe schon vorhanden soll die Liste aller Farben angezeigt werden.

2.) Schreiben Sie ein Script welches eine Marke hinzufügt, falls nicht vorhanden.
Ist die Marke schon vorhanden soll die Liste aller Marken angezeigt werden.

3.) Schreiben Sie ein Script welches eine Kategorie hinzufügt, falls nicht vorhanden.
Ist die Kategorie schon vorhanden soll die Liste aller Kategorien angezeigt werden.

4.) Schreiben Sie ein Script, welches verwendet werden kann, um ein neues Produkt 
hinzuzufügen und es anschließend verkaufen zu könnnen.

Das Produkt soll in Variablen eingetragen werden. Anschließend soll ein Script 
alles weitere automatisch durchführen.
Das Eintragen in Variablen soll den Vorgang vereinfachen.
Primär und Fremdschlüssel soll das Script automatisch verarbeiten. 
(Feststellen, was die nächste ID ist / Weiterverwendung der ID)
*/

/*
1.) Schreiben Sie ein Script welches eine Farbe hinzufügt, falls nicht vorhanden.
Ist die Farbe schon vorhanden soll die Liste aller Farben angezeigt werden.
*/

SELECT *
FROM FARBEN;

DELETE FARBEN
WHERE FARBID='15';

--------------------------------------------------------------------------------------------------------
DECLARE @NeuFarbe VARCHAR(20) = 'Oliv';
DECLARE @SchonExists int;

SELECT @SchonExists=COUNT(*) FROM FARBEN WHERE NAME=@NeuFarbe;

IF @SchonExists>0
	BEGIN
		DECLARE Farben_Cursor CURSOR FOR SELECT * FROM FARBEN;
		DECLARE @FarbID int, @Name VARCHAR(20);

		OPEN Farben_Cursor;

		FETCH NEXT FROM Farben_Cursor INTO @FarbID, @Name;

		WHILE(@@FETCH_STATUS = 0)
			BEGIN
				PRINT cast(@FarbID as varchar) + ': ' + @Name;
				FETCH NEXT FROM Farben_Cursor INTO @FarbID, @Name;
			END

		CLOSE Farben_Cursor;
		DEALLOCATE Farben_Cursor;
	END
ELSE
	BEGIN
		DECLARE @Nexte_Farbe_ID int = (SELECT MAX(FARBID)+1 FROM FARBEN);

		BEGIN TRANSACTION;
			INSERT INTO FARBEN
			VALUES(@Nexte_Farbe_ID, @NeuFarbe);

			IF((SELECT COUNT(*) FROM FARBEN WHERE FARBID=@Nexte_Farbe_ID AND NAME=@NeuFarbe)=1)
				COMMIT TRANSACTION;
			ELSE
				ROLLBACK TRANSACTION;

	END
--------------------------------------------------------------------------------------------------------

/*
2.) Schreiben Sie ein Script welches eine Marke hinzufügt, falls nicht vorhanden.
Ist die Marke schon vorhanden soll die Liste aller Marken angezeigt werden.
*/

SELECT *
FROM MARKEN
ORDER BY 1 DESC;

--------------------------------------------------------------------------------------------------------
DECLARE @Neue_Marke VARCHAR(20) = 'Reebok';
DECLARE @SchonExists int;

SELECT @SchonExists=COUNT(*) FROM MARKEN WHERE NAME=@Neue_Marke;

IF @SchonExists>0
	BEGIN
		PRINT 'SCHON EXISTS';
		DECLARE Marken_Cursor CURSOR FOR SELECT * FROM MARKEN;
		DECLARE @MarkeID int, @Name VARCHAR(20);

		DECLARE @zaehler int = 1;
		DECLARE @maximal int = (select count(*) from MARKEN);

		OPEN Marken_Cursor;

		WHILE(@zaehler <= @maximal)
		BEGIN
			FETCH NEXT FROM Marken_Cursor INTO @MarkeID, @Name;
			PRINT cast(@MarkeID as varchar) + ': ' + @Name;
			set @zaehler += 1;
		END

		CLOSE Marken_Cursor;
		DEALLOCATE Marken_Cursor;
	END
ELSE
	BEGIN
		PRINT 'NEUE ZEILE';
		DECLARE @Nexte_Marke_ID int = (SELECT MAX(MARKENID)+1 FROM MARKEN);

		BEGIN TRANSACTION;
			INSERT INTO MARKEN
			VALUES(@Nexte_Marke_ID, @Neue_Marke);

			IF((SELECT COUNT(*) FROM MARKEN WHERE MARKENID=@Nexte_Marke_ID AND NAME=@Neue_Marke)=1)
				COMMIT TRANSACTION;
			ELSE
				ROLLBACK TRANSACTION;

	END
--------------------------------------------------------------------------------------------------------

/*
3.) Schreiben Sie ein Script welches eine Kategorie hinzufügt, falls nicht vorhanden.
Ist die Kategorie schon vorhanden soll die Liste aller Kategorien angezeigt werden.
*/

SELECT *
FROM KATEGORIEN;

--------------------------------------------------------------------------------------------------------
DECLARE @Neue_Kategorie VARCHAR(20) = 'Mütze';
DECLARE @SchonExists int;

SELECT @SchonExists=COUNT(*) FROM KATEGORIEN WHERE NAME=@Neue_Kategorie;

IF @SchonExists>0
	BEGIN
		PRINT 'SCHON EXISTS';
		DECLARE Kategorien_Cursor CURSOR FOR SELECT * FROM KATEGORIEN;
		DECLARE @KategorieID int, @Name VARCHAR(20);

		DECLARE @zaehler int = 1;
		DECLARE @maximal int = (select count(*) from KATEGORIEN);

		OPEN Kategorien_Cursor;

		WHILE(@zaehler <= @maximal)
		BEGIN
			FETCH NEXT FROM Kategorien_Cursor INTO @KategorieID, @Name;
			PRINT cast(@KategorieID as varchar) + ': ' + @Name;
			set @zaehler += 1;
		END

		CLOSE Kategorien_Cursor;
		DEALLOCATE Kategorien_Cursor;
	END
ELSE
	BEGIN
		PRINT 'NEUE ZEILE';
		DECLARE @Nexte_Kategorie_ID int = (SELECT MAX(KATEGORIEID)+1 FROM KATEGORIEN);

		BEGIN TRANSACTION;
			INSERT INTO KATEGORIEN
			VALUES(@Nexte_Kategorie_ID, @Neue_Kategorie);

			IF((SELECT COUNT(*) FROM KATEGORIEN WHERE KATEGORIEID=@Nexte_Kategorie_ID AND NAME=@Neue_Kategorie)=1)
				COMMIT TRANSACTION;
			ELSE
				ROLLBACK TRANSACTION;

	END
--------------------------------------------------------------------------------------------------------

/*
4.) Schreiben Sie ein Script, welches verwendet werden kann, um ein neues Produkt 
hinzuzufügen und es anschließend verkaufen zu könnnen.

Das Produkt soll in Variablen eingetragen werden. Anschließend soll ein Script 
alles weitere automatisch durchführen.
Das Eintragen in Variablen soll den Vorgang vereinfachen.
Primär und Fremdschlüssel soll das Script automatisch verarbeiten. 
(Feststellen, was die nächste ID ist / Weiterverwendung der ID)
*/

--------------------------------------------------------------------------------------------------------
USE TESTDATENBANK;
DECLARE @Neu_Produktdetail VARCHAR(255) = 'Jack Wolfskin Mütze: 100% Nylon';
DECLARE @Param_Marken_Name VARCHAR(20) = 'Jack Wolfskin';
DECLARE @Param_Zielgruppen_Name VARCHAR(20) = 'Unisex Erw.';
DECLARE @Param_Kategorien_Name VARCHAR(20) = 'Mütze';
DECLARE @Param_Farbe_Name VARCHAR(20) = 'gelb';
DECLARE @Param_Groesse_Name VARCHAR(20) = 'ONE SIZE';

DECLARE @Param_Lieferante int = 11;
DECLARE @Param_Mitarbeiter int = 2;
DECLARE @Param_Datum DATE = GETDATE()-20;
DECLARE @Param_MENGE smallint = 20;
DECLARE @Param_EINKAUFPREIS DECIMAL(6, 2) = 2.50;
DECLARE @Param_VERKAUFPREIS DECIMAL(6, 2) = 10.0;
DECLARE @Param_Breite tinyint = NULL;
DECLARE @Param_Laenge tinyint = NULL;

DECLARE @Neu_ProduktID int = ISNULL((SELECT DISTINCT PRODUKTID FROM PRODUKTE WHERE PRODUKTDETAIL=@Neu_Produktdetail), 0);
DECLARE @Neu_MarkenNr int = ISNULL((SELECT DISTINCT MARKEN.MarkenID FROM MARKEN WHERE Name=@Param_Marken_Name), 0);
DECLARE @Neu_ZielgruppenNr int = ISNULL((SELECT DISTINCT ZielgruppenID FROM ZIELGRUPPEN WHERE Name=@Param_Zielgruppen_Name), 0);
DECLARE @Neu_KategorienNr int = ISNULL((SELECT DISTINCT KategorieID FROM KATEGORIEN WHERE Name=@Param_KATEGORIEN_Name), 0);
DECLARE @Neu_FarbeNr int = ISNULL((SELECT DISTINCT FARBID FROM FARBEN WHERE Name=@Param_FARBE_Name), 0);
DECLARE @Neu_GroesseNr int = ISNULL((SELECT DISTINCT GROESSENID FROM GROESSEN WHERE Name=@Param_GROESSE_Name), 0);
DECLARE @Neu_EinkaufID int;

PRINT @Neu_MarkenNr;
PRINT @Neu_ZielgruppenNr;
PRINT @Neu_KategorienNr;
PRINT @Neu_FarbeNr;
PRINT @Neu_GroesseNr;
PRINT @Param_Lieferante;
PRINT @Param_Mitarbeiter;
PRINT @Param_Datum;
PRINT @Param_MENGE;
PRINT @Param_EINKAUFPREIS;

--MARKEN--------------------------------------------------------------------------
IF(@Neu_MarkenNr=0)
BEGIN
	SET @Neu_MarkenNr = (SELECT MAX(MARKENID) FROM MARKEN)+1;
	PRINT @Neu_MarkenNr;
	INSERT INTO MARKEN
	VALUES(@Neu_MarkenNr, @Param_Marken_Name);
END
--KATEGORIEN--------------------------------------------------------------------------***************************************AQUI
IF(@Neu_KategorienNr=0)
BEGIN
	SET @Neu_KategorienNr = (SELECT MAX(KATEGORIEID) FROM KATEGORIEN)+1;
	PRINT @Neu_KategorienNr;
	INSERT INTO KATEGORIEN
	VALUES(@Neu_KategorienNr, @Param_Kategorien_Name);
END
--FARBEN--------------------------------------------------------------------------
IF(@Neu_FarbeNr=0)
BEGIN
	SET @Neu_FarbeNr = (SELECT MAX(FARBID) FROM FARBEN)+1;
	PRINT @Neu_FarbeNr;
	INSERT INTO FARBEN
	VALUES(@Neu_FarbeNr, @Param_Farbe_Name);
END
--GROESSEN--------------------------------------------------------------------------
IF(@Neu_GroesseNr=0)
BEGIN
	SET @Neu_GroesseNr = (SELECT MAX(GROESSENID) FROM GROESSEN)+1;
	PRINT @Neu_GroesseNr;
	INSERT INTO GROESSEN
	VALUES(@Neu_GroesseNr, @Param_Groesse_Name);
END
--PRODUKTE--------------------------------------------------------------------------
BEGIN TRANSACTION;
BEGIN TRY  

	IF(@Neu_ProduktID=0)
	BEGIN
		SET @Neu_ProduktID = (SELECT MAX(PRODUKTID) FROM PRODUKTE)+1;

		insert into produkte(produktid, markennr, zielgruppennr, kategorienr, produktdetail) 
		values (@Neu_ProduktID, @Neu_MarkenNr, @Neu_ZielgruppenNr, @Neu_KategorienNr, @Neu_Produktdetail);
	END;

--PRODUKTVARIANTEN--------------------------------------------------------------------------
	INSERT INTO PRODUKTVARIANTEN
	VALUES(@Neu_ProduktID, @Neu_GroesseNr, @Param_VERKAUFPREIS, @Param_Laenge, @Param_Breite);

--PRODUKTEINKAUF--------------------------------------------------------------------------
	SET @Neu_EinkaufID = (SELECT MAX(EinkaufID) FROM PRODUKTEINKAUF)+1;

	INSERT INTO PRODUKTEINKAUF
	VALUES(@Neu_EinkaufID, @Param_EINKAUFPREIS, @Param_MENGE, @Neu_ProduktID, @Param_Mitarbeiter, @Param_Lieferante, @Param_Datum, @Neu_GroesseNr, @Neu_FarbeNr);

--FARBZUSAMMENSETZUNG--------------------------------------------------------------------------

	INSERT INTO FARBZUSAMMENSETZUNG
	VALUES(@Neu_ProduktID, @Neu_FarbeNr);

END TRY  

BEGIN CATCH  
	DECLARE @LOCAL_ERROR int = 0;
	DECLARE @LOCAL_MESSAGE VARCHAR(512) = '';
	SELECT @LOCAL_ERROR=ERROR_NUMBER(), @LOCAL_MESSAGE=ERROR_MESSAGE();

	IF(@LOCAL_ERROR=0)
		BEGIN
			COMMIT TRANSACTION;
			PRINT 'ALLES IN ORDNUNG';
		END
	ELSE
		BEGIN
			ROLLBACK TRANSACTION;
			PRINT 'HORROR ERROR: '+ CAST(@LOCAL_ERROR AS VARCHAR) + ': ' + @LOCAL_MESSAGE;
		END
END CATCH  

---------------------------------------------------------------------------

SELECT *
FROM [dbo].[GESAMTSORTIMENT]
ORDER BY 1 DESC;

---------------------------------------------------------------------------

BEGIN TRY  
    -- Table does not exist; object name resolution  
    -- error not caught.  
    SELECT 1/0;  
END TRY  
BEGIN CATCH  
    SELECT           ERROR_NUMBER() AS ErrorNumber         ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH  

SELECT           ERROR_NUMBER();
--------------------------------------------------------------------------------------------------------
SELECT 1/0;  
SELECT           ERROR_NUMBER() AS ErrorNumber         ,ERROR_MESSAGE() AS ErrorMessage;  

PRINT @@TRANCOUNT;

COMMIT;