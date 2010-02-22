CREATE SCHEMA ftreal;

CREATE TABLE owner (
	owner_id INT NOT NULL PRIMARY KEY,
	account_no INT,
	last_name VARCHAR(25),
	first_name VARCHAR(25),
	company_name VARCHAR(50),
	email VARCHAR(50),
	telephone DECIMAL(10,0),
	fax DECIMAL(10,0),
	street_no INT,
	street_name VARCHAR(30),
	street_type VARCHAR(20),
	street_dir VARCHAR(2),
	city VARCHAR(20),
	state VARCHAR(2),
	zip DECIMAL(5,0)
	);

CREATE TABLE parcels (
	account_no INT NOT NULL PRIMARY KEY,
	parcel_nb VARCHAR(30),
	acct_type VARCHAR(15),
	street_no INT,
	street_name VARCHAR(30),
	street_type VARCHAR(20),
	street_dir VARCHAR(2),
	city VARCHAR(20),
	state VARCHAR(2),
	zip DECIMAL(5,0),
	map_no VARCHAR(50),
	prop_type VARCHAR(50),
	acc_descr VARCHAR(50),
	blt_as_id INT,
	blt_as_descr VARCHAR(80),
	lotsf DECIMAL(12,0),
	netsf DECIMAL(12,0),
	grosf DECIMAL(12,0),
	stories INT,
	park_space INT,
	yr_blt DECIMAL(4,0),
	zoning VARCHAR(20),
	liber VARCHAR(10),
	folio VARCHAR(10)
	);

-- In company table if they have an account_no, it would be redundant to have the address.
-- I'm thinking more along the lines of companies with several branches or companies that don't have 
-- properties, we'll have to think about it.

CREATE TABLE company (
	business_id INT NOT NULL PRIMARY KEY,
	business name VARCHAR(50),
	account_no INT,
	last_name VARCHAR(25),
	first_name VARCHAR(25),
	street_no INT,
	street_name VARCHAR(30),
	street_type VARCHAR(20),
	street_dir VARCHAR(2),
	city VARCHAR(20),
	state VARCHAR(2),
	zip DECIMAL(5,0)	
	);

CREATE TABLE commercial_info (
	commercial_info_id INT NOT NULL PRIMARY KEY,
	rental_rate_sf_yr DECIMAL(12,2)
	selling_rate_sf DECIMAL(12,2)
	business_id INT,
	owner_id INT
	);
	
-- ADD AUTO INCREMENT TO PRIMARY KEYS
-- finish scripts then change to ruby.
-- load txt files into mysql and create tables using SELECT statement from there.
-- Tables for the CRM customers/company
-- Geocoding on the fly (fix users error)

create table parcels as 
	(select a.accountno, a.parcelnb, accttype, locationstreetno, locationstreetdir, locationstreetname, locationstreetsuffix, locatrionstreetalpha, locationcity,locationzipcode,mapno, proptype, bltasid, bltasdescr, sf, stories, yrblt, zoning
	from account a, zoning z, improvement i
 	where locationzipcode=22314 
		and a.accountno=z.accountno
		and a.accountno=i.accountno);
		
select a.accountno, a.parcelnb, accttype, locationstreetno, locationstreetdir, locationstreetname, 
       locationstreetsuffix, locationstreetalpha, locationcity,locationzipcode,mapno, proptype, 
       bltasid, bltasdescr, sf, stories, yrblt, zoning
	from account a, zoning z, improvement i
 	where locationzipcode=22314 
		and a.accountno=z.accountno
		and a.accountno=i.accountno
		and accttype="COMMERCIAL";
		
		select a.accountno, a.locationstreetno,accttype, sf, zoning
			from account a left outer join (improvement i, zoning z)
		on (a.accountno=i.accountno AND a.accountno=z.accountno)
		where locationstreetname="JOHN CARLYLE";