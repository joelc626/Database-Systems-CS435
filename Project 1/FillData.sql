--Joel Castro
--CS435 - Project 1
--
--Driver: Project1.sql
--FillData - will populate your database; it should execute completely without any error.

INSERT INTO Person (FName, LName, Address, City, State, Zip, Phone, Email, UserID, Password, CCType, CCNumber)
 values ('Alicia',     'Alvarza',    '915 Birch Road',            'Detroit',       'MI', '48233-9211', '3126320943', 'Alvar@MailCenter.sample', 'ALVAR', 'D856EEC8', 'Discover', '1234567890123456')
      , ('Paul',       'Atkins',     null,                        'Winnetka',      'IL', '60093-9122', '2194083421', 'Atkin@MailCenter.sample', 'ATKIN', 'F5ED80A5', NULL, NULL)
      , ('Katherine',  'Banks',      '332 NE 45th Ave',           null,            'IN', '46802-3934', '4146492720', 'Banks@MailCenter.sample', 'BANKS', '69A488E2', 'MC', '9876543210123456')
      , ('Thomas',     'Black',      '4002 Washington Ave NE',    'Wauwatosa',     null, '53213-9515', '4026114377', 'Black@MailCenter.sample', 'BLACK', '179AD3A1', 'MC', '9513574862015874')
      , ('Jim',        'Cottrell',    '913 North Vine Hill Road',  'Omaha',        'NE', null        , '3093920442', 'Burne@MailCenter.sample', 'COTRL', '4BB59D68', 'Discover', '3698520147852013')
      , ('Rolando',    'Carnero',    '8662 Kennsington Ave. N',   'Bloomington',   'IL', '61701'     , '4024804754', 'Carne@MailCenter.sample', 'CARNE', '3D896333', 'Amex', '153248657598105')
      , ('Ruth',       'Crane',      '174 32 St NW',              'Omaha',         'NE', '68145-4554', null        , 'Crane@MailCenter.sample', 'CRANE', 'AAE8762C', 'Amex', '357951824657913')
      , ('James',      'Marshall',   '1410 Forsythe Blvd',        'Schiller Park', 'IL', '60186-1410', '3129874534', null                     , 'MARSH', '6D8B1EE3', 'MC', '0009468024568790')
      , ('Christine',  'Dubois',     '6118 Fairmount Ave.',       'Glenview',      'IL', '60025'     , '3177870503', 'Duboi@MailCenter.sample', 'DUBOI', '5DC585D1', 'Discover', '3197684257653535')
      , ('Charles',    'Erickson',   '74 Logan Estates',          'Carmel',        'IN', '46032-8674', '3129972322', 'Erick@MailCenter.sample', 'ERICK', '7C6920C9', 'Amex', null)
      , ('Jared',      'James',      '123 Peachtree',             'Atlanta',       'GA', '70551'     , null        , 'James@MailCenter.sample', 'JAMES', '8KH66L3S', null, null)
      , ('John',       'Jones',      null,                        null,            null, null        , null        , 'Jones@MailCenter.sample', 'JONES', '6K3MM34F', null, null)

