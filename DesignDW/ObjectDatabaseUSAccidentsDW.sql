/****** Object:  Database USAccidentsDW    Script Date: 5/15/2025 10:58:31 AM ******/
/*
Kimball Group, The Microsoft Data Warehouse Toolkit
Generate a database from the datamodel worksheet, version: 4

You can use this Excel workbook as a data modeling tool during the logical design phase of your project.
As discussed in the book, it is in some ways preferable to a real data modeling tool during the inital design.
We expect you to move away from this spreadsheet and into a real modeling tool during the physical design phase.
The authors provide this macro so that the spreadsheet isn't a dead-end. You can 'import' into your
data modeling tool by generating a database using this script, then reverse-engineering that database into
your tool.

Uncomment the next lines if you want to drop and create the database
*/
/*
DROP DATABASE USAccidentsDW
GO
CREATE DATABASE USAccidentsDW
GO
ALTER DATABASE USAccidentsDW
SET RECOVERY SIMPLE
GO
*/
USE USAccidentsDW
;
IF EXISTS (SELECT Name from sys.extended_properties where Name = 'Description')
    EXEC sys.sp_dropextendedproperty @name = 'Description'
EXEC sys.sp_addextendedproperty @name = 'Description', @value = 'Default description - you should change this.'
;





/* Drop table dbo.DimDate */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimDate') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimDate 
;

