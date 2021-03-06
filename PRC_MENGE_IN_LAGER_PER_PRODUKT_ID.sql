USE [testdatenbank]
GO
/****** Object:  StoredProcedure [dbo].[MENGE_IN_LAGER_PER_PRODUKT_ID]    Script Date: 13.12.2017 09:12:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[MENGE_IN_LAGER_PER_PRODUKT_ID]
@PARAM_PRODUKT_ID int
AS
BEGIN
DECLARE @ProduktNR int = 0;
DECLARE @GroessenNR int = 0;
DECLARE @FarbeNR int = 0;
DECLARE @MENGE int = 0
DECLARE @PRODUKTDETAIL VARCHAR(255) = (SELECT PRODUKTDETAIL FROM PRODUKTE WHERE PRODUKTID=@PARAM_PRODUKT_ID);

DECLARE Produkt_Cursor CURSOR FOR 
	SELECT pe.ProduktNR, pe.GroessenNr, ISNULL(SUM(pe.MENGE), 0)-ISNULL(SUM(pv.MENGE), 0)
	FROM PRODUKTEINKAUF pe
	LEFT OUTER JOIN PRODUKTVERKAUF pv ON pv.ProduktNr=pe.ProduktNr AND pv.GroessenNr=pe.GroessenNr AND pv.ProduktNr IS NOT NULL
	WHERE pe.ProduktNr=@PARAM_PRODUKT_ID
	GROUP BY pe.ProduktNR, pe.GroessenNr;

	PRINT @PRODUKTDETAIL;

	OPEN Produkt_Cursor;

	FETCH NEXT FROM Produkt_Cursor INTO @ProduktNR, @GroessenNR, @MENGE;

	WHILE(@@FETCH_STATUS = 0)
		BEGIN
			DECLARE @GROESSE_NAME VARCHAR(20) = (SELECT NAME FROM GROESSEN WHERE GROESSENID=@GroessenNR);
--			PRINT @GROESSE_NAME + ': ' + cast(@MENGE as varchar);
			PRINT @GROESSE_NAME + ': ' + cast(@MENGE as varchar);
			FETCH NEXT FROM Produkt_Cursor INTO @ProduktNR, @GroessenNR, @MENGE;
		END

	CLOSE Produkt_Cursor;
	DEALLOCATE Produkt_Cursor;

--FARBEN--------------------------------------------------------------------------------------------
DECLARE Produkt_Cursor_FARBE CURSOR FOR 
	SELECT pe.ProduktNR, pe.FarbNR, ISNULL(SUM(pe.MENGE), 0)-ISNULL(SUM(pv.MENGE), 0) AS MENGE
	FROM PRODUKTEINKAUF pe
	LEFT OUTER JOIN PRODUKTVERKAUF pv ON pv.ProduktNr=pe.ProduktNr AND pv.FarbNR=pe.FarbNR AND pv.ProduktNr IS NOT NULL
	WHERE pe.ProduktNr=@PARAM_PRODUKT_ID
	GROUP BY pe.ProduktNR, pe.FarbNR;

	OPEN Produkt_Cursor_FARBE;

	FETCH NEXT FROM Produkt_Cursor_FARBE INTO @ProduktNR, @FarbeNR, @MENGE;

	WHILE(@@FETCH_STATUS = 0)
		BEGIN
			DECLARE @FARBE_NAME VARCHAR(20) = (SELECT NAME FROM FARBEN WHERE FARBID=@FarbeNR);
			PRINT @FARBE_NAME + ': ' + cast(@MENGE as varchar);
			FETCH NEXT FROM Produkt_Cursor_FARBE INTO @ProduktNR, @FarbeNR, @MENGE;
		END

	CLOSE Produkt_Cursor_FARBE;
	DEALLOCATE Produkt_Cursor_FARBE;

END




