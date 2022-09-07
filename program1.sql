create table Video
    (videoCode   int,
     videoLength int, 
     primary key(videoCode));
     
insert into Video
    values(24, 4);
insert into Video
    values(66, 2);
insert into Video
    values(124, 400);


create table Model
    (modelNo    char(10), 
     width      numeric(6,2),
     height     numeric(6,2), 
     weigth     numeric(6,2),
     depth      numeric(6,2),
     screenSize numeric(6,2),
     primary key (modelNo));
     
insert into Model
    values('12-BF5', 123.33, 124.44, 12.45, 134.44, 13.5);
insert into Model
    values('12-FXS', 123.33, 124.44, 12.45, 134.44, 13.5);
insert into Model
    values('12-NekMon', 123.33, 124.44, 12.45, 134.44, 13.5);
insert into Model
    values('12-AleFLor', 123.33, 124.44, 12.45, 134.44, 13.5);


create table Site
    (siteCode   int,
     type       varchar(16), 
     address    varchar(100), 
     phone      varchar(16),
     primary key (siteCode),
     check (type in ('bar', 'restaurant')));

insert into Site
    values(125, 'bar', '44 East Peninsula Street Chevy Chase, MD 20815', '915-746-1234');
insert into Site
    values(132, 'restaurant', '5 Taylor St. Tampa, FL 33604', '915-566-1426');
insert into Site
    values(505, 'bar', '224 West Bayport Lane Fullerton, CA 92831', '915-676-4321');


create table DigitalDisplay
    (serialNo           char(10),
     schedulerSystem    char(10),
     modelNo            char(10),
     primary key (serialNo),
     foreign key (modelNo) references Model(modelNo),
     check (schedulerSystem in ('Random', 'Smart', 'Virtue')));

insert into DigitalDisplay 
    values('4CEO0460D0', 'Random', '12-AleFLor');
insert into DigitalDisplay 
    values('3VFO14104A', 'Smart', '12-BF5');
insert into DigitalDisplay 
    values('6CEO05900D', 'Random', '12-FXS');
insert into DigitalDisplay 
    values('4CFO146A0A', 'Virtue', '12-NekMon');


create table Client
    (clientID   int,
     name       varchar(40),
     phone      varchar(16),
     address    varchar(100),
     primary key (clientID));

insert into Client 
    values(44, 'Bob Mendez', '334-445-2314', '881 Durham Ave. Fairborn, OH 45324');
insert into Client 
    values(8, 'Scott Woz', '887-456-5416', '9001 N. Studebaker Road Toms River, NJ 08753');
insert into Client 
    values(122, 'Frank Woods', '614-644-5362', '49 Leatherwood St. Melbourne, FL 32904');


create table TechnicalSupport
    (empID  int,
     name   varchar(40),
     gender char(1),
     primary key (empID));

insert into TechnicalSupport 
    values(2335, 'Josh Benson', 'M');
insert into TechnicalSupport 
    values(2456, 'Fred King', 'M');
insert into TechnicalSupport 
    values(1231, 'Mia Ming', 'F');
insert into TechnicalSupport 
    values(1244, 'Ashley Bennet', 'F');
insert into TechnicalSupport 
    values(4556, 'Frank Sea', 'M');


create table Administrator
    (empID  int, 
     name   varchar(40),
     gender char(1),
     primary key (empID));
     
insert into Administrator 
    values(134, 'John F. Kennedy', 'M');
insert into Administrator 
    values(457, 'Doja Cat', 'F');
insert into Administrator 
    values(253, 'Jonathan Joestar', 'M');
     

create table Salesman
    (empID  int,
     name   varchar(40),
     gender char(1),
     primary key (empID));

insert into Salesman 
    values(2352, 'John Gucci', 'M');
insert into Salesman 
    values(2876, 'Elvis Scott', 'M');
insert into Salesman 
    values(2596, 'Lily Paige', 'F');
insert into Salesman 
    values(2234, 'Isabella Hendrix', 'F');


create table AirtimePackage
    (packageID   int,
     class       varchar(16),
     startDate   date,
     lastDate    date,
     frequency   int,
     videoCode   int,
     primary key (packageID),
     check(class in ('economy', 'whole day', 'golden hours')));

insert into AirtimePackage 
    values(8752, 'economy', '2022-08-01', '2023-08-01', 23, 98764);
insert into AirtimePackage 
    values(4649, 'whole day', '2022-08-01', '2023-08-08', 45, 73890);
insert into AirtimePackage 
    values(9884, 'golden hours', '2022-08-01', '2023-09-01', 96, 48767);


create table AdmWorkHours
    (empID   int,
     day     date,
     hours   numeric(4,2),
     primary key (empID),
     foreign key (empID) references Administrator(empID));

insert into AdmWorkHours 
    values(134, '2022-09-05', 6.5);
insert into AdmWorkHours 
    values(457, '2022-09-06', 4.0);
insert into AdmWorkHours 
    values(253, '2022-09-07', 8.0);


create table Broadcasts
    (videoCode  int,
     siteCode   int,
     primary key (videoCode, siteCode),
     foreign key (videoCode) references Video(videoCode),
     foreign key (siteCode) references Site(siteCode));

insert into Broadcasts 
    values(24, 125);
insert into Broadcasts 
    values(66, 132);
insert into Broadcasts 
    values(124, 505);


create table Administers
    (empID      int,
     siteCode   int,
     primary key (empID, siteCode),
     foreign key (empID) references Administrator(empID),
     foreign key (siteCode) references Site(siteCode));

insert into Administers 
    values(134, 132);
insert into Administers 
    values(457, 505);
insert into Administers 
    values(253, 125);


create table Specializes
    (empID      int,
     modelNo    char(10),
     primary key (empID, modelNo),
     foreign key (empID) references TechnicalSupport(empID),
     foreign key (modelNo) references Model(modelNo));

insert into Specializes 
    values(2335, '12-BF5');
insert into Specializes 
    values(1231, '12-FXS');
insert into Specializes 
    values(2456, '12-BF5');
insert into Specializes 
    values(4556, '12-NekMon');
insert into Specializes 
    values(1244, '12-AleFLor');
    

create table Purchases
    (clientID       int,
     empID          int,
     packageID      int,
     comissionRate  numeric(4,2),
     primary key (clientID, empID, packageID),
     foreign key (clientID) references Client(clientID),
     foreign key (empID) references Salesman(empID),
     foreign key (packageID) references AirtimePackage(packageID));

insert into Purchases 
    values(44, 2352, 8752, .10);
insert into Purchases 
    values(8, 2596, 4649, .15);
insert into Purchases 
    values(122, 2234, 9884, .08);


create table Locates
    (serialNo   char(10),
     siteCode   int,
     primary key (serialNo, siteCode),
     foreign key (serialNo) references DigitalDisplay(serialNo),
     foreign key (siteCode) references Site(siteCode));
     
insert into Locates 
    values('4CEO0460D0', 125);
insert into Locates 
    values('4CFO146A0A', 132);
insert into Locates 
    values('3VFO14104A', 125);
insert into Locates 
    values('6CEO05900D', 505);
insert into Locates 
    values('4CEO0460D0', 132);