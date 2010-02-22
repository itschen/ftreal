--Import all Data to the Database from the TXT Files
--11 Tables: Account, Improvement, ImprovementDetail, Legal, Owner, PriorAssmts, Sales, StreetNumber,
--TaxStatus, ValueDetail, Zoning.
-- I'm sure you can do a SQL Program but I don't know how to yet...

USE ftreal_test;
--Delete Current Data
-- I wanted to use a single DELETE FROM, and according to the syntax you can, but its not working!

DELETE FROM account; 
DELETE FROM	improvement; 
DELETE FROM	improvementdetail;
DELETE FROM legal;
DELETE FROM owner; 
DELETE FROM priorassmts; 
DELETE FROM sales; 
DELETE FROM streetnumber; 
DELETE FROM taxstatus;
DELETE FROM valuedetail;
DELETE FROM zoning;

--Account
LOAD DATA LOCAL INFILE '/users/igor/RubyWork/ftreal/trunk/dats/CAMAExports/ExportAccount.txt' 
	INTO TABLE account 
	FIELDS ENCLOSED BY '"' TERMINATED BY ',' 
	LINES TERMINATED BY '\n';

--Improvement
LOAD DATA LOCAL INFILE '/users/igor/RubyWork/ftreal/trunk/dats/CAMAExports/ExportImprovement.txt'
	INTO TABLE improvement
	FIELDS ENCLOSED BY '"' TERMINATED BY ',' 
	LINES TERMINATED BY '\n';

--ImprovementDetail
LOAD DATA LOCAL INFILE '/users/igor/RubyWork/ftreal/trunk/dats/CAMAExports/ExportImprovementDetail.txt'
	INTO TABLE improvementdetail
	FIELDS ENCLOSED BY '"' TERMINATED BY ',' 
	LINES TERMINATED BY '\n';
	
--Legal
LOAD DATA LOCAL INFILE '/users/igor/RubyWork/ftreal/trunk/dats/CAMAExports/ExportLegal.txt'
	INTO TABLE legal
	FIELDS ENCLOSED BY '"' TERMINATED BY ',' 
	LINES TERMINATED BY '\n';

--Owner
LOAD DATA LOCAL INFILE '/users/igor/RubyWork/ftreal/trunk/dats/CAMAExports/ExportOwner.txt'
	INTO TABLE owner
	FIELDS ENCLOSED BY '"' TERMINATED BY ',' 
	LINES TERMINATED BY '\n';

--PriorAssmts
LOAD DATA LOCAL INFILE '/users/igor/RubyWork/ftreal/trunk/dats/CAMAExports/ExportPriorAsmts.txt'
 	INTO TABLE priorassmts
	FIELDS ENCLOSED BY '"' TERMINATED BY ',' 
	LINES TERMINATED BY '\n';
		
--Sales
LOAD DATA LOCAL INFILE '/users/igor/RubyWork/ftreal/trunk/dats/CAMAExports/ExportSales.txt' 
	INTO TABLE sales
	FIELDS ENCLOSED BY '"' TERMINATED BY ',' 
	LINES TERMINATED BY '\n';
	
--StreetNumber
LOAD DATA LOCAL INFILE '/users/igor/RubyWork/ftreal/trunk/dats/CAMAExports/ExportStreetNumber.txt' 
	INTO TABLE streetnumber
	FIELDS ENCLOSED BY '"' TERMINATED BY ',' 
	LINES TERMINATED BY '\n';

--TaxStatus
LOAD DATA LOCAL INFILE '/users/igor/RubyWork/ftreal/trunk/dats/CAMAExports/ExportTaxStatus.txt' 
	INTO TABLE taxstatus
	FIELDS ENCLOSED BY '"' TERMINATED BY ',' 
	LINES TERMINATED BY '\n';

--ValueDetail
LOAD DATA LOCAL INFILE '/users/igor/RubyWork/ftreal/trunk/dats/CAMAExports/ExportValueDetail.txt' 
	INTO TABLE valuedetail
	FIELDS ENCLOSED BY '"' TERMINATED BY ',' 
	LINES TERMINATED BY '\n';

--Zoning
LOAD DATA LOCAL INFILE '/users/igor/RubyWork/ftreal/trunk/dats/CAMAExports/ExportZoning.txt' 
	INTO TABLE zoning
	FIELDS ENCLOSED BY '"' TERMINATED BY ',' 
	LINES TERMINATED BY '\n';