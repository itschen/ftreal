--Load Information from CAMAExports
--Change the datefields to varchar(50) (and then convert from sqlserver date)

CREATE SCHEMA IF NOT EXISTS ftreal_test;

USE ftreal_test;

CREATE TABLE IF NOT EXISTS ACCOUNT (
	ACCOUNTNO varchar (30) NOT NULL ,
	PARCELNB varchar (20) NULL ,
	ACCTTYPE varchar (15) NULL ,
	LOCATIONSTREETNO varchar (15)   NULL ,
	LOCATIONSTREETDIR varchar (2)   NULL ,
	LOCATIONSTREETNAME varchar (50)   NULL ,
	LOCATIONSTREETSUFFIX varchar (4)   NULL ,
	LOCATIONSTREETALPHA varchar (6)   NULL ,
	LOCATIONADDRESS varchar (100)   NULL ,
	LOCATIONCITY varchar (40)   NULL ,
	LOCATIONZIPCODE varchar (10)   NULL ,
	BUSINESSNAME varchar (100)   NULL ,
	MAPNO varchar (40)   NULL ,
	ECONAREAID varchar (10)   NULL ,
	BLDGS numeric(11, 0) NULL ,
	LEGALSEARCH varchar (2000)   NULL ,
	LEGALFULL text NULL,
	LEAID varchar (8)   NULL ,
	NOVVALUE numeric(15, 2) NULL ,
	ACTUALVAL numeric(15, 2) NULL ,
	ADJUSTEDACTUALVAL numeric(15, 2) NULL ,
	ASSESSEDVAL numeric(15, 2) NULL ,
	LASTDOCDATE varchar(50) NULL ,
	LASTSALEDATE varchar(50) NULL ,
	LEGALCHANGEDATE varchar(50) NULL ,
	ACCOUNTCREATEDATE varchar(50) NULL ,
	ACCOUNTDELETEDATE varchar(50) NULL ,
	STATUS varchar (1) NULL,
	PARENTPARCEL varchar(30) NULL,
	ACCOUNTCHANGEDATE varchar(50) NULL
);

CREATE TABLE IF NOT EXISTS IMPROVEMENT (
	ACCOUNTNO varchar (30)  NOT NULL ,
	BLDGID varchar (5)  NOT NULL ,
	PARCELNB varchar (18)  NULL ,
	PROPTYPE varchar (15)  NULL ,
	NBHD varchar (10)  NULL ,
	OWNEROCCUPIED numeric(1, 0) NULL ,
	OCCCODE numeric(11, 0) NULL ,
	OCCDESCR varchar (50)  NULL ,
	BLTASID numeric(11, 0) NULL ,
	BLTASDESCR varchar (50)  NULL ,
	SF numeric(11, 0) NULL ,
	CONDOSF numeric(11, 0) NULL ,
	BSMNTSF numeric(11, 0) NULL ,
	BSMNTSFFIN numeric(11, 0) NULL ,
	GARAGESF numeric(11, 0) NULL ,
	CARPORTSF numeric(11, 0) NULL ,
	BALCONYSF numeric(11, 0) NULL ,
	PORCHSF numeric(11, 0) NULL ,
	PERCCOMP numeric(38, 2) NULL ,
	CONDITIONS varchar (15)  NULL ,
	QUALITY varchar (15)  NULL ,
	HVACID numeric(11, 0) NULL ,
	HVACDESCR varchar (50)  NULL ,
	EXTERIOR varchar (25)  NULL ,
	INTERIOR varchar (15)  NULL ,
	UNITTYPE varchar (10)  NULL ,
	STORIES numeric(12, 2) NULL ,
	ROOFTYPE varchar (20)  NULL ,
	ROOFCOVER varchar (20)  NULL ,
	FLOORCOVER varchar (20)  NULL ,
	ROOMS numeric(11, 0) NULL ,
	BEDROOMS numeric(11, 0) NULL ,
	BATHS numeric(38, 2) NULL ,
	CLASSID varchar (50)  NULL ,
	CLASSDESCR varchar (20)  NULL ,
	YRBLT numeric(11, 0) NULL ,
	YRREM numeric(11, 0) NULL ,
	ADJYRBLT numeric(11, 0) NULL ,
	AGE numeric(11, 0) NULL ,
	IMPACTUALVAL numeric(15, 2) NULL ,
	STATUS varchar (1)  NULL
);