INSERT INTO Course (CourseID, Name, Start, [End], Description, Price, Category, TrainerID)
  VALUES (0439139597, 'Begining SQL'     , '2014-01-13 08:30:00', '2014-01-17 17:00:00', 'Introduction to SQL programming'    , 1500.00, 'Databases', 'ALVAR')
       , (0439064864, 'Intermediate SQL' , '2014-01-20 08:30:00', '2014-01-24 17:00:00', 'In Depth SQL programming techniques', 1750.00, 'Databases', 'ATKIN')
       , (0439136350, 'Advanced SQL'     , '2014-01-27 08:30:00', '2014-01-31 17:00:00', 'Advanced SQL programming techniques', 2000.00, 'Databases', 'ATKIN')
       , (0345350499, 'Begining SQL'     , '2014-02-03 08:30:00', '2014-02-07 17:00:00', 'Introduction to SQL programming'    , 1500.00, 'Databases', 'ALVAR')
       , (0395851580, 'Intermediate SQL' , '2014-02-10 08:30:00', '2014-02-14 17:00:00', 'In Depth SQL programming techniques', 1750.00, 'Databases', 'ATKIN')
       , (0375810609, 'Advanced SQL'     , '2014-02-17 08:30:00', '2014-02-21 17:00:00', null                                 , 2000.00, 'Databases', 'JONES')
       , (0345337662, 'Begining C#'      , '2014-02-24 08:30:00', '2014-02-28 17:00:00', null                                 , null   , 'Programming', 'BANKS')
       , (0345377648, 'Advanced C#'      , '2014-03-03 08:30:00', '2014-03-07 17:00:00', null                                 , 1750.00, null         , 'BLACK')
       , (0345313860, 'Begining C#'      , '2014-03-10 08:30:00', '2014-03-14 17:00:00', null                                 , 1500.00, 'Programming', null)
       , (0345384750, 'Advanced C#'      , '2014-03-17 08:30:00', '2014-03-21 17:00:00', null                                 , 1750.00, 'Programming', 'BLACK')
       , (0201612585, 'TCP/IP Networking', '2014-03-24 08:30:00', '2014-03-28 17:00:00', null                                 , null, null, 'CRANE')
       , (0910146691, 'IP V6'            , '2014-03-31 08:30:00', '2014-04-04 17:00:00', null                                 , 2000.00, null, null)
       , (0887251714, 'Intro to HTML'    , '2014-04-07 08:30:00', '2014-04-11 17:00:00', null                                 , 1500.00, 'Web', 'COTRL')
       , (0030615372, 'HTML 5'           , '2014-04-14 08:30:00', '2014-04-18 17:00:00', null                                 , 1750.00, 'Web', 'COTRL')
       , (0201634422, 'CSS 3'            , '2014-04-21 08:30:00', '2014-04-25 17:00:00', null                                 , 1750.00, 'Web', 'COTRL')

INSERT INTO RegistrationHeader (RegistrationNo, BillingID, RegistrationDate, PaymentType, CCNumber, PoNumber, CheckNumber)
 values ( 1,  'ALVAR',  '2012-11-21', 'Check', null, null, '357951')
      , ( 2,  'ERICK',  '2013-01-05', 'PO'   , null, 'XZ004578', null)
      , ( 3,  'BANKS',  '2012-12-10', 'CC'   , '1234567890123456', null, null)
      , ( 4,  'BLACK',  '2012-12-15', 'Check', null, null, '357951')
      , ( 5,  'ERICK',  '2013-01-05', 'PO'   , null, '0009878923', null)
      , ( 6,  'ALVAR',  '2012-11-21', 'CC'   , '9876543210123456', null, null)
      , ( 7,  'CRANE',  '2012-12-18', 'Check', null, null, '357951')
      , ( 8,  'MARSH',  '2012-12-21', 'PO'   , null, 'PO000329853', null)
      , ( 9,  'ALVAR',  '2012-11-21', 'CC'   , '0003574862015874', null, null)
      , (10,  'JAMES',  '2013-01-05', 'Check', null, null, '357951')

INSERT INTO RegistrationDetail (RegistrationNo, LineNumber, CourseID, AttendeeID)
     VALUES ( 1, 1, 0439139597, 'ALVAR')
          , ( 1, 2, 0439064864, 'ATKIN')
          , ( 2, 1, 0439136350, 'ERICK')
          , ( 3, 1, 0345350499, 'BANKS')
          , ( 3, 2, 0395851580, 'COTRL')
          , ( 3, 3, 0375810609, 'CARNE')
          , ( 4, 1, 0345337662, 'BLACK')
          , ( 5, 1, 0345377648, 'ERICK')
          , ( 6, 1, 0439136350, 'ALVAR')
          , ( 6, 2, 0345384750, 'ATKIN')
          , ( 6, 3, 0201612585, 'DUBOI')
          , ( 7, 1, 0439136350, 'CRANE')
          , ( 7, 2, 0887251714, 'CARNE')
          , ( 7, 3, 0030615372, 'DUBOI')
          , ( 8, 1, 0439136350, 'MARSH')
          , ( 9, 1, 0345350499, 'ALVAR')
          , (10, 1, 0395851580, 'ERICK')
