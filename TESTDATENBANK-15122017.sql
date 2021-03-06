USE [master]
GO
/****** Object:  Database [testdatenbank]    Script Date: 15.12.2017 15:35:47 ******/
CREATE DATABASE [testdatenbank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'testdatenbank', FILENAME = N'D:\datenbanken\testdatenbank.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'testdatenbank_log', FILENAME = N'D:\datenbanken\testdatenbank_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [testdatenbank] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [testdatenbank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [testdatenbank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [testdatenbank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [testdatenbank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [testdatenbank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [testdatenbank] SET ARITHABORT OFF 
GO
ALTER DATABASE [testdatenbank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [testdatenbank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [testdatenbank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [testdatenbank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [testdatenbank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [testdatenbank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [testdatenbank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [testdatenbank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [testdatenbank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [testdatenbank] SET  DISABLE_BROKER 
GO
ALTER DATABASE [testdatenbank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [testdatenbank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [testdatenbank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [testdatenbank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [testdatenbank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [testdatenbank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [testdatenbank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [testdatenbank] SET RECOVERY FULL 
GO
ALTER DATABASE [testdatenbank] SET  MULTI_USER 
GO
ALTER DATABASE [testdatenbank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [testdatenbank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [testdatenbank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [testdatenbank] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [testdatenbank] SET DELAYED_DURABILITY = DISABLED 
GO
USE [testdatenbank]
GO
/****** Object:  User [fritzchen]    Script Date: 15.12.2017 15:35:47 ******/
CREATE USER [fritzchen] FOR LOGIN [fridolin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [fritzchen]
GO
/****** Object:  UserDefinedFunction [dbo].[FNC_ANZAHL_VERKAUFTE_PRODUKT]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FNC_ANZAHL_VERKAUFTE_PRODUKT](@PRODUKT AS int)
RETURNS int
AS
BEGIN
	DECLARE @WERT int;
	SET @WERT = (SELECT SUM(pv.Menge) MENGE FROM PRODUKTVERKAUF pv WHERE PRODUKTNR IS NOT NULL AND pv.ProduktNr=@PRODUKT);
	RETURN(@WERT);
END

GO
/****** Object:  UserDefinedFunction [dbo].[FNC_DURCHNITTWERT_FINDEN]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FNC_DURCHNITTWERT_FINDEN](@PRODUKT AS int)
RETURNS int
AS
BEGIN
	DECLARE @WERT int;
--	SET @WERT = (SELECT AVG(pv.Laenge) FROM PRODUKTVARIANTEN pv WHERE pv.ProduktNr=@PRODUKT);
	SET @WERT = (SELECT AVG(pv.Laenge) FROM PRODUKTVARIANTEN pv);
	RETURN(@WERT);
END
GO
/****** Object:  UserDefinedFunction [dbo].[FNC_FARBE_FINDEN]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FNC_FARBE_FINDEN](@FARBE AS VARCHAR(20))
RETURNS int
AS
BEGIN
	DECLARE @FARBENR int;
	SET @FARBENR = (SELECT DISTINCT TOP 1 FARBID FROM FARBEN WHERE FARBEN.Name LIKE '%'+@FARBE+'%');
	RETURN(@FARBENR);
END

GO
/****** Object:  UserDefinedFunction [dbo].[FNC_GROESSE_FINDEN]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FNC_GROESSE_FINDEN](@GROESSE AS VARCHAR(20))
RETURNS int
AS
BEGIN
	DECLARE @GROESSENR int;
	SET @GROESSENR = (SELECT DISTINCT TOP 1 GROESSENID FROM GROESSEN WHERE Name LIKE '%'+@GROESSE+'%');
	RETURN(@GROESSENR);
END

GO
/****** Object:  UserDefinedFunction [dbo].[FNC_LANG_BREIT_DURCHNITTWERT_FINDEN]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FNC_LANG_BREIT_DURCHNITTWERT_FINDEN](@GROESSE AS int)
RETURNS int
AS
BEGIN
	DECLARE @WERT int;
	SET @WERT = (SELECT AVG(pv.Laenge+pv.Breite) FROM PRODUKTVARIANTEN pv WHERE pv.GroessenNr=@GROESSE);

	RETURN(@WERT);
END

GO
/****** Object:  UserDefinedFunction [dbo].[MEINE_FUNKTION]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[MEINE_FUNKTION](@PARAM1 int)
RETURNS VARCHAR(20)
AS
BEGIN

RETURN CAST(@PARAM1*@PARAM1 AS VARCHAR);

END

GO
/****** Object:  Table [dbo].[EREIGNISSE]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EREIGNISSE](
	[DATUM] [datetime] NOT NULL,
	[EREIGNIS] [varchar](512) NOT NULL,
	[INFO] [varchar](512) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Farben]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Farben](
	[FarbID] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Farben] PRIMARY KEY CLUSTERED 
(
	[FarbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Farbzusammensetzung]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Farbzusammensetzung](
	[ProduktNr] [int] NOT NULL,
	[FarbNr] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Groessen]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Groessen](
	[GroessenID] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Groessen] PRIMARY KEY CLUSTERED 
(
	[GroessenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kategorien]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kategorien](
	[KategorieID] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Kategorien] PRIMARY KEY CLUSTERED 
(
	[KategorieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lieferanten]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lieferanten](
	[LieferantenID] [int] NOT NULL,
	[Adresse] [varchar](80) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Ansprechpartner] [varchar](50) NULL,
 CONSTRAINT [PK_Lieferanten] PRIMARY KEY CLUSTERED 
(
	[LieferantenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Marken]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Marken](
	[MarkenID] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Marken] PRIMARY KEY CLUSTERED 
(
	[MarkenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mitarbeiter]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mitarbeiter](
	[MitarbeiterID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Vorname] [varchar](50) NOT NULL,
	[Gehalt] [decimal](8, 2) NULL,
	[Position] [varchar](50) NOT NULL,
	[Job] [varchar](50) NULL,
	[VorgesetztenNR] [int] NULL,
 CONSTRAINT [PK_Mitarbeiter] PRIMARY KEY CLUSTERED 
(
	[MitarbeiterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Produkte]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Produkte](
	[ProduktID] [int] NOT NULL,
	[MarkenNr] [int] NOT NULL,
	[ZielgruppenNr] [int] NOT NULL,
	[KategorieNr] [int] NOT NULL,
	[Produktdetail] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Produkte] PRIMARY KEY CLUSTERED 
(
	[ProduktID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Produkteinkauf]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produkteinkauf](
	[EinkaufID] [int] NOT NULL,
	[Einkaufspreis] [decimal](6, 2) NOT NULL,
	[Menge] [smallint] NOT NULL,
	[ProduktNr] [int] NOT NULL,
	[MitarbeiterNr] [int] NOT NULL,
	[LieferantNr] [int] NOT NULL,
	[Datum] [date] NOT NULL,
	[GroessenNr] [int] NOT NULL,
	[FarbNr] [int] NOT NULL,
 CONSTRAINT [PK_Produkteinkauf] PRIMARY KEY CLUSTERED 
(
	[EinkaufID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Produktvarianten]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produktvarianten](
	[ProduktNr] [int] NOT NULL,
	[GroessenNr] [int] NOT NULL,
	[Verkaufspreis] [decimal](6, 2) NOT NULL,
	[Laenge] [tinyint] NULL,
	[Breite] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Produktverkauf]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produktverkauf](
	[VerkaufID] [int] NOT NULL,
	[Rechnungsposition] [tinyint] NOT NULL,
	[RechnungsNr] [int] NOT NULL,
	[Betrag] [decimal](6, 2) NOT NULL,
	[Rabatt] [tinyint] NULL,
	[Menge] [tinyint] NOT NULL,
	[ProduktNr] [int] NULL,
	[MitarbeiterNr] [int] NOT NULL,
	[GroessenNr] [int] NOT NULL,
	[FarbNr] [int] NOT NULL,
 CONSTRAINT [PK_Produktverkauf] PRIMARY KEY CLUSTERED 
(
	[VerkaufID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rechnungen]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rechnungen](
	[RechnungsID] [int] NOT NULL,
	[Datum] [date] NOT NULL,
 CONSTRAINT [PK_Rechnungen] PRIMARY KEY CLUSTERED 
(
	[RechnungsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[top10]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[top10](
	[Produktdetail] [varchar](255) NOT NULL,
	[marke] [varchar](20) NOT NULL,
	[zielgruppe] [varchar](30) NOT NULL,
	[kategorie] [varchar](20) NOT NULL,
	[verkaufspreis] [decimal](6, 2) NOT NULL,
	[groesse] [varchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Zielgruppen]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Zielgruppen](
	[ZielgruppenID] [int] NOT NULL,
	[Name] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Zielgruppen] PRIMARY KEY CLUSTERED 
(
	[ZielgruppenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[MONATSKOSTEN]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MONATSKOSTEN] AS
SELECT FORMAT(pe.Datum, 'MM.yyyy') MONAT, SUM(pe.Menge*pe.Einkaufspreis) AS Warenkosten, (SELECT SUM(GEHALT/12) FROM MITARBEITER) AS Personalkosten
FROM PRODUKTEINKAUF pe
GROUP BY FORMAT(pe.DATUM, 'MM.yyyy');

GO
/****** Object:  View [dbo].[MONATSUMSATZ]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MONATSUMSATZ] AS
SELECT FORMAT(re.DATUM, 'MM.yyyy') MONAT, SUM((BETRAG-ISNULL(RABATT, 0))*MENGE) AS Monatsumsatz
FROM PRODUKTVERKAUF pv
INNER JOIN RECHNUNGEN re ON re.RechnungsID=pv.RechnungsNr
WHERE pv.PRODUKTNR IS NOT NULL
GROUP BY FORMAT(re.DATUM, 'MM.yyyy');

GO
/****** Object:  View [dbo].[MONATSBILANZ]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MONATSBILANZ] AS
SELECT mu.MONAT MONAT, 
FORMAT(ISNULL(Monatsumsatz, 0), '#,##0.00 €') Monatsumsatz, 
FORMAT(ISNULL(Warenkosten, 0), '#,##0.00 €') Warenkosten, 
FORMAT(ISNULL(Personalkosten, 0), '#,##0.00 €') Personalkosten, 
FORMAT(ISNULL(Monatsumsatz, 0)-ISNULL(Warenkosten, 0)-ISNULL(Personalkosten, 0), '#,##0.00 €') AS Monatsbilanz
FROM MONATSUMSATZ mu
LEFT JOIN MONATSKOSTEN mk ON mk.MONAT=mu.MONAT;

GO
/****** Object:  View [dbo].[VIEW_BESTAND]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_BESTAND] AS
SELECT 
pd.ProduktID, 
pd.Produktdetail, 
(SELECT ISNULL(SUM(pe.Menge), 0) FROM PRODUKTEINKAUF pe WHERE pe.ProduktNr=pd.ProduktID) AS "Eingekaufte Menge",
(SELECT ISNULL(SUM(pv.Menge), 0) FROM PRODUKTVERKAUF pv WHERE pv.ProduktNr=pd.ProduktID) AS "Verkaufte Menge",
(SELECT ISNULL(SUM(pe.Menge), 0) FROM PRODUKTEINKAUF pe WHERE pe.ProduktNr=pd.ProduktID) -
(SELECT ISNULL(SUM(pv.Menge), 0) FROM PRODUKTVERKAUF pv WHERE pv.ProduktNr=pd.ProduktID) AS "Lagerbestand"
FROM PRODUKTE pd;

GO
/****** Object:  View [dbo].[LEERBESTAND]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[LEERBESTAND] AS
SELECT *
FROM VIEW_BESTAND
WHERE LAGERBESTAND=0;

GO
/****** Object:  UserDefinedFunction [dbo].[FNC_EINKAUF_ID_GENERIERUNG]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FNC_EINKAUF_ID_GENERIERUNG]()
RETURNS TABLE
AS
	RETURN
	SELECT MAX(EINKAUFID)+1 AS EINKAUFID, GETDATE() AS DATUM FROM PRODUKTEINKAUF;

GO
/****** Object:  UserDefinedFunction [dbo].[FNC_FARBE_ANZEIGEN]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FNC_FARBE_ANZEIGEN](@FARBE AS VARCHAR(20))
RETURNS TABLE
AS
	RETURN

SELECT pd.Produktdetail, fs.FarbNr, fa.Name
FROM Farbzusammensetzung fs
INNER JOIN PRODUKTE pd ON pd.ProduktID=fs.ProduktNr
INNER JOIN FARBEN fa ON fa.FarbID=fs.FarbNr
WHERE FARBNR IN(SELECT DISTINCT FARBID FROM FARBEN WHERE FARBEN.Name LIKE '%'+@FARBE+'%');

GO
/****** Object:  View [dbo].[alle_nike_sachen]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[alle_nike_sachen] as
select 

Produktdetail,
marken.name as marke, 
zielgruppen.name as zielgruppe, 
kategorien.name as kategorie, 
verkaufspreis, 
groessen.name as groesse

from produkte, marken, zielgruppen, kategorien, Produktvarianten, groessen
where MarkenNr = MarkenID
and ZielgruppenNr = ZielgruppenID
and KategorieNr = KategorieID
and ProduktID = ProduktNr
and GroessenNR = GroessenID
and marken.Name = 'Nike'

GO
/****** Object:  View [dbo].[alle_produktdetails]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[alle_produktdetails] AS
select Produktdetail from produkte;

GO
/****** Object:  View [dbo].[angebote]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[angebote] as
select 

Produktdetail,
marken.name as marke, 
zielgruppen.name as zielgruppe, 
kategorien.name as kategorie, 
verkaufspreis, 
groessen.name as groesse

from produkte, marken, zielgruppen, kategorien, Produktvarianten, groessen
where MarkenNr = MarkenID
and ZielgruppenNr = ZielgruppenID
and KategorieNr = KategorieID
and ProduktID = ProduktNr
and GroessenNR = GroessenID

GO
/****** Object:  View [dbo].[Ausgabenuebersicht]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Ausgabenuebersicht] as
select Name, Vorname, Gehalt from Mitarbeiter;

GO
/****** Object:  View [dbo].[beliebteste_marken]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[beliebteste_marken] as
select sum(Menge) as 'Summe Verkäufe',
Marken.Name as Marke
from produktverkauf INNER JOIN produkte
on produktverkauf.ProduktNr = produkte.ProduktID
INNER JOIN marken
on Marken.MarkenID = produkte.MarkenNr
group by Marken.name;

GO
/****** Object:  View [dbo].[GESAMTSORTIMENT]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GESAMTSORTIMENT] AS
SELECT 
pe.ProduktNr,
pd.Produktdetail,
pe.GroessenNr,
(SELECT gr.NAME FROM GROESSEN gr WHERE gr.GroessenID=pe.GroessenNr ) AS GROESSE,
pe.FarbNr,
(SELECT fa.NAME FROM FARBEN fa WHERE fa.FarbID=pe.FarbNr) AS FARBE,
--gr.Name AS GROESSE,
--fa.Name AS FARBE,
--(SELECT NAME FROM MARKEN ma WHERE ma.MarkenID=pd.MarkenNr) AS MARKE,
FORMAT(AVG(pe.Einkaufspreis), '#,##0.00 €') AS "Einkauf PREIS",
FORMAT((SELECT AVG(pv.Verkaufspreis) FROM Produktvarianten pv WHERE pv.ProduktNr=pe.ProduktNr GROUP BY pv.ProduktNr), '#,##0.00 €') AS "Verkauf PREIS",
ISNULL(SUM(pe.Menge), 0) AS "Eingekaufte Menge",
(SELECT ISNULL(SUM(pv.Menge), 0) FROM PRODUKTVERKAUF pv WHERE pv.ProduktNr=pe.ProduktNr AND pv.GroessenNr=pe.GroessenNr AND pv.FarbNr=pe.FarbNr) AS "Verkaufte Menge",
ISNULL(SUM(pe.Menge), 0) -
(SELECT ISNULL(SUM(pv.Menge), 0) FROM PRODUKTVERKAUF pv WHERE pv.ProduktNr=pe.ProduktNr AND pv.GroessenNr=pe.GroessenNr AND pv.FarbNr=pe.FarbNr) AS "Lagerbestand"
FROM PRODUKTEINKAUF pe
INNER JOIN PRODUKTE pd ON pd.ProduktID=pe.ProduktNr
INNER JOIN GROESSEN gr ON gr.GroessenID=pe.GroessenNr
INNER JOIN FARBEN fa ON fa.FarbID=pe.FarbNr
GROUP BY 
pe.ProduktNr,
pd.Produktdetail,
pe.GroessenNr,
pe.FarbNr;

GO
/****** Object:  View [dbo].[ladenhueter]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ladenhueter] as
select top 100 

case
when sum(Menge) IS NOT NULL then  cast(sum(Menge) as varchar)
else 'KEINE VERKÄUFE'
end as 'Summe Verkäufe'

, Produktdetail from produkte LEFT JOIN produktverkauf 
on produkte.ProduktID = produktverkauf.produktNr
group by Produktdetail
order by sum(Menge) asc;

GO
/****** Object:  View [dbo].[Lagerbestand]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Lagerbestand] AS
select
ProduktID,
Produktdetail,
	(select count(*) from produkteinkauf 
		where groessenNR = (select GroessenID from groessen where name like 'XL%')
		and produktNr = produkte.produktID) 'EK XL',
	(select count(*) from produkteinkauf 
		where groessenNR = (select GroessenID from groessen where name like 'XXL%')
		and produktNr = produkte.produktID) 'EK XXL',
	(select count(*) from produktverkauf 
		where groessenNR = (select GroessenID from groessen where name like 'XL%')
		and produktNr = produkte.produktID) 'VK XL',
	(select count(*) from produktverkauf 
		where groessenNR = (select GroessenID from groessen where name like 'XXL%')
		and produktNr = produkte.produktID) 'VK XXL',
	(select count(*) from produkteinkauf 
		where groessenNR = (select GroessenID from groessen where name like 'XL%')
		and produktNr = produkte.produktID) - 
	(select count(*) from produktverkauf 
		where groessenNR = (select GroessenID from groessen where name like 'XL%')
		and produktNr = produkte.produktID) 'XL Verfügbar',
	(select count(*) from produkteinkauf 
		where groessenNR = (select GroessenID from groessen where name like 'XXL%')
		and produktNr = produkte.produktID) - 
	(select count(*) from produktverkauf 
		where groessenNR = (select GroessenID from groessen where name like 'XXL%')
		and produktNr = produkte.produktID) 'XXL Verfügbar'

from
produkte;

GO
/****** Object:  View [dbo].[MITARBEITERPERFORMANCE]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MITARBEITERPERFORMANCE] AS
SELECT 
pv.MitarbeiterNr, 
(SELECT ma.Name + ', ' + ma.Vorname FROM MITARBEITER ma WHERE ma.MitarbeiterID=pv.MitarbeiterNr) "VERKÄUFER/IN",
FORMAT(SUM((BETRAG-ISNULL(RABATT, 0))*MENGE), '#,##0.00 €') AS Umsatz
FROM PRODUKTVERKAUF pv
WHERE pv.ProduktNr IS NOT NULL
GROUP BY pv.MitarbeiterNr;

GO
/****** Object:  View [dbo].[produkte_nicht_mehr_lieferbar]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[produkte_nicht_mehr_lieferbar] as
select distinct ProduktID, Produktdetail, Groessen.Name as Groesse, Farben.Name as Farbe,
(select sum(menge)
from produkte as p_fuer_ek INNER JOIN produkteinkauf as peinkauf on p_fuer_ek.ProduktID = peinkauf.ProduktNr
where ProduktID = HAUPTABFRAGE_PRODUKTEINKAUF.ProduktNr
and GroessenNr = HAUPTABFRAGE_PRODUKTEINKAUF.GroessenNr
and FarbNr = HAUPTABFRAGE_PRODUKTEINKAUF.FarbNr) 'gekauft',
(select sum(menge)
from produkte as p_fuer_vk INNER JOIN produktverkauf as pverkauf on p_fuer_vk.ProduktID = pverkauf.ProduktNr
where ProduktID = HAUPTABFRAGE_PRODUKTEINKAUF.ProduktNr
and GroessenNr = HAUPTABFRAGE_PRODUKTEINKAUF.GroessenNr
and FarbNr = HAUPTABFRAGE_PRODUKTEINKAUF.FarbNr) 'verkauft',


(select sum(menge)
from produkte as p_fuer_ek INNER JOIN produkteinkauf as peinkauf on p_fuer_ek.ProduktID = peinkauf.ProduktNr
where ProduktID = HAUPTABFRAGE_PRODUKTEINKAUF.ProduktNr
and GroessenNr = HAUPTABFRAGE_PRODUKTEINKAUF.GroessenNr
and FarbNr = HAUPTABFRAGE_PRODUKTEINKAUF.FarbNr)
-
(select sum(menge)
from produkte as p_fuer_vk INNER JOIN produktverkauf as pverkauf on p_fuer_vk.ProduktID = pverkauf.ProduktNr
where ProduktID = HAUPTABFRAGE_PRODUKTEINKAUF.ProduktNr
and GroessenNr = HAUPTABFRAGE_PRODUKTEINKAUF.GroessenNr
and FarbNr = HAUPTABFRAGE_PRODUKTEINKAUF.FarbNr)
'restbestand'

from produkteinkauf as HAUPTABFRAGE_PRODUKTEINKAUF
INNER JOIN produkte ON produkte.ProduktID = HAUPTABFRAGE_PRODUKTEINKAUF.ProduktNr
INNER JOIN Groessen ON groessen.GroessenID = HAUPTABFRAGE_PRODUKTEINKAUF.GroessenNr
INNER JOIN Farbzusammensetzung ON Farbzusammensetzung.ProduktNr = HAUPTABFRAGE_PRODUKTEINKAUF.ProduktNr
INNER JOIN Farben ON farben.FarbID = HAUPTABFRAGE_PRODUKTEINKAUF.FarbNr
 
 where (select sum(menge)
from produkte as p_fuer_ek INNER JOIN produkteinkauf as peinkauf on p_fuer_ek.ProduktID = peinkauf.ProduktNr
where ProduktID = HAUPTABFRAGE_PRODUKTEINKAUF.ProduktNr
and GroessenNr = HAUPTABFRAGE_PRODUKTEINKAUF.GroessenNr
and FarbNr = HAUPTABFRAGE_PRODUKTEINKAUF.FarbNr)
-
(select sum(menge)
from produkte as p_fuer_vk INNER JOIN produktverkauf as pverkauf on p_fuer_vk.ProduktID = pverkauf.ProduktNr
where ProduktID = HAUPTABFRAGE_PRODUKTEINKAUF.ProduktNr
and GroessenNr = HAUPTABFRAGE_PRODUKTEINKAUF.GroessenNr
and FarbNr = HAUPTABFRAGE_PRODUKTEINKAUF.FarbNr) = 0;

GO
/****** Object:  View [dbo].[produkte_restbestände]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[produkte_restbestände] as
select distinct ProduktID, Produktdetail, Groessen.Name as Groesse, Farben.Name as Farbe,
(select sum(menge)
from produkte as p_fuer_ek INNER JOIN produkteinkauf as peinkauf on p_fuer_ek.ProduktID = peinkauf.ProduktNr
where ProduktID = HAUPTABFRAGE_PRODUKTEINKAUF.ProduktNr
and GroessenNr = HAUPTABFRAGE_PRODUKTEINKAUF.GroessenNr
and FarbNr = HAUPTABFRAGE_PRODUKTEINKAUF.FarbNr) 'gekauft',
(select sum(menge)
from produkte as p_fuer_vk INNER JOIN produktverkauf as pverkauf on p_fuer_vk.ProduktID = pverkauf.ProduktNr
where ProduktID = HAUPTABFRAGE_PRODUKTEINKAUF.ProduktNr
and GroessenNr = HAUPTABFRAGE_PRODUKTEINKAUF.GroessenNr
and FarbNr = HAUPTABFRAGE_PRODUKTEINKAUF.FarbNr) 'verkauft',


(select sum(menge)
from produkte as p_fuer_ek INNER JOIN produkteinkauf as peinkauf on p_fuer_ek.ProduktID = peinkauf.ProduktNr
where ProduktID = HAUPTABFRAGE_PRODUKTEINKAUF.ProduktNr
and GroessenNr = HAUPTABFRAGE_PRODUKTEINKAUF.GroessenNr
and FarbNr = HAUPTABFRAGE_PRODUKTEINKAUF.FarbNr)
-
(select sum(menge)
from produkte as p_fuer_vk INNER JOIN produktverkauf as pverkauf on p_fuer_vk.ProduktID = pverkauf.ProduktNr
where ProduktID = HAUPTABFRAGE_PRODUKTEINKAUF.ProduktNr
and GroessenNr = HAUPTABFRAGE_PRODUKTEINKAUF.GroessenNr
and FarbNr = HAUPTABFRAGE_PRODUKTEINKAUF.FarbNr)
'restbestand'

from produkteinkauf as HAUPTABFRAGE_PRODUKTEINKAUF
INNER JOIN produkte ON produkte.ProduktID = HAUPTABFRAGE_PRODUKTEINKAUF.ProduktNr
INNER JOIN Groessen ON groessen.GroessenID = HAUPTABFRAGE_PRODUKTEINKAUF.GroessenNr
INNER JOIN Farbzusammensetzung ON Farbzusammensetzung.ProduktNr = HAUPTABFRAGE_PRODUKTEINKAUF.ProduktNr
INNER JOIN Farben ON farben.FarbID = HAUPTABFRAGE_PRODUKTEINKAUF.FarbNr;

GO
/****** Object:  View [dbo].[topsellerprodukte]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[topsellerprodukte] as
select top 10 sum(Menge) as 'Summe Verkäufe', Produktdetail from produktverkauf inner join produkte 
on produkte.produktID = produktverkauf.produktNr
group by Produktdetail
order by sum(Menge) desc;

GO
/****** Object:  View [dbo].[TOPSELLERUMSATZ]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TOPSELLERUMSATZ] AS
SELECT TOP 10
	pv.ProduktNr AS PRODUKT, 
	(SELECT PRODUKTDETAIL FROM PRODUKTE WHERE PRODUKTID=pv.PRODUKTNR) AS NAME, 
	FORMAT(SUM((BETRAG-ISNULL(RABATT, 0))*MENGE), '#,##0.00 €') AS Umsatz
FROM PRODUKTVERKAUF pv
WHERE pv.PRODUKTNR IS NOT NULL
GROUP BY pv.ProduktNr
ORDER BY SUM((BETRAG-ISNULL(RABATT, 0))*MENGE) DESC;

GO
/****** Object:  View [dbo].[umsatzansicht]    Script Date: 15.12.2017 15:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[umsatzansicht] as
select 
FORMAT((select sum(betrag*menge) from produktverkauf),'#,##0.00') as 'Einnahmen',
FORMAT((select sum(einkaufspreis*menge) from produkteinkauf),'#,##0.00') as 'Ausgaben',
FORMAT((select sum(betrag*menge) from produktverkauf) - (select sum(einkaufspreis*menge) from produkteinkauf)
,'#,##0.00') as 'Zwischenergebnis',
FORMAT((select sum(gehalt) from mitarbeiter),'#,##0.00') 'abzüglich Gehälter',
FORMAT(
(select sum(betrag*menge) from produktverkauf) -
(select sum(einkaufspreis*menge) from produkteinkauf) - 
(select sum(gehalt) from mitarbeiter),'#,##0.00') as 'Gewinn / Verlust';

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NAME_IDX]    Script Date: 15.12.2017 15:35:47 ******/
CREATE NONCLUSTERED INDEX [NAME_IDX] ON [dbo].[Marken]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NAME_IDX2]    Script Date: 15.12.2017 15:35:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [NAME_IDX2] ON [dbo].[Marken]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Farbzusammensetzung]  WITH CHECK ADD  CONSTRAINT [FK_FarbNr] FOREIGN KEY([FarbNr])
REFERENCES [dbo].[Farben] ([FarbID])
GO
ALTER TABLE [dbo].[Farbzusammensetzung] CHECK CONSTRAINT [FK_FarbNr]
GO
ALTER TABLE [dbo].[Farbzusammensetzung]  WITH CHECK ADD  CONSTRAINT [FK_ProduktNr3] FOREIGN KEY([ProduktNr])
REFERENCES [dbo].[Produkte] ([ProduktID])
GO
ALTER TABLE [dbo].[Farbzusammensetzung] CHECK CONSTRAINT [FK_ProduktNr3]
GO
ALTER TABLE [dbo].[Produkte]  WITH CHECK ADD  CONSTRAINT [FK_KategorieNr] FOREIGN KEY([KategorieNr])
REFERENCES [dbo].[Kategorien] ([KategorieID])
GO
ALTER TABLE [dbo].[Produkte] CHECK CONSTRAINT [FK_KategorieNr]
GO
ALTER TABLE [dbo].[Produkte]  WITH CHECK ADD  CONSTRAINT [FK_MarkenNr] FOREIGN KEY([MarkenNr])
REFERENCES [dbo].[Marken] ([MarkenID])
GO
ALTER TABLE [dbo].[Produkte] CHECK CONSTRAINT [FK_MarkenNr]
GO
ALTER TABLE [dbo].[Produkte]  WITH CHECK ADD  CONSTRAINT [FK_ZielgruppenNr] FOREIGN KEY([ZielgruppenNr])
REFERENCES [dbo].[Zielgruppen] ([ZielgruppenID])
GO
ALTER TABLE [dbo].[Produkte] CHECK CONSTRAINT [FK_ZielgruppenNr]
GO
ALTER TABLE [dbo].[Produkteinkauf]  WITH CHECK ADD  CONSTRAINT [FK_Produkteinkauf_gehoert_zu_Farben] FOREIGN KEY([FarbNr])
REFERENCES [dbo].[Farben] ([FarbID])
GO
ALTER TABLE [dbo].[Produkteinkauf] CHECK CONSTRAINT [FK_Produkteinkauf_gehoert_zu_Farben]
GO
ALTER TABLE [dbo].[Produkteinkauf]  WITH CHECK ADD  CONSTRAINT [FK_Produkteinkauf_gehoert_zu_Groessen] FOREIGN KEY([GroessenNr])
REFERENCES [dbo].[Groessen] ([GroessenID])
GO
ALTER TABLE [dbo].[Produkteinkauf] CHECK CONSTRAINT [FK_Produkteinkauf_gehoert_zu_Groessen]
GO
ALTER TABLE [dbo].[Produkteinkauf]  WITH CHECK ADD  CONSTRAINT [FK_Produkteinkauf_gehoert_zu_Lieferanten] FOREIGN KEY([LieferantNr])
REFERENCES [dbo].[Lieferanten] ([LieferantenID])
GO
ALTER TABLE [dbo].[Produkteinkauf] CHECK CONSTRAINT [FK_Produkteinkauf_gehoert_zu_Lieferanten]
GO
ALTER TABLE [dbo].[Produkteinkauf]  WITH CHECK ADD  CONSTRAINT [FK_Produkteinkauf_gehoert_zu_Mitarbeiter] FOREIGN KEY([MitarbeiterNr])
REFERENCES [dbo].[Mitarbeiter] ([MitarbeiterID])
GO
ALTER TABLE [dbo].[Produkteinkauf] CHECK CONSTRAINT [FK_Produkteinkauf_gehoert_zu_Mitarbeiter]
GO
ALTER TABLE [dbo].[Produkteinkauf]  WITH CHECK ADD  CONSTRAINT [FK_Produkteinkauf_gehoert_zu_Produkte] FOREIGN KEY([ProduktNr])
REFERENCES [dbo].[Produkte] ([ProduktID])
GO
ALTER TABLE [dbo].[Produkteinkauf] CHECK CONSTRAINT [FK_Produkteinkauf_gehoert_zu_Produkte]
GO
ALTER TABLE [dbo].[Produktvarianten]  WITH CHECK ADD  CONSTRAINT [FK_GroessenNr] FOREIGN KEY([GroessenNr])
REFERENCES [dbo].[Groessen] ([GroessenID])
GO
ALTER TABLE [dbo].[Produktvarianten] CHECK CONSTRAINT [FK_GroessenNr]
GO
ALTER TABLE [dbo].[Produktvarianten]  WITH CHECK ADD  CONSTRAINT [FK_ProduktNr] FOREIGN KEY([ProduktNr])
REFERENCES [dbo].[Produkte] ([ProduktID])
GO
ALTER TABLE [dbo].[Produktvarianten] CHECK CONSTRAINT [FK_ProduktNr]
GO
/****** Object:  StoredProcedure [dbo].[MEIN_PROC]    Script Date: 15.12.2017 15:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MEIN_PROC]
@mein_var int = 5
 AS
BEGIN
	PRINT @mein_var;
	SELECT 1, 2, 3;
END

GO
/****** Object:  StoredProcedure [dbo].[MENGE_IN_LAGER_PER_PRODUKT_ID]    Script Date: 15.12.2017 15:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MENGE_IN_LAGER_PER_PRODUKT_ID]
@PARAM_PRODUKT_ID int
AS
BEGIN
DECLARE @ProduktNR int = 0;
DECLARE @GroessenNR int = 0;
DECLARE @FarbeNR int = 0;
DECLARE @MENGE int = 0
DECLARE @PRODUKTDETAIL VARCHAR(255) = (SELECT PRODUKTDETAIL FROM PRODUKTE WHERE PRODUKTID=@PARAM_PRODUKT_ID);

DECLARE Produkt_Cursor CURSOR FOR 
	SELECT 
	pe.ProduktNR, 
	pe.GroessenNr, 
	SUM(pe.MENGE)
	-
	(SELECT ISNULL(SUM(pv.MENGE), 0) AS MENGEVK FROM PRODUKTVERKAUF pv WHERE pv.ProduktNR IS NOT NULL AND pv.ProduktNR=pe.ProduktNR AND pv.GroessenNr=pe.GroessenNr) TOTAL
	FROM PRODUKTEINKAUF pe
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





GO
/****** Object:  StoredProcedure [dbo].[MENGE_IN_LAGER_PER_PRODUKT_NAME]    Script Date: 15.12.2017 15:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MENGE_IN_LAGER_PER_PRODUKT_NAME]
@PARAM_PRODUKT_NAME VARCHAR(255)
AS
BEGIN
	DECLARE Produkt_Cursor_Name CURSOR FOR 
		SELECT DISTINCT PRODUKTID FROM PRODUKTE WHERE PRODUKTDETAIL LIKE '%'+@PARAM_PRODUKT_NAME+'%';

	DECLARE @ProduktID int = 0;

	OPEN Produkt_Cursor_Name;

	FETCH NEXT FROM Produkt_Cursor_Name INTO @ProduktID;

	WHILE(@@FETCH_STATUS = 0)
		BEGIN
		EXEC MENGE_IN_LAGER_PER_PRODUKT_ID @ProduktID;
			FETCH NEXT FROM Produkt_Cursor_Name INTO @ProduktID;
		END

	CLOSE Produkt_Cursor_Name;
	DEALLOCATE Produkt_Cursor_Name;

END



GO
USE [master]
GO
ALTER DATABASE [testdatenbank] SET  READ_WRITE 
GO
