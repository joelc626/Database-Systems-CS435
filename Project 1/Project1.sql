--Joel Castro
--CS435 - Project 1
--
--Driver: Project1.sql
--FillData, FailedQueries, ValidationQueries are files to verify the implementation.
--Assume that primary key values are never changed.

use master
go
if exists (select * from sys.databases where name = 'CS435')
begin
	ALTER DATABASE CS435 SET SINGLE_USER WITH ROLLBACK IMMEDIATE 
	drop database CS435
end
go
create database CS435
go

--MY CODE
use CS435

create table Course (
		  CourseID		varchar(10)
		, Name			varchar(100) not null
		, Start			date not null
		, [End]			date not null
		, Description	varchar(225)
		, Price			numeric(7,2)
		, Category		varchar(30)
		, TrainerID		varchar(30)
	, primary key (CourseID)
	, unique (CourseID)
	, unique (Name, Start)
	, check ([End] > Start) --if end < start then insert will fail
);

create table Person (
		  FName		varchar(15) not null
		, LName		varchar(25) not null
		, Address	varchar(100)
		, City		varchar(30)
		, State		varchar(30)
		, Zip		varchar(10)
		, Phone		varchar(15)
		, Email		varchar(60)
		, UserID	varchar(30)
		, Password	varchar(30) not null
		, CCType	varchar(10) constraint C_CCTypeIsValid check (CCType = 'Amex' 
							or CCType = 'Discover'
							or CCType = 'MC' or CCType = 'VISA')
		, CCNumber	varchar(16) constraint C_CC#IsNumericAndValidLen check (IsNumeric (CCNumber) = 1 and
									len(CCNumber) = 15 or len(CCNumber) = 16)
	, primary key (UserID)
	, unique (Email)
	, constraint C_IfCC#ThenHaveCCType check ((CCNumber is null) or (CCType is not null))
);

--Needs to be added after Person table is created
--The UserID of the trainer; must be a valid User ID in the Person table, hence "reference".
--If person is deleted then trainer set null
ALTER TABLE Course
	ADD foreign key(TrainerID) references Person(UserID) ON DELETE SET NULL;

create table RegistrationHeader (
		  RegistrationNo	integer
		, BillingID			varchar(30) not null
		, RegistrationDate	date not null
		, PaymentType		varchar(5) not null
									check (PaymentType = 'CC'
									or PaymentType = 'PO'
									or PaymentType = 'Check')
		, CCNumber			varchar(16) check (len(CCNumber) = 15 or len(CCNumber) = 16)
		, PONumber			varchar(30)
		, CheckNumber		varchar(10)
	, primary key(RegistrationNo)
	--person cannot be deleted if they are paying for registration.
	--"ON DELETE NO ACTION" is default, no need for it.
	, foreign key(BillingId) references Person(UserID) ON DELETE NO ACTION
	, constraint C_IfNotCCThenCC#IsNull check (PaymentType = 'CC' or CCNumber is null)
	, constraint C_IfCCThenCCNum check (PaymentType != 'CC' or CCNumber is not null)
	, constraint C_IfNotPOThenPO#IsNull check(PaymentType = 'PO' or PONumber is null)
	, constraint C_IfPOThenPO#IsNotNull check (PaymentType != 'PO' or PONumber is not null)
	, constraint C_IfPOThenPO#IsNotBlank check (PaymentType != 'PO' or PONumber != '')
	, constraint C_IfNotCheckThenCheck#IsNull check((PaymentType = 'Check') or (CheckNumber is null))
);

create table RegistrationDetail (
		  RegistrationNo	integer
		, LineNumber		integer
		, CourseID			varchar(10) not null
		, AttendeeID		varchar(30) not null
		, primary key(RegistrationNo, LineNumber)
		, foreign key(CourseID) references Course(CourseID)
		, foreign key(AttendeeID) references Person(UserID)
);

--Needs to be added after RegistrationDetail table is created
--Deleting a Registration Header must automatically delete the registration details.
ALTER TABLE RegistrationDetail
	ADD foreign key(RegistrationNo) references RegistrationHeader(RegistrationNo) ON DELETE CASCADE