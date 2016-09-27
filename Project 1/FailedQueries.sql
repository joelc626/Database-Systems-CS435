--Joel Castro
--CS435 - Project 1
--
--Driver: Project1.sql
--FailQueries - will verify your constraints;
--none of the queries in this file should succeed.

--Table Course
print 'Missing ID'
INSERT INTO Course (CourseID, Name, Start, [End], Description, Price, Category, TrainerID)
  VALUES (null, 'Name'     , '2014-01-13 08:30:00', '2014-01-17 17:00:00', 'Introduction to SQL programming'    , 1500.00, 'Databases', 'ALVAR')

print 'Missing Name'
INSERT INTO Course (CourseID, Name, Start, [End], Description, Price, Category, TrainerID)
  VALUES (1439139597, null     , '2014-01-13 08:30:00', '2014-01-17 17:00:00', 'Introduction to SQL programming'    , 1500.00, 'Databases', 'ALVAR')

print 'Missing Start'
INSERT INTO Course (CourseID, Name, Start, [End], Description, Price, Category, TrainerID)
  VALUES (2439139597, 'Begining SQL'     , null, '2014-01-17 17:00:00', 'Introduction to SQL programming'    , 1500.00, 'Databases', 'ALVAR')

print 'Missing End'
INSERT INTO Course (CourseID, Name, Start, [End], Description, Price, Category, TrainerID)
  VALUES (3439139597, 'Name'     , '2014-01-13 08:30:00', null, 'Introduction to SQL programming'    , 1500.00, 'Databases', 'ALVAR')

print 'Duplicate ID'
INSERT INTO Course (CourseID, Name, Start, [End], Description, Price, Category, TrainerID)
  VALUES (0439139597, 'Duplicate'     , '2014-01-13 08:30:00', '2014-01-17 17:00:00', 'Introduction to SQL programming'    , 1500.00, 'Databases', 'ALVAR')

print 'Duplicate name-start'
INSERT INTO Course (CourseID, Name, Start, [End], Description, Price, Category, TrainerID)
  VALUES (4439139597, 'Begining SQL'     , '2014-01-13 08:30:00', '2014-01-17 17:00:00', 'Introduction to SQL programming'    , 1500.00, 'Databases', 'ALVAR')

print 'Invalid start end pair'
INSERT INTO Course (CourseID, Name, Start, [End], Description, Price, Category, TrainerID)
  VALUES (5439139597, 'Invalid'     , '2014-01-20 08:30:00', '2014-01-17 17:00:00', 'Introduction to SQL programming'    , 1500.00, 'Databases', 'ALVAR')

print 'Delete course with registration'
delete from Course where CourseID = 0439139597

-- Table Person
print 'Missing ID'
INSERT INTO Person (FName, LName, Address, City, State, Zip, Phone, Email, UserID, Password, CCType, CCNumber)
 values ('FName', 'LName', 'Address', 'City', 'ST', 'Zip', 'Phone', 'email', null, 'PWD', 'Discover', '1234567890123456')

print 'Missing First Name'
INSERT INTO Person (FName, LName, Address, City, State, Zip, Phone, Email, UserID, Password, CCType, CCNumber)
 values (null, 'LName', 'Address', 'City', 'ST', 'Zip', 'Phone', 'email', '1', 'PWD', 'Discover', '1234567890123456')

print 'Missing Last Name'
INSERT INTO Person (FName, LName, Address, City, State, Zip, Phone, Email, UserID, Password, CCType, CCNumber)
 values ('FName', null, 'Address', 'City', 'ST', 'Zip', 'Phone', 'email', '2', 'PWD', 'Discover', '1234567890123456')

print 'Missing Password'
INSERT INTO Person (FName, LName, Address, City, State, Zip, Phone, Email, UserID, Password, CCType, CCNumber)
 values ('FName', 'LName', 'Address', 'City', 'ST', 'Zip', 'Phone', 'email', '3', null, 'Discover', '1234567890123456')

print 'Duplicate ID'
INSERT INTO Person (FName, LName, Address, City, State, Zip, Phone, Email, UserID, Password, CCType, CCNumber)
 values ('FName', 'LName', 'Address', 'City', 'ST', 'Zip', 'Phone', 'email', 'ALVAR', 'PWD', 'Discover', '1234567890123456')

