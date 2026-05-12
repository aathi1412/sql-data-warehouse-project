--create database and schemas

use master;
go

  -- create a 'DataWarehouse' database
create database DataWarehouse;
go

  -- use 'DataWarehouse' database
use DataWarehouse;
go

  -- create schema for the 'DataWarehouse'
create schema bronze;
go
  
create schema silver;
go
  
create schema gold;