CREATE TABLE IF NOT EXISTS IMPROVEMENTDETAIL (
	ACCOUNTNO varchar (30)   NOT NULL ,
	BLDGID varchar (5)   NOT NULL ,
	PARCELNB varchar (18)   NULL ,
	DETAILTYPE varchar (10)   NOT NULL ,
	DETAILDESCR varchar (50)   NOT NULL ,
	UNITS numeric(38, 2) NULL ,
	STATUS varchar (1) NULL
);

CREATE TABLE IF NOT EXISTS LEGAL (
	ACCOUNTNO varchar (30)  NOT NULL ,
	LEGAL1 varchar (100)  NULL ,
	LEGAL2 varchar (50)  NULL ,
	LEGAL3 varchar (50)  NULL ,
	LEGAL4 varchar (25)  NULL 
);

CREATE TABLE IF NOT EXISTS OWNER (
	ACCOUNTNO varchar (30)  NOT NULL ,
	PARCELNB varchar (18)  NULL ,
	OWNERNAME1 varchar (40)  NULL ,
	OWNERNAME2 varchar (40)  NULL ,
	MAILADDRESS1 varchar (40)  NULL ,
	MAILADDRESS2 varchar (40)  NULL ,
	MAILCITY varchar (40)  NULL ,
	MAILSTATE varchar (2)  NULL ,
	MAILZIPCODE varchar (10)  NULL ,
	PRIMARYOWNER numeric(1, 0) NULL ,
	STATUS varchar (1)  NULL,
	OWNERCHANGEDATE varchar(50) NULL ,
	ADDRESSCHANGEDATE varchar(50) NULL ,
	
);

CREATE TABLE IF NOT EXISTS PRIORASSMTS (
	ACCOUNTNO varchar (30) NOT NULL,
	TAXYEAR char (4) NOT NULL,
	EFFDATE char (10) NULL,
	VALUETYPE varchar (20) NOT NULL,
	PARCELNB varchar (20) NULL,
	ASSESSEDVAL numeric(15, 2) NULL 
);

CREATE TABLE IF NOT EXISTS SALES (
	ACCOUNTNO varchar (30)  NOT NULL ,
	RECPTNO varchar (11)  NOT NULL ,
	PARCELNB varchar (18)  NULL ,
	GRANTOR varchar (80)  NULL ,
	GRANTEE varchar (80)  NULL ,
	SALEP numeric(38, 2) NULL ,
	SALEDT varchar(50) NULL ,
	DEEDTYPE varchar (25)  NULL ,
	DEEDCODE varchar (10)  NULL ,
	VALIDINV varchar (7)  NULL ,
	CONFIRMUN varchar (11)  NULL ,
	BOOK varchar (6)  NULL ,
	PAGE varchar (7)  NULL ,
	CHANGEDATE varchar(50) NULL ,
	EXCLUDEREASON varchar (30)  NULL 
);

CREATE TABLE IF NOT EXISTS STREETNUMBER (
	ACCOUNTNO varchar (30)  NOT NULL ,
	LOCATIONSTREETNO varchar (15)  NULL ,
	STREETNUM numeric(5, 0) NULL ,
	STREETNUMALPHA varchar (10)  NULL 
);

CREATE TABLE IF NOT EXISTS TAXSTATUS (
	ACCOUNTNO varchar (30)  NOT NULL ,
	TAXSTATUS varchar (8)  NULL 
);

CREATE TABLE IF NOT EXISTS VALUEDETAIL (
	ACCOUNTNO varchar (30) NOT NULL ,
	PARCELNB varchar (18) NULL ,
	VALUETYPE varchar (20) NULL ,
	ABSTCODE varchar (10) NOT NULL ,
	ABSTDESCR varchar (40) NULL ,
	ACRES numeric(38, 2) NULL ,
	SQFT numeric(38, 2) NULL ,
	ASSESSEDVAL numeric(38, 2) NULL ,
	ACCTVAL numeric(38, 2) NULL ,
	STATUS varchar (1) NULL
);


CREATE TABLE IF NOT EXISTS ZONING (
	accountno varchar (30)  NOT NULL ,
	parcelnb varchar (20)  NULL ,
	zoning varchar (50)  NULL 
);