/* Create table dbo.DimDate */
CREATE TABLE dbo.DimDate (
   [DateKey]  int   NOT NULL
,  [FullDate]  date  DEFAULT '0' NOT NULL
,  [Year]  int  DEFAULT 0 NOT NULL
,  [Quarter]  int  DEFAULT 0 NOT NULL
,  [Month]  int  DEFAULT 0 NOT NULL
,  [Day]  int  DEFAULT 0 NOT NULL
,  [Hour]  int  DEFAULT 0 NOT NULL
,  [Minute]  int  DEFAULT 0 NOT NULL
,  [Weekday]  int  DEFAULT 0 NOT NULL
, CONSTRAINT [PK_dbo.DimDate] PRIMARY KEY CLUSTERED 
( [DateKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Date', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Date dimension chứa một hàng cho mỗi ngày.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
;

INSERT INTO dbo.DimDate (DateKey, FullDate, Year, Quarter, Month, Day, Hour, Minute, Weekday)
VALUES (-1, '', 0, 0, 0, 0, 0, 0, 0)
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FullDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FullDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Quarter', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Month', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Month'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Day'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Hour', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Hour'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Minute', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Minute'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Weekday', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Weekday'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Khóa chính thay thế cho ngày và giờ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Ngày đầy đủ theo định dạng SQL', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FullDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Năm', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Quý trong năm (1 đến 4)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tháng trong năm (1 đến 12)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Month'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Ngày trong tháng (1 đến 31)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Day'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Giờ trong ngày (0 đến 23)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Hour'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Phút trong giờ (0 đến 59)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Minute'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Ngày trong tuần (1 đến 7)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Weekday'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'200411231301', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'11/23/2023', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FullDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'2000', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3, 4', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3, 4, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Month'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'12', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Day'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'13', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Hour'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'4', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Minute'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Weekday'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Month'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Day'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Hour'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Minute'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Weekday'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'In the form: yyyymmddhm', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FullDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Month'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Day'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Hour'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Minute'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Weekday'; 
;





/* Drop table dbo.DimLocation */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimLocation') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimLocation 
;

/* Create table dbo.DimLocation */
CREATE TABLE dbo.DimLocation (
   [LocationKey]  int IDENTITY  NOT NULL
,  [ID]  varchar(10)(10)   NOT NULL
,  [Number]  int   NOT NULL
,  [Street]  varchar(200)(200)   NOT NULL
,  [Side]  char(5)(5)   NOT NULL
,  [City]  varchar(200)(200)   NOT NULL
,  [County]  varchar(100)(100)   NOT NULL
,  [State]  varchar(100)(100)   NOT NULL
,  [Zipcode]  varchar(100)(100)   NOT NULL
,  [Country]  varchar(50)(50)   NOT NULL
, CONSTRAINT [PK_dbo.DimLocation] PRIMARY KEY CLUSTERED 
( [LocationKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimLocation
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Location', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimLocation
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Locations dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimLocation
;

SET IDENTITY_INSERT dbo.DimLocation ON
;
INSERT INTO dbo.DimLocation (LocationKey, ID, Number, Street, Side, City, County, State, Zipcode, Country)
VALUES (-1, '', NULL, '', '', '', '', '', '', '')
;
SET IDENTITY_INSERT dbo.DimLocation OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'LocationKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'LocationKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Number', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Number'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Street', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Street'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Side', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Side'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'City', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'City'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'County', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'County'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'State', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'State'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Zipcode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Zipcode'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Country', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'LocationKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Street name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Street'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'City name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'City'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of country', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'LocationKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'A-101', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'101', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Number'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'E 36th St', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Street'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'L, R', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Side'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Tulsa', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'City'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Tulsa', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'County'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'OK', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'State'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'64011', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Zipcode'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'US', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'LocationKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'LocationKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Number'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Street'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Side'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'City'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'County'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'State'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Zipcode'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Number'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Street'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Side'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'City'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'County'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'State'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Zipcode'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageLocation', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageLocation', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Number'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageLocation', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Street'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageLocation', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Side'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageLocation', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'City'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageLocation', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'County'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageLocation', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'State'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageLocation', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Zipcode'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageLocation', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Number', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Number'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Street', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Street'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Side', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Side'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'City', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'City'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'County', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'County'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'State', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'State'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Zipcode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Zipcode'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Country', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'LocationKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar(10)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Number'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar(200)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Street'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'char(5)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Side'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar(200)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'City'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar(100)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'County'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar(100)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'State'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar(100)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Zipcode'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'Country'; 
;





/* Drop table dbo.DimDriver */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimDriver') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimDriver 
;

/* Create table dbo.DimDriver */
CREATE TABLE dbo.DimDriver (
   [DriverKey]  int IDENTITY  NOT NULL
,  [ID]  varchar(10)   NOT NULL
,  [AgeBandofDriver]  varchar(10)   NULL
,  [SexofDriver]  varchar(10)   NULL
,  [DriverIMDDecile]  int   NULL
,  [DriverHomeAreaType]  varchar(50)   NULL
,  [JourneyPurposeofDriver]  varchar(255)   NULL
, CONSTRAINT [PK_dbo.DimDriver] PRIMARY KEY CLUSTERED 
( [DriverKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDriver
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Driver', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDriver
;

SET IDENTITY_INSERT dbo.DimDriver ON
;
INSERT INTO dbo.DimDriver (DriverKey, ID, AgeBandofDriver, SexofDriver, DriverIMDDecile, DriverHomeAreaType, JourneyPurposeofDriver)
VALUES (-1, '-1', 'None', 'None', None, '5/1/2000', '5/4/2000')
;
SET IDENTITY_INSERT dbo.DimDriver OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DriverKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'AgeBandofDriver', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'AgeBandofDriver'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SexofDriver', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'SexofDriver'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DriverIMDDecile', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverIMDDecile'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DriverHomeAreaType', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverHomeAreaType'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'JourneyPurposeofDriver', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'JourneyPurposeofDriver'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Age band of driver', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'AgeBandofDriver'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Sex of driver', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'SexofDriver'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Driver IMD Decile', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverIMDDecile'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Driver Home Area Type', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverHomeAreaType'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Journey Purpose of Driver', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'JourneyPurposeofDriver'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'A-101', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'26-35', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'AgeBandofDriver'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Male', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'SexofDriver'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'6, 10, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverIMDDecile'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Rural', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverHomeAreaType'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Journey as part of work', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'JourneyPurposeofDriver'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'AgeBandofDriver'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'SexofDriver'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverIMDDecile'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverHomeAreaType'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'JourneyPurposeofDriver'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'AgeBandofDriver'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'SexofDriver'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverIMDDecile'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverHomeAreaType'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'JourneyPurposeofDriver'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageVehicle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageVehicle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'AgeBandofDriver'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageVehicle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'SexofDriver'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageVehicle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverIMDDecile'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageVehicle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverHomeAreaType'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageVehicle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'JourneyPurposeofDriver'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'AgeBandofDriver', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'AgeBandofDriver'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'SexofDriver', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'SexofDriver'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DriverIMDDecile', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverIMDDecile'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DriverHomeAreaType', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverHomeAreaType'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'JourneyPurposeofDriver', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'JourneyPurposeofDriver'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'AgeBandofDriver'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'SexofDriver'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverIMDDecile'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'DriverHomeAreaType'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDriver', @level2type=N'COLUMN', @level2name=N'JourneyPurposeofDriver'; 
;





/* Drop table dbo.DimRoadType */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimRoadType') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimRoadType 
;

/* Create table dbo.DimRoadType */
CREATE TABLE dbo.DimRoadType (
   [RoadTypeKey]  int IDENTITY  NOT NULL
,  [ID]  varchar(10)   NULL
,  [RoadType]  varchar(50)   NULL
, CONSTRAINT [PK_dbo.DimRoadType] PRIMARY KEY CLUSTERED 
( [RoadTypeKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimRoadType
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoadType', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimRoadType
;

SET IDENTITY_INSERT dbo.DimRoadType ON
;
INSERT INTO dbo.DimRoadType (RoadTypeKey, ID, RoadType)
VALUES (-1, '-1', 'None')
;
SET IDENTITY_INSERT dbo.DimRoadType OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoadTypeKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'RoadTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoadType', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'RoadType'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'RoadTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Road type', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'RoadType'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'RoadTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'One way street', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'RoadType'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'RoadTypeKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'RoadTypeKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'RoadType'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'RoadType'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'RoadType'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'RoadType', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'RoadType'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadType', @level2type=N'COLUMN', @level2name=N'RoadType'; 
;





/* Drop table dbo.DimRoadFeature */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimRoadFeature') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimRoadFeature 
;

/* Create table dbo.DimRoadFeature */
CREATE TABLE dbo.DimRoadFeature (
   [RoadFeatureKey]  int IDENTITY  NOT NULL
,  [ID]  varchar(10)   NOT NULL
,  [Amenity]  bit   NULL
,  [Bump]  bit   NULL
,  [Crossing]  bit   NULL
,  [GiveWay]  bit   NULL
,  [Junction]  bit   NULL
,  [NoExit]  bit   NULL
,  [Railway]  bit   NULL
,  [Roundabout]  bit   NULL
,  [Station]  bit   NULL
,  [Stop]  bit   NULL
,  [TrafficCalming]  bit   NULL
,  [TrafficSignal]  bit   NULL
,  [TurningLoop]  bit   NULL
, CONSTRAINT [PK_dbo.DimRoadFeature] PRIMARY KEY CLUSTERED 
( [RoadFeatureKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimRoadFeature
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoadFeature', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimRoadFeature
;

SET IDENTITY_INSERT dbo.DimRoadFeature ON
;
INSERT INTO dbo.DimRoadFeature (RoadFeatureKey, ID, Amenity, Bump, Crossing, GiveWay, Junction, NoExit, Railway, Roundabout, Station, Stop, TrafficCalming, TrafficSignal, TurningLoop)
VALUES (-1, '-1', None, None, None, None, None, None, None, None, None, None, None, None, None)
;
SET IDENTITY_INSERT dbo.DimRoadFeature OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoadFeatureKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'RoadFeatureKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Amenity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Amenity'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Bump', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Bump'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Crossing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Crossing'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'GiveWay', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'GiveWay'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Junction', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Junction'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'NoExit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'NoExit'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Railway', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Railway'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Roundabout', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Roundabout'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Station', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Station'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Stop', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Stop'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TrafficCalming', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TrafficCalming'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TrafficSignal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TrafficSignal'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TurningLoop', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TurningLoop'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'RoadFeatureKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Có đặc điểm tiện ích (như cây xăng, cửa hàng, nhà hàng, khách sạn) gần vị trí tai nạn hay không', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Amenity'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Có đặc điểm gờ hay lồi trên đường gần vị trí tai nạn hay không', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Bump'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Có đặc điểm chỗ giao nhau (có hoặc không có đèn báo hiệu) gần vị trí tai nạn hay không', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Crossing'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Có đặc điểm đường ưu tiên (có hoặc không có biển báo) gần vị trí tai nạn hay không', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'GiveWay'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Có đặc điểm chỗ giao nhau (có hoặc không có đèn báo hiệu) gần vị trí tai nạn hay không', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Junction'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Có đặc điểm đường cụt gần vị trí tai nạn hay không', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'NoExit'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Có đường ray tàu gần vị trí tai nạn hay không', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Railway'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Có đặc điểm vòng xuyến gần vị trí tai nạn hay không', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Roundabout'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Có đặc điểm trạm xe buýt, trạm tàu điện ngầm gần vị trí tai nạn hay không', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Station'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Có đặc điểm bến xe, trạm xe buýt gần vị trí tai nạn hay không', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Stop'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Có đặc điểm chậm xe hay rào chắn gần vị trí tai nạn hay không', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TrafficCalming'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Có đèn báo hiệu gần vị trí tai nạn hay không', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TrafficSignal'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Có đặc điểm vòng xoay gần vị trí tai nạn hay không', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TurningLoop'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'RoadFeatureKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'A-101, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0, 1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Amenity'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0, 1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Bump'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0, 1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Crossing'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0, 1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'GiveWay'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0, 1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Junction'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0, 1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'NoExit'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0, 1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Railway'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0, 1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Roundabout'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0, 1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Station'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0, 1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Stop'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0, 1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TrafficCalming'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0, 1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TrafficSignal'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0, 1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TurningLoop'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'RoadFeatureKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'RoadFeatureKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Amenity'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Bump'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Crossing'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'GiveWay'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Junction'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'NoExit'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Railway'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Roundabout'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Station'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Stop'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TrafficCalming'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TrafficSignal'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TurningLoop'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Amenity'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Bump'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Crossing'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'GiveWay'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Junction'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'NoExit'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Railway'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Roundabout'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Station'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Stop'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TrafficCalming'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TrafficSignal'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TurningLoop'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Amenity'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Bump'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Crossing'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'GiveWay'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Junction'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'NoExit'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Railway'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Roundabout'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Station'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Stop'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TrafficCalming'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TrafficSignal'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TurningLoop'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Amenity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Amenity'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Bump', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Bump'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Crossing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Crossing'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'GiveWay', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'GiveWay'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Junction', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Junction'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'NoExit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'NoExit'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Railway', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Railway'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Roundabout', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Roundabout'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Station', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Station'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Stop', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Stop'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'TrafficCalming', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TrafficCalming'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'TrafficSignal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TrafficSignal'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'TurningLoop', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TurningLoop'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'bit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Amenity'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'bit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Bump'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'bit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Crossing'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'bit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'GiveWay'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'bit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Junction'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'bit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'NoExit'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'bit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Railway'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'bit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Roundabout'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'bit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Station'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'bit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'Stop'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'bit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TrafficCalming'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'bit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TrafficSignal'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'bit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadFeature', @level2type=N'COLUMN', @level2name=N'TurningLoop'; 
;





/* Drop table dbo.DimRoadSurfaceCondition */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimRoadSurfaceCondition') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimRoadSurfaceCondition 
;

/* Create table dbo.DimRoadSurfaceCondition */
CREATE TABLE dbo.DimRoadSurfaceCondition (
   [RoadSurfaceConditionKey]  int IDENTITY  NOT NULL
,  [ID]  varchar(10)   NOT NULL
,  [RoadSurfaceCondition]  varchar(50)   NOT NULL
, CONSTRAINT [PK_dbo.DimRoadSurfaceCondition] PRIMARY KEY CLUSTERED 
( [RoadSurfaceConditionKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimRoadSurfaceCondition
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoadSurfaceCondition', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimRoadSurfaceCondition
;

SET IDENTITY_INSERT dbo.DimRoadSurfaceCondition ON
;
INSERT INTO dbo.DimRoadSurfaceCondition (RoadSurfaceConditionKey, ID, RoadSurfaceCondition)
VALUES (-1, '-1', 'None')
;
SET IDENTITY_INSERT dbo.DimRoadSurfaceCondition OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoadSurfaceConditionKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'RoadSurfaceConditionKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoadSurfaceCondition', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'RoadSurfaceCondition'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'RoadSurfaceConditionKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Road surface condition', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'RoadSurfaceCondition'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'RoadSurfaceConditionKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'A-101, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Dry', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'RoadSurfaceCondition'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'RoadSurfaceConditionKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'RoadSurfaceConditionKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'RoadSurfaceCondition'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'RoadSurfaceCondition'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'RoadSurfaceCondition'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'RoadSurfaceCondition', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'RoadSurfaceCondition'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRoadSurfaceCondition', @level2type=N'COLUMN', @level2name=N'RoadSurfaceCondition'; 
;





/* Drop table dbo.DimSpeedLimit */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimSpeedLimit') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimSpeedLimit 
;

/* Create table dbo.DimSpeedLimit */
CREATE TABLE dbo.DimSpeedLimit (
   [SpeedLimitKey]  int IDENTITY  NOT NULL
,  [ID]  varchar(10)   NOT NULL
,  [SpeedLimit]  int   NOT NULL
, CONSTRAINT [PK_dbo.DimSpeedLimit] PRIMARY KEY CLUSTERED 
( [SpeedLimitKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimSpeedLimit
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SpeedLimit', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimSpeedLimit
;

SET IDENTITY_INSERT dbo.DimSpeedLimit ON
;
INSERT INTO dbo.DimSpeedLimit (SpeedLimitKey, ID, SpeedLimit)
VALUES (-1, '-1', None)
;
SET IDENTITY_INSERT dbo.DimSpeedLimit OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SpeedLimitKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'SpeedLimitKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SpeedLimit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'SpeedLimit'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'SpeedLimitKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Speed limit ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'SpeedLimit'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'SpeedLimitKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'A-101, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'SpeedLimitKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'SpeedLimitKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'SpeedLimit'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'SpeedLimit'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageRoad', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'SpeedLimit'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'SpeedLimit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'SpeedLimit'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimSpeedLimit', @level2type=N'COLUMN', @level2name=N'SpeedLimit'; 
;





/* Drop table dbo.DimTwilight */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimTwilight') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimTwilight 
;

/* Create table dbo.DimTwilight */
CREATE TABLE dbo.DimTwilight (
   [TwilightKey]  int IDENTITY  NOT NULL
,  [ID]  varchar(10)   NULL
,  [Sunrise_Sunset]  varchar(10)   NULL
,  [Civil_Twilight]  varchar(10)   NULL
,  [Nautical_Twilight]  varchar(10)   NULL
,  [Astronomical_Twilight]  varchar(10)   NULL
, CONSTRAINT [PK_dbo.DimTwilight] PRIMARY KEY CLUSTERED 
( [TwilightKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimTwilight
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Twilight', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimTwilight
;

SET IDENTITY_INSERT dbo.DimTwilight ON
;
INSERT INTO dbo.DimTwilight (TwilightKey, ID, Sunrise_Sunset, Civil_Twilight, Nautical_Twilight, Astronomical_Twilight)
VALUES (-1, '-1', 'None', 'None', 'None', 'None')
;
SET IDENTITY_INSERT dbo.DimTwilight OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TwilightKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'TwilightKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Sunrise_Sunset', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Sunrise_Sunset'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Civil_Twilight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Civil_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Nautical_Twilight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Nautical_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Astronomical_Twilight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Astronomical_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'TwilightKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Sunrise, Sunset', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Sunrise_Sunset'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Civil Twilight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Civil_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Nautical Twilight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Nautical_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Astronomical', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Astronomical_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'TwilightKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'A-101, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Night, Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Sunrise_Sunset'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Night, Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Civil_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Night, Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Nautical_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Night, Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Astronomical_Twilight'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'TwilightKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'TwilightKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Sunrise_Sunset'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Civil_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Nautical_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Astronomical_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Sunrise_Sunset'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Civil_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Nautical_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Astronomical_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageTwilight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageTwilight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Sunrise_Sunset'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageTwilight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Civil_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageTwilight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Nautical_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageTwilight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Astronomical_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Sunrise_Sunset', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Sunrise_Sunset'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Civil_Twilight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Civil_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Nautical_Twilight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Nautical_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Astronomical_Twilight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Astronomical_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Sunrise_Sunset'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Civil_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Nautical_Twilight'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTwilight', @level2type=N'COLUMN', @level2name=N'Astronomical_Twilight'; 
;





/* Drop table dbo.DimVehicle */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimVehicle') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimVehicle 
;

/* Create table dbo.DimVehicle */
CREATE TABLE dbo.DimVehicle (
   [VehicleKey]  int IDENTITY  NOT NULL
,  [ID]  varchar(50)   NOT NULL
,  [EngineCapacityCC]  int   NULL
,  [PropulsionCode]  varchar(50)   NULL
,  [Make]  varchar(50)   NULL
,  [Model]  varchar(50)   NULL
,  [JunctionLocation]  varchar(50)   NULL
,  [VehicleManoeuvre]  varchar(50)   NULL
,  [VehicleLocationRestrictedLane]  varchar(50)   NULL
,  [X1stPointofImpact]  varchar(50)   NULL
,  [WasVehicleLeftHandDrive]  varchar(50)   NULL
,  [Year]  int  DEFAULT 1999 NULL
, CONSTRAINT [PK_dbo.DimVehicle] PRIMARY KEY CLUSTERED 
( [VehicleKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimVehicle
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Vehicle', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimVehicle
;

SET IDENTITY_INSERT dbo.DimVehicle ON
;
INSERT INTO dbo.DimVehicle (VehicleKey, ID, EngineCapacityCC, PropulsionCode, Make, Model, JunctionLocation, VehicleManoeuvre, VehicleLocationRestrictedLane, X1stPointofImpact, WasVehicleLeftHandDrive, Year)
VALUES (-1, '-1', None, 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', None)
;
SET IDENTITY_INSERT dbo.DimVehicle OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'VehicleKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'EngineCapacityCC', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'EngineCapacityCC'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PropulsionCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'PropulsionCode'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Make', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Make'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Model', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Model'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'JunctionLocation', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'JunctionLocation'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'VehicleManoeuvre', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleManoeuvre'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'VehicleLocationRestrictedLane', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleLocationRestrictedLane'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'X1stPointofImpact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'X1stPointofImpact'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'WasVehicleLeftHandDrive', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'WasVehicleLeftHandDrive'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Dung tích động cơ của phương tiện', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'EngineCapacityCC'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Loại động cơ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'PropulsionCode'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Hãng', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Make'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Vị trí của phương tiện tại ngã tư hoặc giao lộ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'JunctionLocation'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Hành động của phương tiện trước khi xảy ra vụ tai nạn', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleManoeuvre'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Phương tiện có đang di chuyển trong làn đường bị hạn chế không', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleLocationRestrictedLane'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Điểm va chạm đầu tiên của phương tiện với đối tượng khác', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'X1stPointofImpact'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Phương tiện có lái bên trái hay khôn', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'WasVehicleLeftHandDrive'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Năm sản xuất', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'A-101, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1199, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'EngineCapacityCC'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Petrol, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'PropulsionCode'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Volvo, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Make'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'S80 SE D5', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Model'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Entering main road', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'JunctionLocation'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Going head other', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleManoeuvre'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0,…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleLocationRestrictedLane'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Front, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'X1stPointofImpact'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Yes, No', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'WasVehicleLeftHandDrive'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'2000', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'EngineCapacityCC'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'PropulsionCode'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Make'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Model'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'JunctionLocation'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleManoeuvre'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleLocationRestrictedLane'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'X1stPointofImpact'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'WasVehicleLeftHandDrive'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'EngineCapacityCC'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'PropulsionCode'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Make'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Model'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'JunctionLocation'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleManoeuvre'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleLocationRestrictedLane'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'X1stPointofImpact'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'WasVehicleLeftHandDrive'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageVehicle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageVehicle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'EngineCapacityCC'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageVehicle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'PropulsionCode'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageVehicle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Make'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageVehicle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Model'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageVehicle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'JunctionLocation'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageVehicle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleManoeuvre'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageVehicle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleLocationRestrictedLane'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageVehicle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'X1stPointofImpact'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageVehicle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'WasVehicleLeftHandDrive'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageVehicle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'EngineCapacityCC', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'EngineCapacityCC'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'PropulsionCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'PropulsionCode'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Make', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Make'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Model', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Model'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'JunctionLocation', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'JunctionLocation'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'VehicleManoeuvre', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleManoeuvre'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'VehicleLocationRestrictedLane', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleLocationRestrictedLane'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'X1stPointofImpact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'X1stPointofImpact'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'WasVehicleLeftHandDrive', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'WasVehicleLeftHandDrive'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'EngineCapacityCC'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'PropulsionCode'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Make'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Model'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'JunctionLocation'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleManoeuvre'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'VehicleLocationRestrictedLane'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'X1stPointofImpact'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'WasVehicleLeftHandDrive'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimVehicle', @level2type=N'COLUMN', @level2name=N'Year'; 
;





/* Drop table dbo.DimWeather */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimWeather') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimWeather 
;

/* Create table dbo.DimWeather */
CREATE TABLE dbo.DimWeather (
   [WeatherKey]  int IDENTITY  NOT NULL
,  [ID]  varchar(10)   NOT NULL
,  [Temperature(F)]  float   NULL
,  [Wind_Chill(F)]  float   NULL
,  [Humidity(%)]  int    NULL
,  [Pressure(in)]  float   NULL
,  [Visibility(mi)]  float   NULL
,  [WindDirection]  varchar(50)   NULL
,  [WindSpeed(mph)]  float   NULL
,  [Precipitation(in)]  float   NULL
, CONSTRAINT [PK_dbo.DimWeather] PRIMARY KEY CLUSTERED 
( [WeatherKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimWeather
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Weather', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimWeather
;

SET IDENTITY_INSERT dbo.DimWeather ON
;
INSERT INTO dbo.DimWeather (WeatherKey, ID, Temperature(F), Wind_Chill(F), Humidity(%), Pressure(in), Visibility(mi), WindDirection, WindSpeed(mph), Precipitation(in))
VALUES (-1, '-1', None, None, None, None, None, 'None', None, None)
;
SET IDENTITY_INSERT dbo.DimWeather OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeeKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeeID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Temperature(F)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Temperature(F)'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Wind_Chill(F)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Wind_Chill(F)'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Humidity(%)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Humidity(%)'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Pressure(in)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Pressure(in)'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Visibility(mi)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Visibility(mi)'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'WindDirection', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WindDirection'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'WindSpeed(mph)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WindSpeed(mph)'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Precipitation(in)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Precipitation(in)'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Nhiệt độ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Temperature(F)'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Chỉ số cảm giác lạnh', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Wind_Chill(F)'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Độ ẩm', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Humidity(%)'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Áp suất', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Pressure(in)'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tầm nhìn', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Visibility(mi)'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Hướng gió', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WindDirection'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tốc độ gió', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WindSpeed(mph)'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Lượng mưa', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Precipitation(in)'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'A-101, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'68, 58.4, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Temperature(F)'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'84, 79, ...', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Wind_Chill(F)'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'45, 33, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Humidity(%)'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'29,96, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Pressure(in)'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'7, 10, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Visibility(mi)'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'West, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WindDirection'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'9.2, 11.5, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WindSpeed(mph)'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0,0.12, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Precipitation(in)'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Temperature(F)'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Wind_Chill(F)'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Humidity(%)'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Pressure(in)'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Visibility(mi)'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WindDirection'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WindSpeed(mph)'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Precipitation(in)'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Temperature(F)'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Wind_Chill(F)'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Humidity(%)'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Pressure(in)'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Visibility(mi)'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WindDirection'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WindSpeed(mph)'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Precipitation(in)'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageWeather', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageWeather', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Temperature(F)'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageWeather', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Wind_Chill(F)'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageWeather', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Humidity(%)'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageWeather', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Pressure(in)'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageWeather', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Visibility(mi)'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageWeather', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WindDirection'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageWeather', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WindSpeed(mph)'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageWeather', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Precipitation(in)'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Temperature(F)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Temperature(F)'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Wind_Chill(F)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Wind_Chill(F)'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Humidity(%)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Humidity(%)'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Pressure(in)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Pressure(in)'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Visibility(mi)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Visibility(mi)'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'WindDirection', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WindDirection'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'WindSpeed(mph)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WindSpeed(mph)'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Precipitation(in)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Precipitation(in)'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'float', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Temperature(F)'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'float', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Wind_Chill(F)'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Humidity(%)'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'float', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Pressure(in)'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'float', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Visibility(mi)'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WindDirection'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'float', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'WindSpeed(mph)'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'float', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeather', @level2type=N'COLUMN', @level2name=N'Precipitation(in)'; 
;





/* Drop table dbo.DimWeatherCondition */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimWeatherCondition') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimWeatherCondition 
;

/* Create table dbo.DimWeatherCondition */
CREATE TABLE dbo.DimWeatherCondition (
   [WeatherConditionKey]  int IDENTITY  NOT NULL
,  [ID]  varchar(10)   NOT NULL
,  [WeatherCondition]  varchar(50)   NULL
, CONSTRAINT [PK_dbo.DimWeatherCondition] PRIMARY KEY CLUSTERED 
( [WeatherConditionKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimWeatherCondition
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'WeatherCondition', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimWeatherCondition
;

SET IDENTITY_INSERT dbo.DimWeatherCondition ON
;
INSERT INTO dbo.DimWeatherCondition (WeatherConditionKey, ID, WeatherCondition)
VALUES (-1, '-1', 'None')
;
SET IDENTITY_INSERT dbo.DimWeatherCondition OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'WeatherConditionKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'WeatherConditionKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'WeatherCondition', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'WeatherCondition'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'WeatherConditionKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Điều kiện thời tiết', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'WeatherCondition'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'WeatherConditionKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'A-101, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'WeatherConditionKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'WeatherConditionKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'WeatherCondition'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'WeatherCondition'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageWeather', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageWeather', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'WeatherCondition'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'WeatherCondition', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'WeatherCondition'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimWeatherCondition', @level2type=N'COLUMN', @level2name=N'WeatherCondition'; 
;





/* Drop table dbo.FactAccident */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactAccident') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactAccident 
;

/* Create table dbo.FactAccident */
CREATE TABLE dbo.FactAccident (
   [ID]  varchar(10)   NOT NULL
,  [LocationKey]  int   NOT NULL
,  [DateKey]  int   NOT NULL
,  [TwilightKey]  int   NOT NULL
,  [RoadFeatureKey]  int   NOT NULL
,  [WeatherKey]  int   NOT NULL
,  [DriverKey]  int   NOT NULL
,  [SpeedLimitKey]  int   NOT NULL
,  [VehicleKey]  int   NOT NULL
,  [NumberOfCasualties]  int   NULL
,  [NumberOfVehicles]  int   NULL
,  [AccidentSeverity]  int   NULL
,  [IsFatal]  bit   NULL
, CONSTRAINT [PK_dbo.FactAccident] PRIMARY KEY NONCLUSTERED 
( [ID] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactAccident
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Accident', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactAccident
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'LocationKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'LocationKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TwilightKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'TwilightKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RoadFeatureKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'RoadFeatureKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'WeatherKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DriverKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DriverKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SpeedLimitKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'SpeedLimitKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'VehicleKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'VehicleKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'NumberOfCasualties', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'NumberOfCasualties'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'NumberOfVehicles', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'NumberOfVehicles'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'AccidentSeverity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'AccidentSeverity'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'IsFatal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'IsFatal'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to location', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'LocationKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to twilight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'TwilightKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to road feature', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'RoadFeatureKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to weather', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Driver', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DriverKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to speed limit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'SpeedLimitKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to vehicle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'VehicleKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'số người bị thương', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'NumberOfCasualties'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'số phương tiện liên quan', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'NumberOfVehicles'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'mức độ nghiêm trọng (1–3 hoặc nhẹ/vừa/nặng)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'AccidentSeverity'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'tai nạn có tử vong không (bit)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'IsFatal'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'A-101, …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'LocationKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'TwilightKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'RoadFeatureKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DriverKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'SpeedLimitKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'VehicleKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1,2,3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'AccidentSeverity'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1,0', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'IsFatal'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'LocationKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'TwilightKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'RoadFeatureKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DriverKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'SpeedLimitKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'VehicleKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'LocationKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'TwilightKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'RoadFeatureKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DriverKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'SpeedLimitKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'VehicleKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'LocationKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'TwilightKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'RoadFeatureKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DriverKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'SpeedLimitKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'VehicleKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'NumberOfCasualties'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'NumberOfVehicles'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'AccidentSeverity'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Accident_Stage', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'IsFatal'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'LocationKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'TwilightKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'RoadFeatureKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DriverKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'SpeedLimitKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'VehicleKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'NumberOfCasualties'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'NumberOfVehicles'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'AccidentSeverity'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'IsFatal'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageAccident', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimLocation', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'LocationKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimTwilight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'TwilightKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimRoadFeature', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'RoadFeatureKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimWeather', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimDriver', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DriverKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimSpeed', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'SpeedLimitKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimVehicle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'VehicleKey'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageAccident', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'NumberOfCasualties'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageAccident', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'NumberOfVehicles'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageAccident', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'AccidentSeverity'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StageAccident', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'IsFatal'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'LocationKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'LocationKey'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'TwilightKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'TwilightKey'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'RoadFeatureKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'RoadFeatureKey'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'WeatherKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DriverKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DriverKey'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'SpeedLimitKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'SpeedLimitKey'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'VehicleKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'VehicleKey'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'casualties_count', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'NumberOfCasualties'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'vehicle_involved_count', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'NumberOfVehicles'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'severity_level', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'AccidentSeverity'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'fatal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'IsFatal'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'ID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'LocationKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'TwilightKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'RoadFeatureKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'WeatherKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'DriverKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'SpeedLimitKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'VehicleKey'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'ubt', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'NumberOfCasualties'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'NumberOfVehicles'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'AccidentSeverity'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'bit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactAccident', @level2type=N'COLUMN', @level2name=N'IsFatal'; 
;
ALTER TABLE dbo.FactAccident ADD CONSTRAINT
   FK_dbo_FactAccident_LocationKey FOREIGN KEY
   (
   LocationKey
   ) REFERENCES DimLocation
   ( LocationKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactAccident ADD CONSTRAINT
   FK_dbo_FactAccident_DateKey FOREIGN KEY
   (
   DateKey
   ) REFERENCES DimDate
   ( DateKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactAccident ADD CONSTRAINT
   FK_dbo_FactAccident_TwilightKey FOREIGN KEY
   (
   TwilightKey
   ) REFERENCES DimTwilight
   ( TwilightKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactAccident ADD CONSTRAINT
   FK_dbo_FactAccident_RoadFeatureKey FOREIGN KEY
   (
   RoadFeatureKey
   ) REFERENCES DimRoadFeature
   ( RoadFeatureKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactAccident ADD CONSTRAINT
   FK_dbo_FactAccident_WeatherKey FOREIGN KEY
   (
   WeatherKey
   ) REFERENCES DimWeather
   ( WeatherKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactAccident ADD CONSTRAINT
   FK_dbo_FactAccident_DriverKey FOREIGN KEY
   (
   DriverKey
   ) REFERENCES DimDriver
   ( DriverKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactAccident ADD CONSTRAINT
   FK_dbo_FactAccident_SpeedLimitKey FOREIGN KEY
   (
   SpeedLimitKey
   ) REFERENCES DimSpeed
   ( SpeedLimitKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactAccident ADD CONSTRAINT
   FK_dbo_FactAccident_VehicleKey FOREIGN KEY
   (
   VehicleKey
   ) REFERENCES DimVehicle
   ( VehicleKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