print 'Invalid CC Type'
INSERT INTO Person (FName, LName, Address, City, State, Zip, Phone, Email, UserID, Password, CCType, CCNumber)
 values ('FName', 'LName', 'Address', 'City', 'ST', 'Zip', 'Phone', 'email', '4', 'PWD', 'BAD', '1234567890123456')

print 'Invalid CC Number'
INSERT INTO Person (FName, LName, Address, City, State, Zip, Phone, Email, UserID, Password, CCType, CCNumber)
 values ('FName', 'LName', 'Address', 'City', 'ST', 'Zip', 'Phone', 'email', '5', 'PWD', 'Discover', 0)

print 'CC Number without CC Type'
INSERT INTO Person (FName, LName, Address, City, State, Zip, Phone, Email, UserID, Password, CCType, CCNumber)
 values ('FName', 'LName', 'Address', 'City', 'ST', 'Zip', 'Phone', 'email', '6', 'PWD', null, '1234567890123456')

print 'Null-out a CC Type'
update Person set CCType = null where UserID = 'BANKS'
update Person set ccNumber = '1234' where UserID = 'ATKIN'

print 'Duplicate email address'
INSERT INTO Person (FName, LName, Address, City, State, Zip, Phone, Email, UserID, Password, CCType, CCNumber)
 values ('FName', 'LName', 'Address', 'City', 'ST', 'Zip', 'Phone', 'Alvar@MailCenter.sample', '7', 'PWD', 'Discover', '1234567890123456')

print 'Zip Code is too long'
INSERT INTO Person (FName, LName, Address, City, State, Zip, Phone, Email, UserID, Password, CCType, CCNumber)
 values ('FName', 'LName', 'Address', 'City', 'ST', '1234567890123', 'Phone', 'email', '6', 'PWD', null, null)

print 'Delete Billing person'
delete from Person where UserID = 'JAMES'

print 'Delete Attendee'
delete from Person where UserID = 'ATKIN'

--Table RegistrationHeader
print 'Missing RegistrationNo'
INSERT INTO RegistrationHeader (RegistrationNo, BillingID, RegistrationDate, PaymentType, CCNumber, PoNumber, CheckNumber)
 values ( null, 'ALVAR',  '2012-11-21', 'Check', null, null, '0357951')

print 'Missing Billing ID'
INSERT INTO RegistrationHeader (RegistrationNo, BillingID, RegistrationDate, PaymentType, CCNumber, PoNumber, CheckNumber)
 values ( 101, null,  '2012-11-21', 'Check', null, null, '0357951')

print 'Missing Registration Date'
INSERT INTO RegistrationHeader (RegistrationNo, BillingID, RegistrationDate, PaymentType, CCNumber, PoNumber, CheckNumber)
 values ( 102, 'ALVAR',  null, 'Check', null, null, '0357951')

print 'Missing Payment Type'
INSERT INTO RegistrationHeader (RegistrationNo, BillingID, RegistrationDate, PaymentType, CCNumber, PoNumber, CheckNumber)
 values ( 103, 'ALVAR',  '2012-11-21', null, null, null, '0357951')

print 'Duplicate RegistrationNo'
INSERT INTO RegistrationHeader (RegistrationNo, BillingID, RegistrationDate, PaymentType, CCNumber, PoNumber, CheckNumber)
 values ( 1, 'ALVAR',  '2012-11-21', 'Check', null, null, '0357951')

print 'Invalid Billing ID'
INSERT INTO RegistrationHeader (RegistrationNo, BillingID, RegistrationDate, PaymentType, CCNumber, PoNumber, CheckNumber)
 values ( 104, 'NOBODY',  '2012-11-21', 'Check', null, null, '0357951')

print 'Missing Payment Type'
INSERT INTO RegistrationHeader (RegistrationNo, BillingID, RegistrationDate, PaymentType, CCNumber, PoNumber, CheckNumber)
 values ( 105, 'ALVAR',  '2012-11-21', null, null, null, null)

print 'Invalid Payment Type'
INSERT INTO RegistrationHeader (RegistrationNo, BillingID, RegistrationDate, PaymentType, CCNumber, PoNumber, CheckNumber)
 values ( 106, 'ALVAR',  '2012-11-21', 'None', null, null, null)

print 'CCType without CC Number'
INSERT INTO RegistrationHeader (RegistrationNo, BillingID, RegistrationDate, PaymentType, CCNumber, PoNumber, CheckNumber)
 values ( 107, 'ALVAR',  '2012-11-21', 'CC', null, null, null)

