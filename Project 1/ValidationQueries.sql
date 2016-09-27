--Joel Castro
--CS435 - Project 1
--
--Driver: Project1.sql
--ValidationQueries - verify your foreign key constraints;
--all queries should succeed and no error message should be printed.

--Delete Registration Detail result 1, 1 and 1
DELETE FROM RegistrationDetail where RegistrationNo = 1 and LineNumber = 2
if @@ROWCOUNT <> 1 PRINT 'Error: Deleting registration line should have affected 1 row' 
SELECT * FROM RegistrationHeader where RegistrationNo = 1
if @@ROWCOUNT <> 1 PRINT 'Error: Deleting registration line deleted the header' 
SELECT * FROM RegistrationDetail where RegistrationNo = 1 
if @@ROWCOUNT <> 1 PRINT 'Error: Deleting registration line failed' 

--Delete Registration result 1, 0 and 1
DELETE FROM RegistrationHeader WHERE RegistrationNo = 3
if @@ROWCOUNT <> 1 PRINT 'Error: Deleting registration header should have affected 1 row' 
select * from RegistrationDetail where RegistrationNo = 3
IF @@ROWCOUNT <> 0 PRINT 'Error: Deleting registration header did not cascade to the lines'
select * from Person where UserID = 'BANKS'
IF @@ROWCOUNT <> 1 PRINT 'Error: Deleting registration deleted billing contact'

--Delete Trainer witout any registration nor billing result 1
delete from Person where UserID = 'JONES'
IF @@ROWCOUNT <> 1 PRINT 'Error: Deleting trainer failed'

--Delete a CC Number from a person
update Person set CCNumber = null where UserID = 'ALVAR'
IF @@ROWCOUNT <> 1 PRINT 'Error: Remove CC Number failed'

--Check final record count in all tables
SELECT * FROM Course
IF @@ROWCOUNT <> 15 PRINT 'Error: Count of courses should have been 15'
SELECT * FROM Person
IF @@ROWCOUNT <> 11 PRINT 'Error: Count of persons should have been 11'
SELECT * FROM RegistrationHeader
IF @@ROWCOUNT <> 9 PRINT 'Error: Count of registrations should have been 9'
SELECT * FROM RegistrationDetail
IF @@ROWCOUNT <> 13 PRINT 'Error: Count of details should have been 13'
