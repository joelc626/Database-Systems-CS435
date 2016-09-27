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


--  Ex1
--Create a view that lists the properties for sale with the
--listing agent's name and phone number.
--The phone number of agents without a phone number should show as "None".

Create view ListingAgents as
select porp.PropertyID,
    Name,
    PhoneNumber = coalesce(PhoneNumber, 'None')
from Property prop
join Listing list on prop.PropertyID = list.PropertyID
join Agent ag on ag.AgentID = list.AgentID
join Person prsn on prsn.PersonID = ag.PersonID


--  Ex2
--Create a view that gives, for each city where properties are for sale the
--number of properties for sale, and the average asking price.
--A property is considered “for sale” if and only if there is a listing for
--it with an asking price and the Sale Date is null.

Create view MarketStatistics as
    select a.City
    , Properties = count(*)
    , AskingPrice = AVG(l.AskingPrice)
from Property p
join Address a on a.AddressID = p.AddressID
join Listing l on l.PropertyID = p.PropertyID
    where l.SaleDate is null
group by a.City

--  Ex3
--Create a view that gives the properties that are for sale and the potential
--buyers.
--A buyer is considered interested in a property if it has the exact number
--of rooms the buyer wants, an asking price less than or equal to the maximum
--price of the buyer and is in a city the buyer is interested in.
--Properties where no buyer is interested should be listed with all the buyer
--information NULL

Create view PropertiesAndBuyers as
select p.PropertyID,
    b.BuyerID,
    bp.Name
from Property p
join Listing l on l.PropertyID = p.PropertyID
join Address a on a.AddressID = p.AddressID
left join Buyer b on b.NumberOfRooms = p.NumberOfRooms
    and b.MaximumPrice >= l.AskingPrice
    and a.City in (select City from BuyerCity bc
        where bc.BuyerID = b.BuyerID)
left join Person bp on bp.PersonID = b.PersonID
where l.SaleDate is null
go

--  Ex4
--Create a view that gives the properties that no one is interested in,
--that is properties that are for sale and no buyer is interested.

Create view PropertiesHardToSell as
select pb.PropertyID,
    AskingPrice,
    City
from PropertiesAndBuyers pb
join Property p on p.PropertyID = pb.PropertyID
join Address a on a.AddressID = p.AddressID
join Listing l on l.PropertyID = pb.PropertyID
    where pb.BuyerID is null and l.SaleDate is null

--  Ex5
--When a property is sold, the corresponding Listing is updated to include the
--sales date and the sale price; at that time, all the offers for the properties
--should be removed from the database.
--To enforce this business rule, create a trigger that deletes all offers when
--a Sales Date and Sales Price are changed from null to some definite value.

Create trigger SaleDeletesOffer
    on Listing after insert, update
as
    delete Offer
        from Offer
        join inserted i on i.PropertyID = Offer.PropertyID
        join deleted d on d.PropertyID = Offer.PropertyID
            where i.SaleDate is not null and d.SaleDate is null

--  Ex6
--Offers for a property should always increase, except for the best offer that
--may be reduced.
--Create a trigger that prevents entering or changing an offer that is less than
--the highest offer for the property, or that is entered for a property that is
--not for sale.

--For Insert
Create trigger DeleteInvalidOffers
    on Offer after insert
as
    delete o
        from Offer o
        join inserted i on i.PropertyID = o.PropertyID
            and i.BuyerID = o.BuyerID
        left join Listing l on l.PropertyID = o.PropertyID
            and l.SaleDate is null
        where o.OfferedPrice < (select MAX(OfferedPrice)
            from Offer o2
            where o2.PropertyID = o.PropertyID)
                or l.PropertyID is null

--For Update
Create trigger CheckInvalidOffers
    on Offer after update
as
    update o
        set OfferedPrice = d.OfferedPrice
        from Offer o
        join inserted i on i.PropertyID = o.PropertyID
            and i.BuyerID = o.BuyerID
        join deleted d on d.PropertyID = o.PropertyID
            and d.BuyerID = o.BuyerID
        left join Listing l on l.PropertyID = o.PropertyID
            and l.SaleDate is null
            where o.OfferedPrice < (select MAX(OfferedPrice)
                from Offer o2
                where o2.PropertyID = o.PropertyID)
                    or l.PropertyID is null