print 'CCType with PO Number'
INSERT INTO RegistrationHeader (RegistrationNo, BillingID, RegistrationDate, PaymentType, CCNumber, PoNumber, CheckNumber)
 values ( 108, 'ALVAR',  '2012-11-21', 'CC', 1234567890123456, '0357951', null)

print 'CCType with Check Number'
INSERT INTO RegistrationHeader (RegistrationNo, BillingID, RegistrationDate, PaymentType, CCNumber, PoNumber, CheckNumber)
 values ( 108, 'ALVAR',  '2012-11-21', 'CC', 1234567890123456, null, 0357951)

print 'Invalid CC Number'
INSERT INTO RegistrationHeader (RegistrationNo, BillingID, RegistrationDate, PaymentType, CCNumber, PoNumber, CheckNumber)
 values ( 109, 'ALVAR',  '2012-11-21', 'CC', 6, null, null)

print 'POType with CC Number'
INSERT INTO RegistrationHeader (RegistrationNo, BillingID, RegistrationDate, PaymentType, CCNumber, PoNumber, CheckNumber)
 values ( 110, 'ALVAR',  '2012-11-21', 'PO', 1234567890123456, 'PONumber', null)

print 'POType without PO Number'
INSERT INTO RegistrationHeader (RegistrationNo, BillingID, RegistrationDate, PaymentType, CCNumber, PoNumber, CheckNumber)
 values ( 111, 'ALVAR',  '2012-11-21', 'PO', null, null, null)

print 'Invalid PO Number'
INSERT INTO RegistrationHeader (RegistrationNo, BillingID, RegistrationDate, PaymentType, CCNumber, PoNumber, CheckNumber)
 values ( 112, 'ALVAR',  '2012-11-21', 'PO', null, '', null)

print 'POType with Check Number'
INSERT INTO RegistrationHeader (RegistrationNo, BillingID, RegistrationDate, PaymentType, CCNumber, PoNumber, CheckNumber)
 values ( 113, 'ALVAR',  '2012-11-21', 'PO', null, 'PONumber', 0357951)

print 'CheckType with CC Number'
INSERT INTO RegistrationHeader (RegistrationNo, BillingID, RegistrationDate, PaymentType, CCNumber, PoNumber, CheckNumber)
 values ( 114, 'ALVAR',  '2012-11-21', 'Check', 1234567890123456, null, 0357951)

print 'CheckType with PO Number'
INSERT INTO RegistrationHeader (RegistrationNo, BillingID, RegistrationDate, PaymentType, CCNumber, PoNumber, CheckNumber)
 values ( 114, 'ALVAR',  '2012-11-21', 'Check', null, 'PONumber', 0357951)

--Table Registration Detail
print 'Missing RegistrationNo'
INSERT INTO RegistrationDetail (RegistrationNo, LineNumber, CourseID, AttendeeID)
     VALUES ( null, 1, 0439139597, 'ALVAR')

print 'Invalid RegistrationNo'
INSERT INTO RegistrationDetail (RegistrationNo, LineNumber, CourseID, AttendeeID)
     VALUES ( 200, 1, 0439139597, 'ALVAR')

print 'Missing Line Number'
INSERT INTO RegistrationDetail (RegistrationNo, LineNumber, CourseID, AttendeeID)
     VALUES ( 1, null, 0439139597, 'ALVAR')

print 'Duplicate Line Number'
INSERT INTO RegistrationDetail (RegistrationNo, LineNumber, CourseID, AttendeeID)
     VALUES ( 1, 1, 0439139597, 'ALVAR')

print 'Missing Course ID'
INSERT INTO RegistrationDetail (RegistrationNo, LineNumber, CourseID, AttendeeID)
     VALUES ( 1, 3, null, 'ALVAR')

print 'Invalid Course ID'
INSERT INTO RegistrationDetail (RegistrationNo, LineNumber, CourseID, AttendeeID)
     VALUES ( 1, 4, 9439139597, 'ALVAR')

print 'Missing Attendee ID'
INSERT INTO RegistrationDetail (RegistrationNo, LineNumber, CourseID, AttendeeID)
     VALUES ( 1, 5, 0439139597, null)

print 'Invalid Attendee ID'
INSERT INTO RegistrationDetail (RegistrationNo, LineNumber, CourseID, AttendeeID)
     VALUES ( 1, 6, 0439139597, 'NOONE')



