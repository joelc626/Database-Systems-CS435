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

use CS435W14HW2

select * 
from CS435W14HW2_Validation.dbo.ListingAgents v
full outer join ListingAgents s
ON s.PropertyID = v.PropertyID
where s.PropertyID is null or v.PropertyID is null
   or s.Name is null or v.Name is null or s.Name != v.Name
   or s.PhoneNumber is null or v.PhoneNumber is null or s.PhoneNumber != v.PhoneNumber
print 'Exercise 1 Record Count = ' + convert (varchar, @@rowcount)

select * 
from CS435W14HW2_Validation.dbo.MarketStatistics v
full outer join MarketStatistics s
ON s.City = v.City
where s.City is null or v.City is null
   or s.Properties is null or v.Properties is null or s.Properties != v.Properties
   or s.AskingPrice is null or v.AskingPrice is null or s.AskingPrice != v.AskingPrice
print 'Exercise 2 Record Count = ' + convert (varchar, @@rowcount)

select * 
from CS435W14HW2_Validation.dbo.PropertiesAndBuyers v
full outer join PropertiesAndBuyers s
ON s.PropertyID = v.PropertyID and isnull(s.BuyerID, 0) = isnull(v.BuyerID, 0)
where s.PropertyID is null or v.PropertyID is null
   or ((s.BuyerID is null and v.BuyerID is not null) or (s.BuyerID is not null and v.BuyerID is null) or s.BuyerID != v.BuyerID)
   or ((s.Name is null and v.Name is not null) or (s.Name is not null and v.Name is null) or s.Name != v.Name)
print 'Exercise 3 Record Count = ' + convert (varchar, @@rowcount)

select * 
from CS435W14HW2_Validation.dbo.PropertiesHardToSell v
full outer join PropertiesHardToSell s
ON s.PropertyID = v.PropertyID
where s.PropertyID is null or v.PropertyID is null 
   or s.AskingPrice is null or v.AskingPrice is null or s.AskingPrice != v.AskingPrice
   or s.City is null or v.City is null or s.City != v.City
print 'Exercise 4 Record Count = ' + convert (varchar, @@rowcount)


--Exercise 5 Update Listing
update Listing
   set SaleDate = '2014-01-31'
     , SalePrice = AskingPrice
where (PropertyID = 30 and SaleDate is null) -- Update a listing w/o offer
   or (PropertyID = 74 and SaleDate = '2010-06-30') -- Update a listing old sale
   or (PropertyID = 33 and SaleDate is null) -- Update a listing with offers

select * 
from CS435W14HW2_Validation.dbo.Listing v
full outer join Listing s
ON s.PropertyID = v.PropertyID and s.ListingDate = v.ListingDate
where s.PropertyID is null or v.PropertyID is null 
   or s.AgentID is null or v.AgentID is null or s.AgentID != v.AgentID
   or s.AskingPrice is null or v.AskingPrice is null or s.AskingPrice != v.AskingPrice
   or ((s.SaleDate is null and v.SaleDate is not null) or (s.SaleDate is not null and v.SaleDate is null) or s.SaleDate != v.SaleDate)
   or ((s.SalePrice is null and v.SalePrice is not null) or (s.SalePrice is not null and v.SalePrice is null) or s.SalePrice != v.SalePrice)
print 'Exercise 4-5 Record Count = ' + convert (varchar, @@rowcount)

select * 
from CS435W14HW2_Validation.dbo.OfferE5 v
full outer join Offer s
ON s.PropertyID = v.PropertyID and v.BuyerID = s.BuyerID
where s.PropertyID is null or v.PropertyID is null or s.BuyerID is null or v.BuyerID is null
   or s.OfferDate is null or v.OfferDate is null or s.OfferDate != v.OfferDate
   or s.OfferedPrice is null or v.OfferedPrice is null or s.OfferedPrice != v.OfferedPrice
print 'Exercises 4-5 Record Count = ' + convert (varchar, @@rowcount)


update Offer
   set OfferDate = '2014-02-14'
     , OfferedPrice = case PropertyID
                      when 307 then 550000 -- increase max
                      when 283 then 673000 -- decrease max
                      when 188 then 320000 -- Put over the max
                      when 266 then 1141000 -- Increase but below the max
                      end
where (PropertyID = 307 and BuyerID = 12)
   or (PropertyID = 283 and BuyerID = 15)
   or (PropertyID = 188 and BuyerID = 16)                    
   or (PropertyID = 266 and BuyerID = 2)

insert into Offer (BuyerID, PropertyID, OfferDate, OfferedPrice)
values (2, 22, '2014-02-14', 950000) -- First Offer
     , (13, 155, '2014-02-14', 1150000.00) -- New Offer greater than the current max
     , (23, 314, '2014-02-14', 300000.00 ) -- New Offer less than the current max

select * 
from CS435W14HW2_Validation.dbo.Listing v
full outer join Listing s
ON s.PropertyID = v.PropertyID and s.ListingDate = v.ListingDate
where s.PropertyID is null or v.PropertyID is null 
   or s.AgentID is null or v.AgentID is null or s.AgentID != v.AgentID
   or s.AskingPrice is null or v.AskingPrice is null or s.AskingPrice != v.AskingPrice
   or ((s.SaleDate is null and v.SaleDate is not null) or (s.SaleDate is not null and v.SaleDate is null) or s.SaleDate != v.SaleDate)
   or ((s.SalePrice is null and v.SalePrice is not null) or (s.SalePrice is not null and v.SalePrice is null) or s.SalePrice != v.SalePrice)
print 'Exercise 4-5 Record Count = ' + convert (varchar, @@rowcount)

select * 
from CS435W14HW2_Validation.dbo.Offer v
full outer join Offer s
ON s.PropertyID = v.PropertyID and v.BuyerID = s.BuyerID
where s.PropertyID is null or v.PropertyID is null or s.BuyerID is null or v.BuyerID is null
   or s.OfferDate is null or v.OfferDate is null or s.OfferDate != v.OfferDate
   or s.OfferedPrice is null or v.OfferedPrice is null or s.OfferedPrice != v.OfferedPrice
order by v.PropertyID
print 'Exercises 4-5 Record Count = ' + convert (varchar, @@rowcount)
 
