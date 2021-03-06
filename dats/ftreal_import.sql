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

CREATE TABLE parcels AS 
	(SELECT a.accountno, a.parcelnb, accttype, locationstreetno, locationstreetdir, 
		    locationstreetname, locationstreetsuffix, locatrionstreetalpha,
		    locationcity,locationzipcode, proptype, valuetype, abstcode, abstdescr, 
		    occcode, occdesc, bltasid, bltasdescr, sf, sqft, acres, stories, yrblt, zoning
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
			from account a left outer join (improvement i, zoning z, valuedetail vd)
		on (a.accountno=i.accountno AND a.accountno=z.accountno)
		where locationstreetname="JOHN CARLYLE";

CREATE TABLE parcels_mill AS (
		SELECT a.accountno, a.parcelnb, accttype, locationstreetno, locationstreetdir, 
			    locationstreetname, locationstreetsuffix, locationstreetalpha,
			    locationcity,locationzipcode, proptype, valuetype, abstcode, abstdescr, 
			    occcode, occdescr, bltasid, bltasdescr, sf, sqft, acres, stories, yrblt, zoning
		    FROM account a LEFT JOIN (improvement i, VALUEDETAIL vd, zoning z) 
				ON (a.accountno=i.accountno AND 
					a.accountno = vd.accountno AND
					a.accountno = z.accountno) 
				WHERE locationstreetname="MILL");

#All Merged Together				
INSERT INTO parcels (acct_no, parcel_nb,acct_type,street_no,street_dir,street_name,street_type,
					 street_alpha, city, zip, prop_type, value_type, abst_code, abst_desc, occ_code,
					 occ_desc, blt_as_id, blt_as_desc, grossf,netsf,acres,stories,yr_blt,zoning)
	SELECT a.accountno, a.parcelnb, accttype, locationstreetno, locationstreetdir, 
			   locationstreetname, locationstreetsuffix, locationstreetalpha,
			    locationcity,locationzipcode, proptype, valuetype, abstcode, abstdescr, 
			    occcode, occdescr, bltasid, bltasdescr, sf, sqft, acres, stories, yrblt, zoning
		    FROM ftreal_test.account a LEFT JOIN (ftreal_test.improvement i, 
												  ftreal_test.VALUEDETAIL vd,
			 			 						  ftreal_test.zoning z) 
				ON (a.accountno=i.accountno AND 
					a.accountno = vd.accountno AND
					a.accountno = z.accountno)
			  WHERE locationstreetname="MILL";
			
#Single Table Import
INSERT INTO parcels (acct_no, parcel_nb,acct_type,street_no,street_dir,street_name,street_type,
					 street_alpha, city, zip)
	SELECT a.accountno, a.parcelnb, accttype, locationstreetno, locationstreetdir, 
			   locationstreetname, locationstreetsuffix, locationstreetalpha,
			    locationcity,locationzipcode
		    FROM ftreal_test.account a
			  WHERE locationstreetname="MILL";

#Insert Data from Original Tables into Merged Table
UPDATE parcels p
INNER JOIN ftreal_test.zoning z
ON (p.acct_no=z.accountno)
SET p.zoning = REPLACE(z.zoning,'"','');

UPDATE parcels p
INNER JOIN ftreal_test.valuedetail v
ON (p.acct_no=v.accountno)
SET p.acres = v.acres;

UPDATE parcels p
INNER JOIN ftreal_test.valuedetail v
ON (p.acct_no=v.accountno)
SET p.lotsf = v.sqft
WHERE v.valuetype="LAND";

UPDATE parcels p
INNER JOIN ftreal_test.improvement i
ON (p.acct_no=i.accountno)
SET p.stories = i.stories;

UPDATE parcels p
INNER JOIN ftreal_test.improvement i
ON (p.acct_no=i.accountno)
SET p.yr_blt = i.yrblt;

UPDATE parcels p
INNER JOIN ftreal_test.improvement i
ON (p.acct_no=i.accountno)
SET p.grossf = i.sf;

