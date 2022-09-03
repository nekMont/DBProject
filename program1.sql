create table Video
    (videoCode   int,
     videoLength int, 
     primary key(videoCode));

create table Model
    (modelNo    char(10), 
     width      numeric(6,2),
     height     numeric(6,2), 
     weigth     numeric(6,2),
     depth      numeric(6,2),
     screenSize numeric(6,2),
     primary key (modelNo));

create table Site
    (siteCode   int,
     type       varchar(16), 
     address    varchar(100), 
     phone      varchar(16),
     primary key (siteCode),
     check (type in ('bar', 'restaurant')));

create table DigitalDisplay
    (serialNo           char(10),
     schedulerSystem    char(10),
     modelNo            char(10),
     primary key (serialNo),
     foreign key (modelNo) references Model(modelNo),
     check (schedulerSystem in ('Random', 'Smart', 'Virtue')));

create table Client
    (clientID   int,
     name       varchar(40),
     phone      varchar(16),
     address    varchar(100),
     primary key (clientID));

create table TechnicalSupport
    (empID  int,
     name   varchar(40),
     gender char(1),
     primary key (empID));

create table Administrator
    (empID  int, 
     name   varchar(40),
     gender char(1),
     primary key (empID));

create table Salesman
    (empID  int,
     name   varchar(40),
     gender char(1),
     primary key (empID));

create table AirtimePackage
    (packageID   int,
     class       varchar(16),
     startDate   date,
     lastDate    date,
     frequency   int,
     videoCode   int,
     primary key (packageID),
     check(class in ('economy', 'whole day', 'golden hours')));

create table AdmWorkHours
    (empID   int,
     day     date,
     hours   numeric(4,2),
     primary key (empID),
     foreign key (empID) references Administrator(empID));

create table Broadcasts
    (videoCode  int,
     siteCode   int,
     primary key (videoCode, siteCode),
     foreign key (videoCode) references Video(videoCode),
     foreign key (siteCode) references Site(siteCode));

create table Administers
    (empID      int,
     siteCode   int,
     primary key (empID, siteCode),
     foreign key (empID) references Administrator(empID),
     foreign key (siteCode) references Site(siteCode));

create table Specializes
    (empID      int,
     modelNo    char(10),
     primary key (empID, modelNo),
     foreign key (empID) references TechnicalSupport(empID),
     foreign key (modelNo) references Model(modelNo));

create table Purchases
    (clientID       int,
     empID          int,
     packageID      int,
     comissionRate  numeric(4,2),
     primary key (clientID, empID, packageID),
     foreign key (clientID) references Client(clientID),
     foreign key (empID) references Salesman(empID),
     foreign key (packageID) references AirtimePackage(packageID));

create table Locates
    (serialNo   char(10),
     siteCode   int,
     primary key (serialNo, siteCode),
     foreign key (serialNo) references DigitalDisplay(serialNo),
     foreign key (siteCode) references Site(siteCode));

