--Joel Castro
--CS435 - Project 2
--Driver: Project2.sql
--
--Run the file CreateDatabase.sql (included); it will create a database
--named CS435W14HW2. You will then need to execute the file LoadData.sql
--to fill the database with sample data.
--Create a number of objects (views and triggers) as describe below.

--Other files included: a database called CS435W14HW2_Validation and
--a file TestQueries.sql to help ensure that your project is correct.
--Use the Database Restore functionality of Management Studio to restore the
--validation database, then run the file TestQueries.sql against your database.
--The first 4 queries validate the 4 views and should not return any data.
--The last query validates the effect of the two triggers and should not return
--any data either

use master
go
if exists (select * from sys.databases where name = 'CS435W14HW2')
begin
	alter database CS435W14HW2 set single_user with rollback immediate
	drop database CS435W14HW2
end
go
create database CS435W14HW2
go

use CS435W14HW2
go

Create Table Address
	( AddressID int Primary Key
	, StreetAddress varchar (100)
	, City varchar (50)
	, StateCode char(3)
	, PostalCode char (12)
	, Country varchar(30)
	)

Create Table Person
	( PersonID int Primary Key
	, Name varchar (50) not null
	, AddressID int references Address(AddressID) On Delete no action on update no action
	, PhoneNumber varchar(15) check (PhoneNumber is null or isnumeric(PhoneNumber)=1)
	)

-- The property table contains all the properties for sale.
Create Table Property 
	( PropertyID int Primary Key -- Unique ID for each property
	, AddressID int references Address(AddressID) On Delete no action on update no action
	, NumberOfRooms int not null Check (NumberOfRooms > 0) -- Number of rooms
	)

-- The agent table defines the agents authorized to sell the property
-- Properties may be listed by multiple agents
Create Table Agent
	( AgentID int Primary Key  -- The unique ID for each agent
	, PersonID int References Person(PersonID) On delete Cascade on update Cascade
	)

-- The listing table relate the agents with the properties they are authorized to sell
Create Table Listing
	( PropertyID int  -- Property ID as per the Property table
	, AgentID int
	, ListingDate DateTime not null -- Date this agent was authorized to sell this property
	, AskingPrice Decimal(10,2) not null -- Asking Price
	, SaleDate Date
	, SalePrice Decimal(10, 2)	
	, Primary Key (PropertyID, ListingDate)
	, Foreign Key (PropertyID) references Property(PropertyID)
	, Foreign Key (AgentID) references Agent(AgentID) on delete no action on update no action
	)

-- The Buyer table contains information about each potential buyer
Create Table Buyer
	( BuyerID int Primary Key  -- The unique ID for each buyer
	, PersonID int not null
	, NumberOfRooms int  -- The number of rooms they require
	, MaximumPrice decimal (10, 2) -- The maximum price they are willing to pay
	, Foreign Key (PersonID) references Person(PersonID) on delete cascade
	)

-- The Buyer City table gives, for each buyer the City(s) they are interested in.
-- A buyer is interested in properties in a given are only if a row relating the buyer's ID
-- with that City 
Create Table BuyerCity
	( BuyerID int  -- The id of the buyer
	, City varchar(50) -- an city the buyer is interested in
	, Primary Key (BuyerID, City)
	, Foreign Key (BuyerID) references Buyer(BuyerID) on delete cascade
	)
	
Create table Offer
	( BuyerID int 
	, PropertyID int
	, OfferedPrice Decimal (10, 2) not null
	, OfferDate Date not null
	, Primary key (BuyerID, PropertyID)
	, Foreign key (BuyerID) references Buyer(BuyerID) on delete cascade
	, Foreign key (PropertyID) references Property(PropertyID) on delete cascade
)
	
