-- USE Fashionshop
ALTER TABLE [dbo].[Produktvarianten] DROP CONSTRAINT [FK_ProduktNr]
GO
ALTER TABLE [dbo].[Produktvarianten] DROP CONSTRAINT [FK_GroessenNr]
GO
ALTER TABLE [dbo].[Produkteinkauf] DROP CONSTRAINT [FK_Produkteinkauf_gehoert_zu_Produkte]
GO
ALTER TABLE [dbo].[Produkteinkauf] DROP CONSTRAINT [FK_Produkteinkauf_gehoert_zu_Mitarbeiter]
GO
ALTER TABLE [dbo].[Produkteinkauf] DROP CONSTRAINT [FK_Produkteinkauf_gehoert_zu_Lieferanten]
GO
ALTER TABLE [dbo].[Produkteinkauf] DROP CONSTRAINT [FK_Produkteinkauf_gehoert_zu_Groessen]
GO
ALTER TABLE [dbo].[Produkteinkauf] DROP CONSTRAINT [FK_Produkteinkauf_gehoert_zu_Farben]
GO
ALTER TABLE [dbo].[Produkte] DROP CONSTRAINT [FK_ZielgruppenNr]
GO
ALTER TABLE [dbo].[Produkte] DROP CONSTRAINT [FK_MarkenNr]
GO
ALTER TABLE [dbo].[Produkte] DROP CONSTRAINT [FK_KategorieNr]
GO
ALTER TABLE [dbo].[Farbzusammensetzung] DROP CONSTRAINT [FK_ProduktNr3]
GO
ALTER TABLE [dbo].[Farbzusammensetzung] DROP CONSTRAINT [FK_FarbNr]
GO
/****** Object:  View [dbo].[umsatzansicht]    Script Date: 28.04.2017 09:33:09 ******/
DROP VIEW [dbo].[umsatzansicht]
GO
/****** Object:  View [dbo].[topsellerprodukte]    Script Date: 28.04.2017 09:33:09 ******/
DROP VIEW [dbo].[topsellerprodukte]
GO
/****** Object:  View [dbo].[produkte_restbestände]    Script Date: 28.04.2017 09:33:09 ******/
DROP VIEW [dbo].[produkte_restbestände]
GO
/****** Object:  View [dbo].[produkte_nicht_mehr_lieferbar]    Script Date: 28.04.2017 09:33:09 ******/
DROP VIEW [dbo].[produkte_nicht_mehr_lieferbar]
GO
/****** Object:  View [dbo].[Lagerbestand]    Script Date: 28.04.2017 09:33:09 ******/
DROP VIEW [dbo].[Lagerbestand]
GO
/****** Object:  View [dbo].[ladenhueter]    Script Date: 28.04.2017 09:33:09 ******/
DROP VIEW [dbo].[ladenhueter]
GO
/****** Object:  View [dbo].[beliebteste_marken]    Script Date: 28.04.2017 09:33:09 ******/
DROP VIEW [dbo].[beliebteste_marken]
GO
/****** Object:  View [dbo].[Ausgabenuebersicht]    Script Date: 28.04.2017 09:33:09 ******/
DROP VIEW [dbo].[Ausgabenuebersicht]
GO
/****** Object:  View [dbo].[angebote]    Script Date: 28.04.2017 09:33:09 ******/
DROP VIEW [dbo].[angebote]
GO
/****** Object:  View [dbo].[alle_produktdetails]    Script Date: 28.04.2017 09:33:09 ******/
DROP VIEW [dbo].[alle_produktdetails]
GO
/****** Object:  View [dbo].[alle_nike_sachen]    Script Date: 28.04.2017 09:33:09 ******/
DROP VIEW [dbo].[alle_nike_sachen]
GO
/****** Object:  Table [dbo].[Zielgruppen]    Script Date: 28.04.2017 09:33:09 ******/
DROP TABLE [dbo].[Zielgruppen]
GO
/****** Object:  Table [dbo].[Produktvarianten]    Script Date: 28.04.2017 09:33:09 ******/
DROP TABLE [dbo].[Produktvarianten]
GO
/****** Object:  Table [dbo].[top10]    Script Date: 28.04.2017 09:33:09 ******/
DROP TABLE [dbo].[top10]
GO
/****** Object:  Table [dbo].[Rechnungen]    Script Date: 28.04.2017 09:33:09 ******/
DROP TABLE [dbo].[Rechnungen]
GO
/****** Object:  Table [dbo].[Produktverkauf]    Script Date: 28.04.2017 09:33:09 ******/
DROP TABLE [dbo].[Produktverkauf]
GO
/****** Object:  Table [dbo].[Produkteinkauf]    Script Date: 28.04.2017 09:33:09 ******/
DROP TABLE [dbo].[Produkteinkauf]
GO
/****** Object:  Table [dbo].[Produkte]    Script Date: 28.04.2017 09:33:09 ******/
DROP TABLE [dbo].[Produkte]
GO
/****** Object:  Table [dbo].[Mitarbeiter]    Script Date: 28.04.2017 09:33:09 ******/
DROP TABLE [dbo].[Mitarbeiter]
GO
/****** Object:  Table [dbo].[Marken]    Script Date: 28.04.2017 09:33:09 ******/
DROP TABLE [dbo].[Marken]
GO
/****** Object:  Table [dbo].[Lieferanten]    Script Date: 28.04.2017 09:33:09 ******/
DROP TABLE [dbo].[Lieferanten]
GO
/****** Object:  Table [dbo].[Kategorien]    Script Date: 28.04.2017 09:33:09 ******/
DROP TABLE [dbo].[Kategorien]
GO
/****** Object:  Table [dbo].[Groessen]    Script Date: 28.04.2017 09:33:09 ******/
DROP TABLE [dbo].[Groessen]
GO
/****** Object:  Table [dbo].[Farbzusammensetzung]    Script Date: 28.04.2017 09:33:09 ******/
DROP TABLE [dbo].[Farbzusammensetzung]
GO
/****** Object:  Table [dbo].[Farben]    Script Date: 28.04.2017 09:33:09 ******/
DROP TABLE [dbo].[Farben]
GO
/****** Object:  Table [dbo].[Farben]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  Table [dbo].[Farbzusammensetzung]    Script Date: 28.04.2017 09:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Farbzusammensetzung](
	[ProduktNr] [int] NOT NULL,
	[FarbNr] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Groessen]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  Table [dbo].[Kategorien]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  Table [dbo].[Lieferanten]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  Table [dbo].[Marken]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  Table [dbo].[Mitarbeiter]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  Table [dbo].[Produkte]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  Table [dbo].[Produkteinkauf]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  Table [dbo].[Produktverkauf]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  Table [dbo].[Rechnungen]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  Table [dbo].[top10]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  Table [dbo].[Produktvarianten]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  Table [dbo].[Zielgruppen]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  View [dbo].[alle_nike_sachen]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  View [dbo].[alle_produktdetails]    Script Date: 28.04.2017 09:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[alle_produktdetails] AS
select Produktdetail from produkte;
GO
/****** Object:  View [dbo].[angebote]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  View [dbo].[Ausgabenuebersicht]    Script Date: 28.04.2017 09:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Ausgabenuebersicht] as
select Name, Vorname, Gehalt from Mitarbeiter;
GO
/****** Object:  View [dbo].[beliebteste_marken]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  View [dbo].[ladenhueter]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  View [dbo].[Lagerbestand]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  View [dbo].[produkte_nicht_mehr_lieferbar]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  View [dbo].[produkte_restbestände]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  View [dbo].[topsellerprodukte]    Script Date: 28.04.2017 09:33:09 ******/
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
/****** Object:  View [dbo].[umsatzansicht]    Script Date: 28.04.2017 09:33:09 ******/
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
INSERT [dbo].[Farben] ([FarbID], [Name]) VALUES (3, N'blau')
INSERT [dbo].[Farben] ([FarbID], [Name]) VALUES (12, N'dunkelblau')
INSERT [dbo].[Farben] ([FarbID], [Name]) VALUES (2, N'gelb')
INSERT [dbo].[Farben] ([FarbID], [Name]) VALUES (10, N'grün')
INSERT [dbo].[Farben] ([FarbID], [Name]) VALUES (13, N'hellblau')
INSERT [dbo].[Farben] ([FarbID], [Name]) VALUES (9, N'lila')
INSERT [dbo].[Farben] ([FarbID], [Name]) VALUES (6, N'orange')
INSERT [dbo].[Farben] ([FarbID], [Name]) VALUES (1, N'rot')
INSERT [dbo].[Farben] ([FarbID], [Name]) VALUES (5, N'schwarz')
INSERT [dbo].[Farben] ([FarbID], [Name]) VALUES (11, N'silber')
INSERT [dbo].[Farben] ([FarbID], [Name]) VALUES (7, N'türkis')
INSERT [dbo].[Farben] ([FarbID], [Name]) VALUES (8, N'violett')
INSERT [dbo].[Farben] ([FarbID], [Name]) VALUES (4, N'weiss')
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (1, 3)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (1, 2)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (1, 1)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (1, 4)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (2, 3)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (3, 1)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (4, 5)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (5, 3)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (5, 6)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (5, 1)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (5, 5)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (5, 7)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (5, 8)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (5, 4)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (6, 3)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (6, 9)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (6, 1)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (6, 5)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (7, 3)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (7, 10)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (7, 1)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (7, 5)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (8, 3)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (8, 10)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (8, 1)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (9, 2)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (9, 6)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (9, 1)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (10, 2)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (10, 10)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (10, 5)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (10, 4)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (11, 9)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (11, 1)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (12, 12)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (12, 13)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (12, 5)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (13, 10)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (13, 9)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (13, 1)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (13, 5)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (14, 6)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (15, 11)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (15, 4)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (16, 3)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (16, 10)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (16, 1)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (16, 5)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (17, 3)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (17, 6)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (17, 4)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (18, 12)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (18, 13)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (19, 4)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (20, 2)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (20, 6)
INSERT [dbo].[Farbzusammensetzung] ([ProduktNr], [FarbNr]) VALUES (20, 4)
INSERT [dbo].[Groessen] ([GroessenID], [Name]) VALUES (1, N'XS (39)')
INSERT [dbo].[Groessen] ([GroessenID], [Name]) VALUES (2, N'S (40)')
INSERT [dbo].[Groessen] ([GroessenID], [Name]) VALUES (3, N'M (41)')
INSERT [dbo].[Groessen] ([GroessenID], [Name]) VALUES (4, N'L (42)')
INSERT [dbo].[Groessen] ([GroessenID], [Name]) VALUES (5, N'XL (43)')
INSERT [dbo].[Groessen] ([GroessenID], [Name]) VALUES (6, N'XXL (44)')
INSERT [dbo].[Groessen] ([GroessenID], [Name]) VALUES (7, N'3XL (45)')
INSERT [dbo].[Groessen] ([GroessenID], [Name]) VALUES (8, N'4XL (46)')
INSERT [dbo].[Groessen] ([GroessenID], [Name]) VALUES (9, N'5XL (47)')
INSERT [dbo].[Kategorien] ([KategorieID], [Name]) VALUES (1, N'T-Shirt')
INSERT [dbo].[Kategorien] ([KategorieID], [Name]) VALUES (2, N'Jacke')
INSERT [dbo].[Kategorien] ([KategorieID], [Name]) VALUES (3, N'Hemd')
INSERT [dbo].[Kategorien] ([KategorieID], [Name]) VALUES (4, N'Kapuzenpullover')
INSERT [dbo].[Kategorien] ([KategorieID], [Name]) VALUES (5, N'Windbreaker')
INSERT [dbo].[Kategorien] ([KategorieID], [Name]) VALUES (6, N'Longshirt')
INSERT [dbo].[Kategorien] ([KategorieID], [Name]) VALUES (7, N'Top')
INSERT [dbo].[Kategorien] ([KategorieID], [Name]) VALUES (8, N'Kleid')
INSERT [dbo].[Kategorien] ([KategorieID], [Name]) VALUES (9, N'Legging')
INSERT [dbo].[Kategorien] ([KategorieID], [Name]) VALUES (10, N'Rock')
INSERT [dbo].[Kategorien] ([KategorieID], [Name]) VALUES (11, N'Jeanshose')
INSERT [dbo].[Kategorien] ([KategorieID], [Name]) VALUES (12, N'Hose')
INSERT [dbo].[Lieferanten] ([LieferantenID], [Adresse], [Name], [Ansprechpartner]) 
VALUES (1, N'', N'Nike', NULL)
INSERT [dbo].[Lieferanten] ([LieferantenID], [Adresse], [Name], [Ansprechpartner]) VALUES (2, N'', N'Puma', NULL)
INSERT [dbo].[Lieferanten] ([LieferantenID], [Adresse], [Name], [Ansprechpartner]) VALUES (3, N'', N'NoName', NULL)
INSERT [dbo].[Lieferanten] ([LieferantenID], [Adresse], [Name], [Ansprechpartner]) VALUES (4, N'', N'Lagerfeld', NULL)
INSERT [dbo].[Lieferanten] ([LieferantenID], [Adresse], [Name], [Ansprechpartner]) VALUES (5, N'', N'Fruit of the Loom', NULL)
INSERT [dbo].[Lieferanten] ([LieferantenID], [Adresse], [Name], [Ansprechpartner]) VALUES (6, N'', N'Carhartt', NULL)
INSERT [dbo].[Lieferanten] ([LieferantenID], [Adresse], [Name], [Ansprechpartner]) VALUES (7, N'', N'Review', NULL)
INSERT [dbo].[Lieferanten] ([LieferantenID], [Adresse], [Name], [Ansprechpartner]) VALUES (8, N'', N'Only', NULL)
INSERT [dbo].[Lieferanten] ([LieferantenID], [Adresse], [Name], [Ansprechpartner]) VALUES (9, N'', N'Esprit', NULL)
INSERT [dbo].[Lieferanten] ([LieferantenID], [Adresse], [Name], [Ansprechpartner]) VALUES (10, N'', N'Snipes', NULL)
INSERT [dbo].[Lieferanten] ([LieferantenID], [Adresse], [Name], [Ansprechpartner]) VALUES (11, N'', N'Jack Wolfskin', NULL)
INSERT [dbo].[Lieferanten] ([LieferantenID], [Adresse], [Name], [Ansprechpartner]) VALUES (12, N'', N'Superdry', NULL)
INSERT [dbo].[Lieferanten] ([LieferantenID], [Adresse], [Name], [Ansprechpartner]) VALUES (13, N'', N'Jack and Jones', NULL)
INSERT [dbo].[Lieferanten] ([LieferantenID], [Adresse], [Name], [Ansprechpartner]) VALUES (14, N'', N'Calvin Klein', NULL)
INSERT [dbo].[Marken] ([MarkenID], [Name]) VALUES (14, N'Calvin Klein')
INSERT [dbo].[Marken] ([MarkenID], [Name]) VALUES (6, N'Carhartt')
INSERT [dbo].[Marken] ([MarkenID], [Name]) VALUES (9, N'Esprit')
INSERT [dbo].[Marken] ([MarkenID], [Name]) VALUES (5, N'Fruit of the Loom')
INSERT [dbo].[Marken] ([MarkenID], [Name]) VALUES (13, N'Jack and Jones')
INSERT [dbo].[Marken] ([MarkenID], [Name]) VALUES (11, N'Jack Wolfskin')
INSERT [dbo].[Marken] ([MarkenID], [Name]) VALUES (4, N'Lagerfeld')
INSERT [dbo].[Marken] ([MarkenID], [Name]) VALUES (1, N'Nike')
INSERT [dbo].[Marken] ([MarkenID], [Name]) VALUES (3, N'NoName')
INSERT [dbo].[Marken] ([MarkenID], [Name]) VALUES (8, N'Only')
INSERT [dbo].[Marken] ([MarkenID], [Name]) VALUES (2, N'Puma')
INSERT [dbo].[Marken] ([MarkenID], [Name]) VALUES (7, N'Review')
INSERT [dbo].[Marken] ([MarkenID], [Name]) VALUES (10, N'Snipes')
INSERT [dbo].[Marken] ([MarkenID], [Name]) VALUES (12, N'Superdry')
INSERT [dbo].[Mitarbeiter] ([MitarbeiterID], [Name], [Vorname], [Gehalt], [Position], [Job], [VorgesetztenNR]) VALUES (1, N'Nagel', N'Kathrin', CAST(40000.00 AS Decimal(8, 2)), N'Filialleiterin', N'Vollzeit', NULL)
INSERT [dbo].[Mitarbeiter] ([MitarbeiterID], [Name], [Vorname], [Gehalt], [Position], [Job], [VorgesetztenNR]) VALUES (2, N'Meier', N'Max', CAST(35000.00 AS Decimal(8, 2)), N'Teamleiter', N'Vollzeit', 1)
INSERT [dbo].[Mitarbeiter] ([MitarbeiterID], [Name], [Vorname], [Gehalt], [Position], [Job], [VorgesetztenNR]) VALUES (3, N'Schulz', N'Sieglinde', CAST(30000.00 AS Decimal(8, 2)), N'Teammitglied', N'Vollzeit', 2)
INSERT [dbo].[Mitarbeiter] ([MitarbeiterID], [Name], [Vorname], [Gehalt], [Position], [Job], [VorgesetztenNR]) VALUES (4, N'Fischer', N'Fritz', CAST(29000.00 AS Decimal(8, 2)), N'Teammitglied', N'Vollzeit', 2)
INSERT [dbo].[Mitarbeiter] ([MitarbeiterID], [Name], [Vorname], [Gehalt], [Position], [Job], [VorgesetztenNR]) VALUES (5, N'Prakti', N'Patrik', CAST(0.00 AS Decimal(8, 2)), N'Praktikant', N'Vollzeit', 3)
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (1, 1, 1, 1, N'Nike T-Shirt: 100% Baumwolle, fällt groß aus')
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (2, 2, 1, 1, N'Puma T-Shirt: 100% Polyester, fällt normal aus')
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (3, 3, 1, 2, N'Regenjacke: 100% Nylon, fällt groß aus')
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (4, 4, 1, 3, N'Lagerfeld Hemd: 100% Baumwolle, fällt eng aus')
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (5, 5, 5, 4, N'Fruit of the Loom Kapuzenpullover: 70% Baumwolle, 30% Polyester, fällt normal aus')
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (6, 1, 1, 4, N'Nike Kapuzenpullover: 90% Polyester, 10% Baumwolle, fällt groß aus')
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (7, 6, 1, 5, N'Carhartt Windbreaker: 100% Nylon, fällt klein aus')
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (8, 2, 1, 6, N'Puma Longshirt: 60% Baumwolle, 10% Elastan, 30% Viskose')
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (9, 7, 1, 6, N'Review Longshirt: 70% Baumwolle, 30% Viskose')
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (10, 8, 2, 7, N'Only Top: 100% Viskose')
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (11, 9, 2, 8, N'Esprit Kleid: 100% Seide')
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (12, 9, 2, 9, N'Esprit Leggings: 100% Lycra')
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (13, 9, 2, 10, N'Esprit Rock: 100% Baumwolle')
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (14, 10, 1, 2, N'Snipes College Jacke: 100% Nylon')
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (15, 8, 2, 1, N'Only Shirt: 100% Viskose')
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (16, 11, 2, 2, N'Jack Wolfskin Jacke: 100% Nylon')
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (17, 12, 5, 4, N'Superdry Kapuzenpullover: 100% Baumwolle')
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (18, 13, 1, 11, N'Jack and Jones Jeanshose: 99%Baumwolle, 1% Elastan')
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (19, 14, 2, 1, N'Calvin Klein Shirt: 50% Baumwolle, 50% Elastan')
INSERT [dbo].[Produkte] ([ProduktID], [MarkenNr], [ZielgruppenNr], [KategorieNr], [Produktdetail]) VALUES (20, 8, 2, 1, N'Only T-Shirt mit Kapuze: 100% Viskose')
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010101, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 1, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010102, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 1, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010103, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 1, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010104, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 1, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010201, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 2, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010202, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 2, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010203, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 2, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010204, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 2, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010301, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 3, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010302, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 3, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010303, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 3, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010304, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 3, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010401, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 4, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010402, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 4, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010403, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 4, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010404, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 4, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010501, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 5, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010502, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 5, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010503, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 5, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010504, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 5, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010601, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 6, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010602, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 6, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010603, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 6, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010604, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 6, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010701, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 7, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010702, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 7, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010703, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 7, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010704, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 7, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010801, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 8, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010802, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 8, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010803, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 8, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010804, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 8, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010901, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 9, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010902, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 9, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010903, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 9, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (1010904, CAST(1.00 AS Decimal(6, 2)), 10, 1, 1, 1, CAST(N'2017-04-27' AS Date), 9, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (2020103, CAST(1.00 AS Decimal(6, 2)), 10, 2, 1, 2, CAST(N'2017-04-27' AS Date), 1, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (2020203, CAST(1.00 AS Decimal(6, 2)), 10, 2, 1, 2, CAST(N'2017-04-27' AS Date), 2, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (2020303, CAST(1.00 AS Decimal(6, 2)), 10, 2, 1, 2, CAST(N'2017-04-27' AS Date), 3, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (2020403, CAST(1.00 AS Decimal(6, 2)), 10, 2, 1, 2, CAST(N'2017-04-27' AS Date), 4, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (2020503, CAST(1.00 AS Decimal(6, 2)), 10, 2, 1, 2, CAST(N'2017-04-27' AS Date), 5, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (2020603, CAST(1.00 AS Decimal(6, 2)), 10, 2, 1, 2, CAST(N'2017-04-27' AS Date), 6, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (2020703, CAST(1.00 AS Decimal(6, 2)), 10, 2, 1, 2, CAST(N'2017-04-27' AS Date), 7, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (2020803, CAST(1.00 AS Decimal(6, 2)), 10, 2, 1, 2, CAST(N'2017-04-27' AS Date), 8, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (2020903, CAST(1.00 AS Decimal(6, 2)), 10, 2, 1, 2, CAST(N'2017-04-27' AS Date), 9, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (3030101, CAST(1.00 AS Decimal(6, 2)), 10, 3, 1, 3, CAST(N'2017-04-27' AS Date), 1, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (3030201, CAST(1.00 AS Decimal(6, 2)), 10, 3, 1, 3, CAST(N'2017-04-27' AS Date), 2, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (3030301, CAST(1.00 AS Decimal(6, 2)), 10, 3, 1, 3, CAST(N'2017-04-27' AS Date), 3, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (3030401, CAST(1.00 AS Decimal(6, 2)), 10, 3, 1, 3, CAST(N'2017-04-27' AS Date), 4, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (3030501, CAST(1.00 AS Decimal(6, 2)), 10, 3, 1, 3, CAST(N'2017-04-27' AS Date), 5, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (3030601, CAST(1.00 AS Decimal(6, 2)), 10, 3, 1, 3, CAST(N'2017-04-27' AS Date), 6, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (3030701, CAST(1.00 AS Decimal(6, 2)), 10, 3, 1, 3, CAST(N'2017-04-27' AS Date), 7, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (3030801, CAST(1.00 AS Decimal(6, 2)), 10, 3, 1, 3, CAST(N'2017-04-27' AS Date), 8, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (3030901, CAST(1.00 AS Decimal(6, 2)), 10, 3, 1, 3, CAST(N'2017-04-27' AS Date), 9, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (4040105, CAST(1.00 AS Decimal(6, 2)), 10, 4, 1, 4, CAST(N'2017-04-27' AS Date), 1, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (4040205, CAST(1.00 AS Decimal(6, 2)), 10, 4, 1, 4, CAST(N'2017-04-27' AS Date), 2, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (4040305, CAST(1.00 AS Decimal(6, 2)), 10, 4, 1, 4, CAST(N'2017-04-27' AS Date), 3, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (4040405, CAST(1.00 AS Decimal(6, 2)), 10, 4, 1, 4, CAST(N'2017-04-27' AS Date), 4, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (4040505, CAST(1.00 AS Decimal(6, 2)), 10, 4, 1, 4, CAST(N'2017-04-27' AS Date), 5, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (4040605, CAST(1.00 AS Decimal(6, 2)), 10, 4, 1, 4, CAST(N'2017-04-27' AS Date), 6, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (4040705, CAST(1.00 AS Decimal(6, 2)), 10, 4, 1, 4, CAST(N'2017-04-27' AS Date), 7, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (4040805, CAST(1.00 AS Decimal(6, 2)), 10, 4, 1, 4, CAST(N'2017-04-27' AS Date), 8, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (4040905, CAST(1.00 AS Decimal(6, 2)), 10, 4, 1, 4, CAST(N'2017-04-27' AS Date), 9, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050101, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 1, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050103, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 1, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050104, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 1, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050105, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 1, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050106, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 1, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050107, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 1, 7)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050108, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 1, 8)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050201, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 2, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050203, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 2, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050204, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 2, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050205, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 2, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050206, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 2, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050207, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 2, 7)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050208, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 2, 8)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050301, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 3, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050303, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 3, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050304, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 3, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050305, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 3, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050306, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 3, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050307, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 3, 7)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050308, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 3, 8)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050401, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 4, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050403, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 4, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050404, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 4, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050405, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 4, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050406, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 4, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050407, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 4, 7)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050408, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 4, 8)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050501, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 5, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050503, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 5, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050504, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 5, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050505, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 5, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050506, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 5, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050507, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 5, 7)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050508, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 5, 8)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050601, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 6, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050603, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 6, 3)
GO
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050604, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 6, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050605, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 6, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050606, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 6, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050607, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 6, 7)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050608, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 6, 8)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050701, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 7, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050703, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 7, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050704, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 7, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050705, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 7, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050706, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 7, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050707, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 7, 7)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050708, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 7, 8)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050801, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 8, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050803, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 8, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050804, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 8, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050805, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 8, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050806, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 8, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050807, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 8, 7)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050808, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 8, 8)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050901, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 9, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050903, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 9, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050904, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 9, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050905, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 9, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050906, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 9, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050907, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 9, 7)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (5050908, CAST(1.00 AS Decimal(6, 2)), 10, 5, 1, 5, CAST(N'2017-04-27' AS Date), 9, 8)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010101, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 1, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010103, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 1, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010105, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 1, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010109, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 1, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010201, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 2, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010203, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 2, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010205, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 2, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010209, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 2, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010301, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 3, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010303, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 3, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010305, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 3, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010309, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 3, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010401, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 4, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010403, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 4, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010405, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 4, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010409, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 4, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010501, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 5, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010503, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 5, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010505, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 5, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010509, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 5, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010601, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 6, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010603, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 6, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010605, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 6, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010609, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 6, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010701, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 7, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010703, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 7, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010705, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 7, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010709, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 7, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010801, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 8, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010803, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 8, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010805, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 8, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010809, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 8, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010901, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 9, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010903, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 9, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010905, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 9, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (6010909, CAST(1.00 AS Decimal(6, 2)), 10, 6, 1, 1, CAST(N'2017-04-27' AS Date), 9, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060101, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 1, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060103, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 1, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060105, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 1, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060110, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 1, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060201, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 2, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060203, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 2, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060205, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 2, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060210, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 2, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060301, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 3, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060303, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 3, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060305, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 3, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060310, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 3, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060401, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 4, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060403, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 4, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060405, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 4, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060410, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 4, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060501, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 5, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060503, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 5, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060505, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 5, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060510, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 5, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060601, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 6, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060603, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 6, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060605, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 6, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060610, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 6, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060701, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 7, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060703, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 7, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060705, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 7, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060710, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 7, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060801, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 8, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060803, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 8, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060805, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 8, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060810, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 8, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060901, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 9, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060903, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 9, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060905, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 9, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (7060910, CAST(1.00 AS Decimal(6, 2)), 10, 7, 1, 6, CAST(N'2017-04-27' AS Date), 9, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020101, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 1, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020103, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 1, 3)
GO
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020110, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 1, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020201, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 2, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020203, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 2, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020210, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 2, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020301, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 3, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020303, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 3, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020310, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 3, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020401, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 4, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020403, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 4, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020410, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 4, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020501, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 5, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020503, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 5, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020510, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 5, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020601, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 6, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020603, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 6, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020610, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 6, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020701, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 7, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020703, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 7, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020710, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 7, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020801, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 8, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020803, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 8, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020810, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 8, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020901, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 9, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020903, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 9, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (8020910, CAST(1.00 AS Decimal(6, 2)), 10, 8, 1, 2, CAST(N'2017-04-27' AS Date), 9, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070101, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 1, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070102, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 1, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070106, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 1, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070201, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 2, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070202, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 2, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070206, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 2, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070301, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 3, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070302, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 3, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070306, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 3, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070401, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 4, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070402, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 4, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070406, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 4, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070501, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 5, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070502, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 5, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070506, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 5, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070601, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 6, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070602, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 6, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070606, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 6, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070701, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 7, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070702, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 7, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070706, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 7, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070801, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 8, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070802, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 8, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070806, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 8, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070901, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 9, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070902, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 9, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (9070906, CAST(1.00 AS Decimal(6, 2)), 10, 9, 1, 7, CAST(N'2017-04-27' AS Date), 9, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080102, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 1, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080104, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 1, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080105, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 1, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080110, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 1, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080202, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 2, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080204, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 2, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080205, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 2, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080210, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 2, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080302, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 3, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080304, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 3, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080305, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 3, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080310, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 3, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080402, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 4, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080404, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 4, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080405, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 4, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080410, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 4, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080502, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 5, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080504, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 5, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080505, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 5, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080510, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 5, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080602, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 6, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080604, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 6, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080605, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 6, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080610, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 6, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080702, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 7, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080704, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 7, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080705, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 7, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080710, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 7, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080802, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 8, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080804, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 8, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080805, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 8, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080810, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 8, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080902, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 9, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080904, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 9, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080905, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 9, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (10080910, CAST(1.00 AS Decimal(6, 2)), 10, 10, 1, 8, CAST(N'2017-04-27' AS Date), 9, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (11090101, CAST(1.00 AS Decimal(6, 2)), 10, 11, 1, 9, CAST(N'2017-04-27' AS Date), 1, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (11090109, CAST(1.00 AS Decimal(6, 2)), 10, 11, 1, 9, CAST(N'2017-04-27' AS Date), 1, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (11090201, CAST(1.00 AS Decimal(6, 2)), 10, 11, 1, 9, CAST(N'2017-04-27' AS Date), 2, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (11090209, CAST(1.00 AS Decimal(6, 2)), 10, 11, 1, 9, CAST(N'2017-04-27' AS Date), 2, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (11090301, CAST(1.00 AS Decimal(6, 2)), 10, 11, 1, 9, CAST(N'2017-04-27' AS Date), 3, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (11090309, CAST(1.00 AS Decimal(6, 2)), 10, 11, 1, 9, CAST(N'2017-04-27' AS Date), 3, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (11090401, CAST(1.00 AS Decimal(6, 2)), 10, 11, 1, 9, CAST(N'2017-04-27' AS Date), 4, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (11090409, CAST(1.00 AS Decimal(6, 2)), 10, 11, 1, 9, CAST(N'2017-04-27' AS Date), 4, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (11090501, CAST(1.00 AS Decimal(6, 2)), 10, 11, 1, 9, CAST(N'2017-04-27' AS Date), 5, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (11090509, CAST(1.00 AS Decimal(6, 2)), 10, 11, 1, 9, CAST(N'2017-04-27' AS Date), 5, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (11090601, CAST(1.00 AS Decimal(6, 2)), 10, 11, 1, 9, CAST(N'2017-04-27' AS Date), 6, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (11090609, CAST(1.00 AS Decimal(6, 2)), 10, 11, 1, 9, CAST(N'2017-04-27' AS Date), 6, 9)
GO
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (11090701, CAST(1.00 AS Decimal(6, 2)), 10, 11, 1, 9, CAST(N'2017-04-27' AS Date), 7, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (11090709, CAST(1.00 AS Decimal(6, 2)), 10, 11, 1, 9, CAST(N'2017-04-27' AS Date), 7, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (11090801, CAST(1.00 AS Decimal(6, 2)), 10, 11, 1, 9, CAST(N'2017-04-27' AS Date), 8, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (11090809, CAST(1.00 AS Decimal(6, 2)), 10, 11, 1, 9, CAST(N'2017-04-27' AS Date), 8, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (11090901, CAST(1.00 AS Decimal(6, 2)), 10, 11, 1, 9, CAST(N'2017-04-27' AS Date), 9, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (11090909, CAST(1.00 AS Decimal(6, 2)), 10, 11, 1, 9, CAST(N'2017-04-27' AS Date), 9, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090105, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 1, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090112, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 1, 12)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090113, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 1, 13)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090205, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 2, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090212, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 2, 12)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090213, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 2, 13)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090305, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 3, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090312, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 3, 12)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090313, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 3, 13)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090405, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 4, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090412, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 4, 12)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090413, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 4, 13)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090505, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 5, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090512, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 5, 12)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090513, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 5, 13)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090605, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 6, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090612, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 6, 12)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090613, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 6, 13)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090705, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 7, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090712, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 7, 12)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090713, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 7, 13)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090805, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 8, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090812, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 8, 12)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090813, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 8, 13)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090905, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 9, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090912, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 9, 12)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (12090913, CAST(1.00 AS Decimal(6, 2)), 10, 12, 1, 9, CAST(N'2017-04-27' AS Date), 9, 13)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090101, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 1, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090105, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 1, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090109, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 1, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090110, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 1, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090201, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 2, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090205, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 2, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090209, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 2, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090210, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 2, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090301, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 3, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090305, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 3, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090309, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 3, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090310, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 3, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090401, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 4, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090405, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 4, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090409, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 4, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090410, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 4, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090501, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 5, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090505, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 5, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090509, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 5, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090510, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 5, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090601, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 6, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090605, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 6, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090609, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 6, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090610, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 6, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090701, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 7, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090705, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 7, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090709, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 7, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090710, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 7, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090801, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 8, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090805, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 8, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090809, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 8, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090810, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 8, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090901, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 9, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090905, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 9, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090909, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 9, 9)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (13090910, CAST(1.00 AS Decimal(6, 2)), 10, 13, 1, 9, CAST(N'2017-04-27' AS Date), 9, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (14100106, CAST(1.00 AS Decimal(6, 2)), 10, 14, 1, 10, CAST(N'2017-04-27' AS Date), 1, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (14100206, CAST(1.00 AS Decimal(6, 2)), 10, 14, 1, 10, CAST(N'2017-04-27' AS Date), 2, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (14100306, CAST(1.00 AS Decimal(6, 2)), 10, 14, 1, 10, CAST(N'2017-04-27' AS Date), 3, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (14100406, CAST(1.00 AS Decimal(6, 2)), 10, 14, 1, 10, CAST(N'2017-04-27' AS Date), 4, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (14100506, CAST(1.00 AS Decimal(6, 2)), 10, 14, 1, 10, CAST(N'2017-04-27' AS Date), 5, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (14100606, CAST(1.00 AS Decimal(6, 2)), 10, 14, 1, 10, CAST(N'2017-04-27' AS Date), 6, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (14100706, CAST(1.00 AS Decimal(6, 2)), 10, 14, 1, 10, CAST(N'2017-04-27' AS Date), 7, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (14100806, CAST(1.00 AS Decimal(6, 2)), 10, 14, 1, 10, CAST(N'2017-04-27' AS Date), 8, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (14100906, CAST(1.00 AS Decimal(6, 2)), 10, 14, 1, 10, CAST(N'2017-04-27' AS Date), 9, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (15080104, CAST(1.00 AS Decimal(6, 2)), 10, 15, 1, 8, CAST(N'2017-04-27' AS Date), 1, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (15080111, CAST(1.00 AS Decimal(6, 2)), 10, 15, 1, 8, CAST(N'2017-04-27' AS Date), 1, 11)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (15080204, CAST(1.00 AS Decimal(6, 2)), 10, 15, 1, 8, CAST(N'2017-04-27' AS Date), 2, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (15080211, CAST(1.00 AS Decimal(6, 2)), 10, 15, 1, 8, CAST(N'2017-04-27' AS Date), 2, 11)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (15080304, CAST(1.00 AS Decimal(6, 2)), 10, 15, 1, 8, CAST(N'2017-04-27' AS Date), 3, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (15080311, CAST(1.00 AS Decimal(6, 2)), 10, 15, 1, 8, CAST(N'2017-04-27' AS Date), 3, 11)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (15080404, CAST(1.00 AS Decimal(6, 2)), 10, 15, 1, 8, CAST(N'2017-04-27' AS Date), 4, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (15080411, CAST(1.00 AS Decimal(6, 2)), 10, 15, 1, 8, CAST(N'2017-04-27' AS Date), 4, 11)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (15080504, CAST(1.00 AS Decimal(6, 2)), 10, 15, 1, 8, CAST(N'2017-04-27' AS Date), 5, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (15080511, CAST(1.00 AS Decimal(6, 2)), 10, 15, 1, 8, CAST(N'2017-04-27' AS Date), 5, 11)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (15080604, CAST(1.00 AS Decimal(6, 2)), 10, 15, 1, 8, CAST(N'2017-04-27' AS Date), 6, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (15080611, CAST(1.00 AS Decimal(6, 2)), 10, 15, 1, 8, CAST(N'2017-04-27' AS Date), 6, 11)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (15080704, CAST(1.00 AS Decimal(6, 2)), 10, 15, 1, 8, CAST(N'2017-04-27' AS Date), 7, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (15080711, CAST(1.00 AS Decimal(6, 2)), 10, 15, 1, 8, CAST(N'2017-04-27' AS Date), 7, 11)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (15080804, CAST(1.00 AS Decimal(6, 2)), 10, 15, 1, 8, CAST(N'2017-04-27' AS Date), 8, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (15080811, CAST(1.00 AS Decimal(6, 2)), 10, 15, 1, 8, CAST(N'2017-04-27' AS Date), 8, 11)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (15080904, CAST(1.00 AS Decimal(6, 2)), 10, 15, 1, 8, CAST(N'2017-04-27' AS Date), 9, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (15080911, CAST(1.00 AS Decimal(6, 2)), 10, 15, 1, 8, CAST(N'2017-04-27' AS Date), 9, 11)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110101, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 1, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110103, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 1, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110105, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 1, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110110, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 1, 10)
GO
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110201, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 2, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110203, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 2, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110205, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 2, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110210, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 2, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110301, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 3, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110303, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 3, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110305, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 3, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110310, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 3, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110401, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 4, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110403, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 4, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110405, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 4, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110410, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 4, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110501, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 5, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110503, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 5, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110505, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 5, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110510, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 5, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110601, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 6, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110603, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 6, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110605, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 6, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110610, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 6, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110701, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 7, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110703, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 7, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110705, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 7, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110710, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 7, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110801, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 8, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110803, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 8, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110805, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 8, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110810, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 8, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110901, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 9, 1)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110903, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 9, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110905, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 9, 5)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (16110910, CAST(1.00 AS Decimal(6, 2)), 10, 16, 1, 11, CAST(N'2017-04-27' AS Date), 9, 10)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120103, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 1, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120104, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 1, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120106, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 1, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120203, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 2, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120204, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 2, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120206, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 2, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120303, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 3, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120304, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 3, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120306, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 3, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120403, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 4, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120404, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 4, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120406, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 4, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120503, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 5, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120504, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 5, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120506, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 5, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120603, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 6, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120604, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 6, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120606, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 6, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120703, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 7, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120704, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 7, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120706, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 7, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120803, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 8, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120804, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 8, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120806, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 8, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120903, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 9, 3)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120904, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 9, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (17120906, CAST(1.00 AS Decimal(6, 2)), 10, 17, 1, 12, CAST(N'2017-04-27' AS Date), 9, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (18130112, CAST(1.00 AS Decimal(6, 2)), 10, 18, 1, 13, CAST(N'2017-04-27' AS Date), 1, 12)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (18130113, CAST(1.00 AS Decimal(6, 2)), 10, 18, 1, 13, CAST(N'2017-04-27' AS Date), 1, 13)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (18130212, CAST(1.00 AS Decimal(6, 2)), 10, 18, 1, 13, CAST(N'2017-04-27' AS Date), 2, 12)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (18130213, CAST(1.00 AS Decimal(6, 2)), 10, 18, 1, 13, CAST(N'2017-04-27' AS Date), 2, 13)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (18130312, CAST(1.00 AS Decimal(6, 2)), 10, 18, 1, 13, CAST(N'2017-04-27' AS Date), 3, 12)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (18130313, CAST(1.00 AS Decimal(6, 2)), 10, 18, 1, 13, CAST(N'2017-04-27' AS Date), 3, 13)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (18130412, CAST(1.00 AS Decimal(6, 2)), 10, 18, 1, 13, CAST(N'2017-04-27' AS Date), 4, 12)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (18130413, CAST(1.00 AS Decimal(6, 2)), 10, 18, 1, 13, CAST(N'2017-04-27' AS Date), 4, 13)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (18130512, CAST(1.00 AS Decimal(6, 2)), 10, 18, 1, 13, CAST(N'2017-04-27' AS Date), 5, 12)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (18130513, CAST(1.00 AS Decimal(6, 2)), 10, 18, 1, 13, CAST(N'2017-04-27' AS Date), 5, 13)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (18130612, CAST(1.00 AS Decimal(6, 2)), 10, 18, 1, 13, CAST(N'2017-04-27' AS Date), 6, 12)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (18130613, CAST(1.00 AS Decimal(6, 2)), 10, 18, 1, 13, CAST(N'2017-04-27' AS Date), 6, 13)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (18130712, CAST(1.00 AS Decimal(6, 2)), 10, 18, 1, 13, CAST(N'2017-04-27' AS Date), 7, 12)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (18130713, CAST(1.00 AS Decimal(6, 2)), 10, 18, 1, 13, CAST(N'2017-04-27' AS Date), 7, 13)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (18130812, CAST(1.00 AS Decimal(6, 2)), 10, 18, 1, 13, CAST(N'2017-04-27' AS Date), 8, 12)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (18130813, CAST(1.00 AS Decimal(6, 2)), 10, 18, 1, 13, CAST(N'2017-04-27' AS Date), 8, 13)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (18130912, CAST(1.00 AS Decimal(6, 2)), 10, 18, 1, 13, CAST(N'2017-04-27' AS Date), 9, 12)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (18130913, CAST(1.00 AS Decimal(6, 2)), 10, 18, 1, 13, CAST(N'2017-04-27' AS Date), 9, 13)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (19140104, CAST(1.00 AS Decimal(6, 2)), 10, 19, 1, 14, CAST(N'2017-04-27' AS Date), 1, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (19140204, CAST(1.00 AS Decimal(6, 2)), 10, 19, 1, 14, CAST(N'2017-04-27' AS Date), 2, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (19140304, CAST(1.00 AS Decimal(6, 2)), 10, 19, 1, 14, CAST(N'2017-04-27' AS Date), 3, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (19140404, CAST(1.00 AS Decimal(6, 2)), 10, 19, 1, 14, CAST(N'2017-04-27' AS Date), 4, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (19140504, CAST(1.00 AS Decimal(6, 2)), 10, 19, 1, 14, CAST(N'2017-04-27' AS Date), 5, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (19140604, CAST(1.00 AS Decimal(6, 2)), 10, 19, 1, 14, CAST(N'2017-04-27' AS Date), 6, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (19140704, CAST(1.00 AS Decimal(6, 2)), 10, 19, 1, 14, CAST(N'2017-04-27' AS Date), 7, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (19140804, CAST(1.00 AS Decimal(6, 2)), 10, 19, 1, 14, CAST(N'2017-04-27' AS Date), 8, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (19140904, CAST(1.00 AS Decimal(6, 2)), 10, 19, 1, 14, CAST(N'2017-04-27' AS Date), 9, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080102, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 1, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080104, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 1, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080106, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 1, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080202, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 2, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080204, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 2, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080206, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 2, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080302, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 3, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080304, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 3, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080306, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 3, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080402, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 4, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080404, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 4, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080406, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 4, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080502, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 5, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080504, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 5, 4)
GO
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080506, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 5, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080602, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 6, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080604, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 6, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080606, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 6, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080702, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 7, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080704, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 7, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080706, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 7, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080802, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 8, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080804, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 8, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080806, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 8, 6)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080902, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 9, 2)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080904, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 9, 4)
INSERT [dbo].[Produkteinkauf] ([EinkaufID], [Einkaufspreis], [Menge], [ProduktNr], [MitarbeiterNr], [LieferantNr], [Datum], [GroessenNr], [FarbNr]) VALUES (20080906, CAST(1.00 AS Decimal(6, 2)), 10, 20, 1, 8, CAST(N'2017-04-27' AS Date), 9, 6)
INSERT [dbo].[Produktverkauf] ([VerkaufID], [Rechnungsposition], [RechnungsNr], [Betrag], [Rabatt], [Menge], [ProduktNr], [MitarbeiterNr], [GroessenNr], [FarbNr]) VALUES (1, 1, 1, CAST(79.95 AS Decimal(6, 2)), NULL, 1, 14, 1, 5, 6)
INSERT [dbo].[Produktverkauf] ([VerkaufID], [Rechnungsposition], [RechnungsNr], [Betrag], [Rabatt], [Menge], [ProduktNr], [MitarbeiterNr], [GroessenNr], [FarbNr]) VALUES (2, 1, 2, CAST(9.95 AS Decimal(6, 2)), NULL, 10, 5, 1, 6, 3)
INSERT [dbo].[Produktverkauf] ([VerkaufID], [Rechnungsposition], [RechnungsNr], [Betrag], [Rabatt], [Menge], [ProduktNr], [MitarbeiterNr], [GroessenNr], [FarbNr]) VALUES (3, 2, 2, CAST(9.95 AS Decimal(6, 2)), NULL, 10, 5, 1, 6, 1)
INSERT [dbo].[Produktverkauf] ([VerkaufID], [Rechnungsposition], [RechnungsNr], [Betrag], [Rabatt], [Menge], [ProduktNr], [MitarbeiterNr], [GroessenNr], [FarbNr]) VALUES (4, 3, 2, CAST(9.95 AS Decimal(6, 2)), NULL, 10, 5, 1, 6, 6)
INSERT [dbo].[Produktverkauf] ([VerkaufID], [Rechnungsposition], [RechnungsNr], [Betrag], [Rabatt], [Menge], [ProduktNr], [MitarbeiterNr], [GroessenNr], [FarbNr]) VALUES (5, 1, 3, CAST(89.95 AS Decimal(6, 2)), NULL, 1, 4, 1, 5, 5)
INSERT [dbo].[Produktverkauf] ([VerkaufID], [Rechnungsposition], [RechnungsNr], [Betrag], [Rabatt], [Menge], [ProduktNr], [MitarbeiterNr], [GroessenNr], [FarbNr]) VALUES (6, 2, 3, CAST(19.95 AS Decimal(6, 2)), NULL, 1, NULL, 1, 4, 4)
INSERT [dbo].[Produktverkauf] ([VerkaufID], [Rechnungsposition], [RechnungsNr], [Betrag], [Rabatt], [Menge], [ProduktNr], [MitarbeiterNr], [GroessenNr], [FarbNr]) VALUES (7, 1, 4, CAST(29.90 AS Decimal(6, 2)), NULL, 1, NULL, 1, 2, 4)
INSERT [dbo].[Produktverkauf] ([VerkaufID], [Rechnungsposition], [RechnungsNr], [Betrag], [Rabatt], [Menge], [ProduktNr], [MitarbeiterNr], [GroessenNr], [FarbNr]) VALUES (8, 2, 4, CAST(17.95 AS Decimal(6, 2)), NULL, 1, NULL, 1, 3, 5)
INSERT [dbo].[Produktverkauf] ([VerkaufID], [Rechnungsposition], [RechnungsNr], [Betrag], [Rabatt], [Menge], [ProduktNr], [MitarbeiterNr], [GroessenNr], [FarbNr]) VALUES (9, 1, 3, CAST(49.95 AS Decimal(6, 2)), NULL, 1, NULL, 1, 5, 4)
INSERT [dbo].[Produktverkauf] ([VerkaufID], [Rechnungsposition], [RechnungsNr], [Betrag], [Rabatt], [Menge], [ProduktNr], [MitarbeiterNr], [GroessenNr], [FarbNr]) VALUES (10, 1, 3, CAST(39.95 AS Decimal(6, 2)), NULL, 1, NULL, 1, 4, 4)
INSERT [dbo].[Produktverkauf] ([VerkaufID], [Rechnungsposition], [RechnungsNr], [Betrag], [Rabatt], [Menge], [ProduktNr], [MitarbeiterNr], [GroessenNr], [FarbNr]) VALUES (11, 1, 3, CAST(79.95 AS Decimal(6, 2)), NULL, 1, NULL, 1, 4, 5)
INSERT [dbo].[Rechnungen] ([RechnungsID], [Datum]) VALUES (1, CAST(N'2017-04-25' AS Date))
INSERT [dbo].[Rechnungen] ([RechnungsID], [Datum]) VALUES (2, CAST(N'2017-04-26' AS Date))
INSERT [dbo].[Rechnungen] ([RechnungsID], [Datum]) VALUES (3, CAST(N'2017-04-26' AS Date))
INSERT [dbo].[Rechnungen] ([RechnungsID], [Datum]) VALUES (4, CAST(N'2017-04-27' AS Date))
INSERT [dbo].[Rechnungen] ([RechnungsID], [Datum]) VALUES (5, CAST(N'2017-04-27' AS Date))
INSERT [dbo].[top10] ([Produktdetail], [marke], [zielgruppe], [kategorie], [verkaufspreis], [groesse]) VALUES (N'Nike T-Shirt: 100% Baumwolle, fällt groß aus', N'Nike', N'Männer', N'T-Shirt', CAST(19.95 AS Decimal(6, 2)), N'XS (39)')
INSERT [dbo].[top10] ([Produktdetail], [marke], [zielgruppe], [kategorie], [verkaufspreis], [groesse]) VALUES (N'Nike T-Shirt: 100% Baumwolle, fällt groß aus', N'Nike', N'Männer', N'T-Shirt', CAST(19.95 AS Decimal(6, 2)), N'S (40)')
INSERT [dbo].[top10] ([Produktdetail], [marke], [zielgruppe], [kategorie], [verkaufspreis], [groesse]) VALUES (N'Nike T-Shirt: 100% Baumwolle, fällt groß aus', N'Nike', N'Männer', N'T-Shirt', CAST(19.95 AS Decimal(6, 2)), N'M (41)')
INSERT [dbo].[top10] ([Produktdetail], [marke], [zielgruppe], [kategorie], [verkaufspreis], [groesse]) VALUES (N'Nike T-Shirt: 100% Baumwolle, fällt groß aus', N'Nike', N'Männer', N'T-Shirt', CAST(19.95 AS Decimal(6, 2)), N'L (42)')
INSERT [dbo].[top10] ([Produktdetail], [marke], [zielgruppe], [kategorie], [verkaufspreis], [groesse]) VALUES (N'Nike T-Shirt: 100% Baumwolle, fällt groß aus', N'Nike', N'Männer', N'T-Shirt', CAST(19.95 AS Decimal(6, 2)), N'XL (43)')
INSERT [dbo].[top10] ([Produktdetail], [marke], [zielgruppe], [kategorie], [verkaufspreis], [groesse]) VALUES (N'Nike T-Shirt: 100% Baumwolle, fällt groß aus', N'Nike', N'Männer', N'T-Shirt', CAST(19.95 AS Decimal(6, 2)), N'XXL (44)')
INSERT [dbo].[top10] ([Produktdetail], [marke], [zielgruppe], [kategorie], [verkaufspreis], [groesse]) VALUES (N'Nike T-Shirt: 100% Baumwolle, fällt groß aus', N'Nike', N'Männer', N'T-Shirt', CAST(19.95 AS Decimal(6, 2)), N'3XL (45)')
INSERT [dbo].[top10] ([Produktdetail], [marke], [zielgruppe], [kategorie], [verkaufspreis], [groesse]) VALUES (N'Nike T-Shirt: 100% Baumwolle, fällt groß aus', N'Nike', N'Männer', N'T-Shirt', CAST(19.95 AS Decimal(6, 2)), N'4XL (46)')
INSERT [dbo].[top10] ([Produktdetail], [marke], [zielgruppe], [kategorie], [verkaufspreis], [groesse]) VALUES (N'Nike T-Shirt: 100% Baumwolle, fällt groß aus', N'Nike', N'Männer', N'T-Shirt', CAST(19.95 AS Decimal(6, 2)), N'5XL (47)')
INSERT [dbo].[top10] ([Produktdetail], [marke], [zielgruppe], [kategorie], [verkaufspreis], [groesse]) VALUES (N'Puma T-Shirt: 100% Polyester, fällt normal aus', N'Puma', N'Männer', N'T-Shirt', CAST(19.95 AS Decimal(6, 2)), N'XS (39)')
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (1, 1, CAST(39.95 AS Decimal(6, 2)), 69, 47)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (2, 1, CAST(49.95 AS Decimal(6, 2)), 69, 47)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (3, 1, CAST(29.95 AS Decimal(6, 2)), 67, 45)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (4, 1, CAST(89.95 AS Decimal(6, 2)), 67, 45)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (5, 1, CAST(9.95 AS Decimal(6, 2)), 67, 45)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (6, 1, CAST(69.95 AS Decimal(6, 2)), 69, 47)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (7, 1, CAST(129.95 AS Decimal(6, 2)), 64, 42)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (8, 1, CAST(39.95 AS Decimal(6, 2)), 84, 47)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (9, 1, CAST(19.95 AS Decimal(6, 2)), 82, 45)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (10, 1, CAST(29.90 AS Decimal(6, 2)), 57, 30)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (11, 1, CAST(49.50 AS Decimal(6, 2)), 54, 27)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (12, 1, CAST(29.95 AS Decimal(6, 2)), 54, 27)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (13, 1, CAST(17.95 AS Decimal(6, 2)), 54, 27)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (14, 1, CAST(79.95 AS Decimal(6, 2)), 67, 45)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (15, 1, CAST(24.95 AS Decimal(6, 2)), 57, 30)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (16, 1, CAST(199.95 AS Decimal(6, 2)), 57, 30)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (17, 1, CAST(79.95 AS Decimal(6, 2)), 64, 42)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (18, 1, CAST(49.95 AS Decimal(6, 2)), 88, 45)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (19, 1, CAST(49.95 AS Decimal(6, 2)), 57, 30)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (20, 1, CAST(29.95 AS Decimal(6, 2)), 57, 30)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (1, 2, CAST(39.95 AS Decimal(6, 2)), 72, 50)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (2, 2, CAST(49.95 AS Decimal(6, 2)), 72, 50)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (3, 2, CAST(29.95 AS Decimal(6, 2)), 70, 48)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (4, 2, CAST(89.95 AS Decimal(6, 2)), 70, 48)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (5, 2, CAST(9.95 AS Decimal(6, 2)), 70, 48)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (6, 2, CAST(69.95 AS Decimal(6, 2)), 72, 50)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (7, 2, CAST(129.95 AS Decimal(6, 2)), 67, 45)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (8, 2, CAST(39.95 AS Decimal(6, 2)), 87, 50)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (9, 2, CAST(19.95 AS Decimal(6, 2)), 85, 48)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (10, 2, CAST(29.90 AS Decimal(6, 2)), 60, 33)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (11, 2, CAST(49.50 AS Decimal(6, 2)), 57, 30)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (12, 2, CAST(29.95 AS Decimal(6, 2)), 57, 30)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (13, 2, CAST(17.95 AS Decimal(6, 2)), 57, 30)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (14, 2, CAST(79.95 AS Decimal(6, 2)), 70, 48)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (15, 2, CAST(24.95 AS Decimal(6, 2)), 60, 33)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (16, 2, CAST(199.95 AS Decimal(6, 2)), 60, 33)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (17, 2, CAST(79.95 AS Decimal(6, 2)), 67, 45)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (18, 2, CAST(49.95 AS Decimal(6, 2)), 88, 48)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (19, 2, CAST(49.95 AS Decimal(6, 2)), 60, 33)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (20, 2, CAST(29.95 AS Decimal(6, 2)), 60, 33)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (1, 3, CAST(39.95 AS Decimal(6, 2)), 75, 52)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (2, 3, CAST(49.95 AS Decimal(6, 2)), 75, 52)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (3, 3, CAST(29.95 AS Decimal(6, 2)), 73, 50)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (4, 3, CAST(89.95 AS Decimal(6, 2)), 73, 50)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (5, 3, CAST(9.95 AS Decimal(6, 2)), 73, 50)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (6, 3, CAST(69.95 AS Decimal(6, 2)), 75, 52)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (7, 3, CAST(129.95 AS Decimal(6, 2)), 70, 47)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (8, 3, CAST(39.95 AS Decimal(6, 2)), 90, 52)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (9, 3, CAST(19.95 AS Decimal(6, 2)), 88, 50)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (10, 3, CAST(29.90 AS Decimal(6, 2)), 63, 35)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (11, 3, CAST(49.50 AS Decimal(6, 2)), 60, 32)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (12, 3, CAST(29.95 AS Decimal(6, 2)), 60, 32)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (13, 3, CAST(17.95 AS Decimal(6, 2)), 60, 32)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (14, 3, CAST(79.95 AS Decimal(6, 2)), 73, 50)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (15, 3, CAST(24.95 AS Decimal(6, 2)), 63, 35)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (16, 3, CAST(199.95 AS Decimal(6, 2)), 63, 35)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (17, 3, CAST(79.95 AS Decimal(6, 2)), 70, 47)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (18, 3, CAST(49.95 AS Decimal(6, 2)), 88, 50)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (19, 3, CAST(49.95 AS Decimal(6, 2)), 63, 35)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (20, 3, CAST(29.95 AS Decimal(6, 2)), 63, 35)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (1, 4, CAST(39.95 AS Decimal(6, 2)), 77, 54)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (2, 4, CAST(49.95 AS Decimal(6, 2)), 77, 54)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (3, 4, CAST(29.95 AS Decimal(6, 2)), 75, 52)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (4, 4, CAST(89.95 AS Decimal(6, 2)), 75, 52)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (5, 4, CAST(9.95 AS Decimal(6, 2)), 75, 52)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (6, 4, CAST(69.95 AS Decimal(6, 2)), 77, 54)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (7, 4, CAST(129.95 AS Decimal(6, 2)), 72, 49)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (8, 4, CAST(39.95 AS Decimal(6, 2)), 92, 54)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (9, 4, CAST(19.95 AS Decimal(6, 2)), 90, 52)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (10, 4, CAST(29.90 AS Decimal(6, 2)), 65, 37)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (11, 4, CAST(49.50 AS Decimal(6, 2)), 62, 34)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (12, 4, CAST(29.95 AS Decimal(6, 2)), 62, 34)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (13, 4, CAST(17.95 AS Decimal(6, 2)), 62, 34)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (14, 4, CAST(79.95 AS Decimal(6, 2)), 75, 52)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (15, 4, CAST(24.95 AS Decimal(6, 2)), 65, 37)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (16, 4, CAST(199.95 AS Decimal(6, 2)), 65, 37)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (17, 4, CAST(79.95 AS Decimal(6, 2)), 72, 49)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (18, 4, CAST(49.95 AS Decimal(6, 2)), 88, 52)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (19, 4, CAST(49.95 AS Decimal(6, 2)), 65, 37)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (20, 4, CAST(29.95 AS Decimal(6, 2)), 65, 37)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (1, 5, CAST(39.95 AS Decimal(6, 2)), 79, 56)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (2, 5, CAST(49.95 AS Decimal(6, 2)), 79, 56)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (3, 5, CAST(29.95 AS Decimal(6, 2)), 77, 54)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (4, 5, CAST(89.95 AS Decimal(6, 2)), 77, 54)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (5, 5, CAST(9.95 AS Decimal(6, 2)), 77, 54)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (6, 5, CAST(69.95 AS Decimal(6, 2)), 79, 56)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (7, 5, CAST(129.95 AS Decimal(6, 2)), 74, 51)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (8, 5, CAST(39.95 AS Decimal(6, 2)), 94, 56)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (9, 5, CAST(19.95 AS Decimal(6, 2)), 92, 54)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (10, 5, CAST(29.90 AS Decimal(6, 2)), 67, 39)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (11, 5, CAST(49.50 AS Decimal(6, 2)), 64, 36)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (12, 5, CAST(29.95 AS Decimal(6, 2)), 64, 36)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (13, 5, CAST(17.95 AS Decimal(6, 2)), 64, 36)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (14, 5, CAST(79.95 AS Decimal(6, 2)), 77, 54)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (15, 5, CAST(24.95 AS Decimal(6, 2)), 67, 39)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (16, 5, CAST(199.95 AS Decimal(6, 2)), 67, 39)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (17, 5, CAST(79.95 AS Decimal(6, 2)), 74, 51)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (18, 5, CAST(49.95 AS Decimal(6, 2)), 88, 54)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (19, 5, CAST(49.95 AS Decimal(6, 2)), 67, 39)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (20, 5, CAST(29.95 AS Decimal(6, 2)), 67, 39)
GO
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (1, 6, CAST(39.95 AS Decimal(6, 2)), 81, 60)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (2, 6, CAST(49.95 AS Decimal(6, 2)), 81, 60)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (3, 6, CAST(29.95 AS Decimal(6, 2)), 79, 58)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (4, 6, CAST(89.95 AS Decimal(6, 2)), 79, 58)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (5, 6, CAST(9.95 AS Decimal(6, 2)), 79, 58)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (6, 6, CAST(69.95 AS Decimal(6, 2)), 81, 60)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (7, 6, CAST(129.95 AS Decimal(6, 2)), 76, 55)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (8, 6, CAST(39.95 AS Decimal(6, 2)), 96, 60)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (9, 6, CAST(19.95 AS Decimal(6, 2)), 94, 58)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (10, 6, CAST(29.90 AS Decimal(6, 2)), 69, 43)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (11, 6, CAST(49.50 AS Decimal(6, 2)), 66, 40)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (12, 6, CAST(29.95 AS Decimal(6, 2)), 66, 40)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (13, 6, CAST(17.95 AS Decimal(6, 2)), 66, 40)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (14, 6, CAST(79.95 AS Decimal(6, 2)), 79, 58)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (15, 6, CAST(24.95 AS Decimal(6, 2)), 69, 43)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (16, 6, CAST(199.95 AS Decimal(6, 2)), 69, 43)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (17, 6, CAST(79.95 AS Decimal(6, 2)), 76, 55)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (18, 6, CAST(49.95 AS Decimal(6, 2)), 88, 58)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (19, 6, CAST(49.95 AS Decimal(6, 2)), 69, 43)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (20, 6, CAST(29.95 AS Decimal(6, 2)), 69, 43)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (1, 7, CAST(39.95 AS Decimal(6, 2)), 84, 62)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (2, 7, CAST(49.95 AS Decimal(6, 2)), 84, 62)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (3, 7, CAST(29.95 AS Decimal(6, 2)), 82, 60)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (4, 7, CAST(89.95 AS Decimal(6, 2)), 82, 60)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (5, 7, CAST(9.95 AS Decimal(6, 2)), 82, 60)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (6, 7, CAST(69.95 AS Decimal(6, 2)), 84, 62)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (7, 7, CAST(129.95 AS Decimal(6, 2)), 79, 57)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (8, 7, CAST(39.95 AS Decimal(6, 2)), 99, 62)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (9, 7, CAST(19.95 AS Decimal(6, 2)), 97, 60)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (10, 7, CAST(29.90 AS Decimal(6, 2)), 72, 45)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (11, 7, CAST(49.50 AS Decimal(6, 2)), 69, 42)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (12, 7, CAST(29.95 AS Decimal(6, 2)), 69, 42)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (13, 7, CAST(17.95 AS Decimal(6, 2)), 69, 42)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (14, 7, CAST(79.95 AS Decimal(6, 2)), 82, 60)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (15, 7, CAST(24.95 AS Decimal(6, 2)), 72, 45)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (16, 7, CAST(199.95 AS Decimal(6, 2)), 72, 45)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (17, 7, CAST(79.95 AS Decimal(6, 2)), 79, 57)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (18, 7, CAST(49.95 AS Decimal(6, 2)), 88, 60)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (19, 7, CAST(49.95 AS Decimal(6, 2)), 72, 45)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (20, 7, CAST(29.95 AS Decimal(6, 2)), 72, 45)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (1, 8, CAST(39.95 AS Decimal(6, 2)), 86, 64)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (2, 8, CAST(49.95 AS Decimal(6, 2)), 86, 64)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (3, 8, CAST(29.95 AS Decimal(6, 2)), 84, 62)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (4, 8, CAST(89.95 AS Decimal(6, 2)), 84, 62)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (5, 8, CAST(9.95 AS Decimal(6, 2)), 84, 62)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (6, 8, CAST(69.95 AS Decimal(6, 2)), 86, 64)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (7, 8, CAST(129.95 AS Decimal(6, 2)), 81, 59)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (8, 8, CAST(39.95 AS Decimal(6, 2)), 101, 64)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (9, 8, CAST(19.95 AS Decimal(6, 2)), 99, 62)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (10, 8, CAST(29.90 AS Decimal(6, 2)), 74, 47)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (11, 8, CAST(49.50 AS Decimal(6, 2)), 71, 44)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (12, 8, CAST(29.95 AS Decimal(6, 2)), 71, 44)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (13, 8, CAST(17.95 AS Decimal(6, 2)), 71, 44)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (14, 8, CAST(79.95 AS Decimal(6, 2)), 84, 62)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (15, 8, CAST(24.95 AS Decimal(6, 2)), 74, 47)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (16, 8, CAST(199.95 AS Decimal(6, 2)), 74, 47)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (17, 8, CAST(79.95 AS Decimal(6, 2)), 81, 59)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (18, 8, CAST(49.95 AS Decimal(6, 2)), 88, 62)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (19, 8, CAST(49.95 AS Decimal(6, 2)), 74, 47)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (20, 8, CAST(29.95 AS Decimal(6, 2)), 74, 47)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (1, 9, CAST(39.95 AS Decimal(6, 2)), 88, 66)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (2, 9, CAST(49.95 AS Decimal(6, 2)), 88, 66)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (3, 9, CAST(29.95 AS Decimal(6, 2)), 86, 64)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (4, 9, CAST(89.95 AS Decimal(6, 2)), 86, 64)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (5, 9, CAST(9.95 AS Decimal(6, 2)), 86, 64)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (6, 9, CAST(69.95 AS Decimal(6, 2)), 88, 66)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (7, 9, CAST(129.95 AS Decimal(6, 2)), 83, 61)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (8, 9, CAST(39.95 AS Decimal(6, 2)), 103, 66)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (9, 9, CAST(19.95 AS Decimal(6, 2)), 101, 64)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (10, 9, CAST(29.90 AS Decimal(6, 2)), 76, 49)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (11, 9, CAST(49.50 AS Decimal(6, 2)), 73, 46)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (12, 9, CAST(29.95 AS Decimal(6, 2)), 73, 46)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (13, 9, CAST(17.95 AS Decimal(6, 2)), 73, 46)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (14, 9, CAST(79.95 AS Decimal(6, 2)), 86, 64)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (15, 9, CAST(24.95 AS Decimal(6, 2)), 76, 49)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (16, 9, CAST(199.95 AS Decimal(6, 2)), 76, 49)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (17, 9, CAST(79.95 AS Decimal(6, 2)), 83, 61)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (18, 9, CAST(49.95 AS Decimal(6, 2)), 88, 64)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (19, 9, CAST(49.95 AS Decimal(6, 2)), 76, 49)
INSERT [dbo].[Produktvarianten] ([ProduktNr], [GroessenNr], [Verkaufspreis], [Laenge], [Breite]) VALUES (20, 9, CAST(29.95 AS Decimal(6, 2)), 76, 49)
INSERT [dbo].[Zielgruppen] ([ZielgruppenID], [Name]) VALUES (1, N'Männer')
INSERT [dbo].[Zielgruppen] ([ZielgruppenID], [Name]) VALUES (2, N'Frauen')
INSERT [dbo].[Zielgruppen] ([ZielgruppenID], [Name]) VALUES (3, N'Jungen')
INSERT [dbo].[Zielgruppen] ([ZielgruppenID], [Name]) VALUES (4, N'Mädchen')
INSERT [dbo].[Zielgruppen] ([ZielgruppenID], [Name]) VALUES (5, N'Unisex Erw.')
INSERT [dbo].[Zielgruppen] ([ZielgruppenID], [Name]) VALUES (6, N'Unisex Kinder')
INSERT [dbo].[Zielgruppen] ([ZielgruppenID], [Name]) VALUES (7, N'Baby (m)')
INSERT [dbo].[Zielgruppen] ([ZielgruppenID], [Name]) VALUES (8, N'Baby (w)')
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
