-- Generated by Oracle SQL Developer Data Modeler 4.0.0.833
--   at:        2016-12-12 18:24:56 EST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g

DROP TABLE Client CASCADE constraints;
Drop TABLE Events;
DROP TABLE ZipCode CASCADE constraints;
DROP TABLE Location;
DROP TABLE Food;
DROP TABLE Music;
DROP TABLE Entertainer;
DROP TABLE Florist;
DROP TABLE Linen;
DROP TABLE Photographer;
DROP TABLE Events_History;

DROP SEQUENCE CLIENTSEQ;
DROP SEQUENCE ENTSEQ;
DROP SEQUENCE EVENTHISTORYSEQ;
DROP SEQUENCE EVENTSEQ;
DROP SEQUENCE FLORISTSEQ;
DROP SEQUENCE LINENSEQ;
DROP SEQUENCE LOCATIONSEQ;
DROP SEQUENCE MENUSEQ;
DROP SEQUENCE MUSICSEQ;
DROP SEQUENCE PHOTOGRAPHERSEQ;

-- Create table  

CREATE TABLE Client
  (
    client_Id         INTEGER CONSTRAINT NNC_Client_client_Id NOT NULL ,
    client_First_Name VARCHAR2 (50 CHAR) ,
    client_Last_Name  VARCHAR2 (50 CHAR) ,
    client_Phone      VARCHAR2 (12) ,
    client_Street     VARCHAR2 (50 CHAR) ,
    client_Zipcode    INTEGER NOT NULL,
    Created_By		varchar2(30) default user,
    Created_Date	DATE default sysdate,
    Updated_By		varchar(30) default user,
    Updated_Date	DATE default sysdate
  ) ;
ALTER TABLE Client ADD CONSTRAINT Client_PK PRIMARY KEY ( client_Id ) ;

CREATE TABLE Events
  (
    event_Id                 INTEGER NOT NULL ,
    event_Name               VARCHAR2 (50 CHAR) ,
    event_Date               DATE ,
    event_Type               VARCHAR2 (50) ,
    event_Start_Time         TIMESTAMP WITH LOCAL TIME ZONE ,
    event_Location_Id        INTEGER NOT NULL ,
    event_Guest_Number       INTEGER ,
    event_NumberOfWaiters    INTEGER ,
    event_NumberOfBartenders INTEGER ,
    event_Linen_Id           INTEGER NOT NULL ,
    event_Food_Id            INTEGER NOT NULL ,
    event_Florist_Id         INTEGER NOT NULL ,
    event_Music_Id           INTEGER NOT NULL ,
    event_Entertainer_Id     INTEGER NOT NULL ,
    event_Photographer_Id    INTEGER NOT NULL ,
    event_Client_Id          INTEGER NOT NULL ,
    event_Cost               INTEGER,
    Created_By		           varchar2(30) default user,
    Created_Date	           DATE default sysdate,
    Updated_By		           varchar(30) default user,
    Updated_Date	           DATE default sysdate
  ) ;
ALTER TABLE Events ADD CONSTRAINT Events_PK PRIMARY KEY ( event_Id ) ;

CREATE TABLE Events_History
  (
    event_Id                 INTEGER NOT NULL ,
    event_Name               VARCHAR2 (50 CHAR) ,
    event_Date               DATE ,
    event_Type               VARCHAR2 (50) ,
    event_Start_Time         TIMESTAMP WITH LOCAL TIME ZONE ,
    event_Location_Id        INTEGER NOT NULL ,
    event_Guest_Number       INTEGER ,
    event_NumberOfWaiters    INTEGER ,
    event_NumberOfBartenders INTEGER ,
    event_Linen_Id           INTEGER NOT NULL ,
    event_Food_Id            INTEGER NOT NULL ,
    event_Florist_Id         INTEGER NOT NULL ,
    event_Music_Id           INTEGER NOT NULL ,
    event_Entertainer_Id     INTEGER NOT NULL ,
    event_Photographer_Id    INTEGER NOT NULL ,
    event_Client_Id          INTEGER NOT NULL ,
    event_Cost               INTEGER,
    Created_By		           varchar2(30) default user,
    Created_Date	           DATE default sysdate,
    Updated_By		           varchar(30) default user,
    Updated_Date	           DATE default sysdate
  ) ;
ALTER TABLE Events_History ADD CONSTRAINT Events_History_PK PRIMARY KEY ( event_Id ) ;

CREATE TABLE Entertainer
  (
    entertainer_Id    INTEGER NOT NULL ,
    entertainer_Name  VARCHAR2 (50 CHAR) ,
    entertainer_Phone VARCHAR2 (12) ,
    entertainer_Type  VARCHAR2 (50 CHAR) ,
    entertainer_Price INTEGER
  ) ;
ALTER TABLE Entertainer ADD CONSTRAINT Entertainer_PK PRIMARY KEY ( entertainer_Id ) ;
CREATE TABLE Florist
  (
    florist_Id    INTEGER NOT NULL ,
    florist_Name  VARCHAR2 (50) ,
    florist_Phone VARCHAR2 (12) ,
    florist_Price INTEGER
  ) ;
ALTER TABLE Florist ADD CONSTRAINT Florist_PK PRIMARY KEY ( florist_Id ) ;

CREATE TABLE Food
  (
    food_Id          INTEGER NOT NULL ,
    food_Description VARCHAR2 (250 CHAR) ,
    food_Price       INTEGER
  ) ;
ALTER TABLE Food ADD CONSTRAINT Food_PK PRIMARY KEY ( food_Id ) ;

CREATE TABLE Linen
  (
    linen_Id     INTEGER NOT NULL ,
    linen_Colour VARCHAR2 (50) ,
    linen_Price  INTEGER
  ) ;
ALTER TABLE Linen ADD CONSTRAINT Linen_PK PRIMARY KEY ( linen_Id ) ;

CREATE TABLE Location
  (
    location_Id      INTEGER NOT NULL ,
    location_Name    VARCHAR2 (50 CHAR) ,
    location_Street  VARCHAR2 (50 CHAR) ,
    location_Zipcode INTEGER NOT NULL,
    Created_By		           varchar2(30) default user,
    Created_Date	           DATE default sysdate,
    Updated_By		           varchar(30) default user,
    Updated_Date	           DATE default sysdate
  ) ;
ALTER TABLE Location ADD CONSTRAINT Location_PK PRIMARY KEY ( location_Id ) ;

CREATE TABLE Music
  (
    music_Id      INTEGER NOT NULL ,
    music_Contact VARCHAR2 (12) ,
    music_Price   INTEGER ,
    music_Type    INTEGER
  ) ;
ALTER TABLE Music ADD CONSTRAINT Musician_PK PRIMARY KEY ( music_Id ) ;

CREATE TABLE Photographer
  (
    photographer_Id    INTEGER NOT NULL ,
    photographer_Name  VARCHAR2 (50) ,
    photographer_Phone VARCHAR2 (12) ,
    photographer_Price INTEGER
  ) ;
ALTER TABLE Photographer ADD CONSTRAINT Photographer_PK PRIMARY KEY ( photographer_Id ) ;

CREATE TABLE ZipCode
  (
    zipCode   INTEGER NOT NULL ,
    zip_City  VARCHAR2 (50 CHAR) ,
    zip_State VARCHAR2 (50 CHAR)
  ) ;
ALTER TABLE ZipCode ADD CONSTRAINT ZipCode_PK PRIMARY KEY ( zipCode ) ;

ALTER TABLE Client ADD CONSTRAINT Client_ZipCode_FK FOREIGN KEY ( client_Zipcode ) REFERENCES ZipCode ( zipCode ) ;

ALTER TABLE Events ADD CONSTRAINT Events_Client_FK FOREIGN KEY ( event_Client_Id ) REFERENCES Client ( client_Id ) ;

ALTER TABLE Events ADD CONSTRAINT Events_Entertainer_FK FOREIGN KEY ( event_Entertainer_Id ) REFERENCES Entertainer ( entertainer_Id ) ;

ALTER TABLE Events ADD CONSTRAINT Events_Florist_FK FOREIGN KEY ( event_Florist_Id ) REFERENCES Florist ( florist_Id ) ;

ALTER TABLE Events ADD CONSTRAINT Events_Food_FK FOREIGN KEY ( event_Food_Id ) REFERENCES Food ( food_Id ) ;

ALTER TABLE Events ADD CONSTRAINT Events_Linen_FK FOREIGN KEY ( event_Linen_Id ) REFERENCES Linen ( linen_Id ) ;

ALTER TABLE Events ADD CONSTRAINT Events_Location_FK FOREIGN KEY ( event_Location_Id ) REFERENCES Location ( location_Id ) ;

ALTER TABLE Events ADD CONSTRAINT Events_Music_FK FOREIGN KEY ( event_Music_Id ) REFERENCES Music ( music_Id ) ;

ALTER TABLE Events ADD CONSTRAINT Events_Photographer_FK FOREIGN KEY ( event_Photographer_Id ) REFERENCES Photographer ( photographer_Id ) ;

ALTER TABLE Location ADD CONSTRAINT Location_ZipCode_FK FOREIGN KEY ( location_Zipcode ) REFERENCES ZipCode ( zipCode ) ;

-- Create indexs on FK

CREATE UNIQUE INDEX ClientID_IND ON Events (event_Client_Id);
CREATE UNIQUE INDEX LocID_IND ON Events (event_Location_Id);
CREATE UNIQUE INDEX PhotoID_IND ON Events (event_Photographer_Id);
CREATE UNIQUE INDEX Entr_IND ON Events (event_Entertainer_Id);
CREATE UNIQUE INDEX Flor_IND ON Events (event_Florist_Id);
CREATE UNIQUE INDEX Musi_IND ON Events (event_Music_Id);
CREATE UNIQUE INDEX Linen_IND ON Events (event_Linen_Id);
CREATE UNIQUE INDEX Food_IND ON Events (event_Food_Id);

-- Add constraints on tables

ALTER TABLE Events ADD CONSTRAINT event_key UNIQUE (event_Client_Id, event_Date, event_Start_Time);

ALTER TABLE Client ADD CONSTRAINT client_name UNIQUE (client_First_Name);

ALTER TABLE Location ADD CONSTRAINT unique_location UNIQUE (location_Name);

-- Create Sequences

CREATE SEQUENCE ClientSeq
    START WITH 1
    INCREMENT BY 1 ;
    
CREATE SEQUENCE LocationSeq
    START WITH 1
    INCREMENT BY 1 ;
       
CREATE SEQUENCE LinenSeq
    START WITH 1
    INCREMENT BY 1 ;
    
CREATE SEQUENCE FloristSeq
    START WITH 1
    INCREMENT BY 1 ;
    
CREATE SEQUENCE PhotoGrapherSeq
    START WITH 1
    INCREMENT BY 1 ;

CREATE SEQUENCE EntSeq
    START WITH 1
    INCREMENT BY 1 ;
    
CREATE SEQUENCE MusicSeq
    START WITH 1
    INCREMENT BY 1 ;

CREATE SEQUENCE MenuSeq
    START WITH 1
    INCREMENT BY 1 ;    
   
CREATE SEQUENCE EventSeq
    START WITH 1
    INCREMENT BY 1 ;
 
CREATE SEQUENCE EventHistorySeq
    START WITH 1
    INCREMENT BY 1 ;   
	
	
--Insert Data into tables

Insert into ZIPCode values ('20004', 'Washington','District of Columbia');
Insert into ZIPCode values ('20005', 'Washington','District of Columbia');
Insert into ZIPCode values ('20009', 'Washington','District of Columbia');
Insert into ZIPCode values ('20010', 'Washington','District of Columbia');
Insert into ZIPCode values ('20011', 'Washington','District of Columbia');
Insert into ZIPCode values ('20012', 'Washington','District of Columbia');
Insert into ZIPCode values ('20013', 'Washington','District of Columbia');
Insert into ZIPCode values ('20101', 'Dulles','Virginia');
Insert into ZIPCode values ('20102', 'Dulles','Virginia');
Insert into ZIPCode values ('20103', 'Dulles','Virginia');
Insert into ZIPCode values ('20601', 'Waldrof','Maryland');
Insert into ZIPCode values ('20639', 'Huntingtown','Maryland');
Insert into ZIPCode values ('20707', 'Laurel','Maryland');
Insert into ZIPCode values ('10003', 'New York','New York');
Insert into ZIPCode values ('10018', 'New York','New York');

Insert into CLIENT values (ClientSeq.NextVaL,'Client Origins','NA', 2027423499,'1331 Pennsylvania Ave NW', 20011,null,null,null,null);
Insert into CLIENT values (ClientSeq.NextVaL,'Bank of America','NA',2027423499,'700 13th St NW',20012,null,null,null,null);
Insert into CLIENT values (ClientSeq.NextVaL,'The New York Times','NA',2023467890,'374 34th St',20013,null,null,null,null);
Insert into CLIENT values (ClientSeq.NextVaL,'WallMart','NA',2027387828,'620 8th Ave',20013,null,null,null,null);
Insert into CLIENT values (ClientSeq.NextVaL,'CapitalOne','NA',2023467843,'763 5th Ave',10018,null,null,null,null);
Insert into CLIENT values (ClientSeq.NextVaL,'AWS','NA',2023467345,'6872 E Street NW',10003,null,null,null,null);
Insert into CLIENT values (ClientSeq.NextVaL,'Google','NA',2023467347,'1200 8th St NE',20601,null,null,null,null);
Insert into CLIENT values (ClientSeq.NextVaL,'Microsoft','NA',2023434788,'2400 Virginia Ave',20639,null,null,null,null);
Insert into CLIENT values (ClientSeq.NextVaL,'Facebook','NA',2023462677,'501 34th St',20013,null,null,null,null);
Insert into CLIENT values (ClientSeq.NextVaL,'Twitter','NA',2027838903,'1800 Queens Ave',20707,null,null,null,null);
Insert into CLIENT values (ClientSeq.NextVaL,'LinkedIn','NA',2023469838,'438 3rd Ave',10003,null,null,null,null);
Insert into CLIENT values (ClientSeq.NextVaL,'CitiBank','NA',2029273789,'7390 G Street',20009,null,null,null,null);
Insert into CLIENT values (ClientSeq.NextVaL,'Delloite','NA',2022368728,'8930 New Hampshire Ave',20005,null,null,null,null);
Insert into CLIENT values (ClientSeq.NextVaL,'TCS','NA',2027982393,'6738 NW Ave',10018,null,null,null,null);
Insert into CLIENT values (ClientSeq.NextVaL,'EY','NA',2026782384,'8938 I Street',20639,null,null,null,null);


Insert into LOCATION values (LocationSeq.NextVaL,'Client Origins','1331 Pennsylvania Ave NW', 20011,null,null,null,null);
Insert into LOCATION values (LocationSeq.NextVaL,'Bank of America','700 13th St NW',20012,null,null,null,null);
Insert into LOCATION values (LocationSeq.NextVaL,'The New York Times','374 34th St',20013,null,null,null,null);
Insert into LOCATION values (LocationSeq.NextVaL,'WallMart','620 8th Ave',20013,null,null,null,null);
Insert into LOCATION values (LocationSeq.NextVaL,'CapitalOne','763 5th Ave',10018,null,null,null,null);
Insert into LOCATION values (LocationSeq.NextVaL,'AWS','6872 E Street NW',10003,null,null,null,null);
Insert into LOCATION values (LocationSeq.NextVaL,'Google','1200 8th St NE',20601,null,null,null,null);
Insert into LOCATION values (LocationSeq.NextVaL,'Microsoft','2400 Virginia Ave',20639,null,null,null,null);
Insert into LOCATION values (LocationSeq.NextVaL,'Facebook','501 34th St',20013,null,null,null,null);
Insert into LOCATION values (LocationSeq.NextVaL,'Twitter','1800 Queens Ave',20707,null,null,null,null);
Insert into LOCATION values (LocationSeq.NextVaL,'LinkedIn','438 3rd Ave',10003,null,null,null,null);
Insert into LOCATION values (LocationSeq.NextVaL,'CitiBank','7390 G Street',20009,null,null,null,null);
Insert into LOCATION values (LocationSeq.NextVaL,'Delloite','8930 New Hampshire Ave',20005,null,null,null,null);
Insert into LOCATION values (LocationSeq.NextVaL,'TCS','6738 NW Ave',10018,null,null,null,null);
Insert into LOCATION values (LocationSeq.NextVaL,'EY','8938 I Street',20639,null,null,null,null);


Insert into FLORIST VALUES (FloristSeq.NextVal,'Caruso Florist',2022233816,500);
Insert into FLORIST VALUES (FloristSeq.NextVal,'Nosegay Flowers',2023381146,400);
Insert into FLORIST VALUES (FloristSeq.NextVal,'Flowers On Fourteenth',2026677888,450);
Insert into FLORIST VALUES (FloristSeq.NextVal,'Flowers Flowers',2026872367,550);
Insert into FLORIST VALUES (FloristSeq.NextVal,'Florist of Heaven',2026782337,350);
Insert into FLORIST VALUES (FloristSeq.NextVal,'Haven Flowers',2022348767,250);
Insert into FLORIST VALUES (FloristSeq.NextVal,'Flowers Inclined',2025192730,290);
Insert into FLORIST VALUES (FloristSeq.NextVal,'Occasions Flowers',2026097257,300);
Insert into FLORIST VALUES (FloristSeq.NextVal,'Classic Florist',2021283475,350);
Insert into FLORIST VALUES (FloristSeq.NextVal,'Flowers Of Tomorrow',2020947384,350);
Insert into FLORIST VALUES (FloristSeq.NextVal,'Flowers And Ferns',2020845372,400);
Insert into FLORIST VALUES (FloristSeq.NextVal,'Ferns and Petals',2029726374,550);
Insert into FLORIST VALUES (FloristSeq.NextVal,'Petals On Occasions',202036273,500);
Insert into FLORIST VALUES (FloristSeq.NextVal,'Petals and Ferns',2028363729,520);
Insert into FLORIST VALUES (FloristSeq.NextVal,'Flowers Decorations',2029846327, 275);



Insert into PHOTOGRAPHER VALUES (PhotoGrapherSeq.NextVal,'DuHon Photography',2026414889,600);
Insert into PHOTOGRAPHER VALUES (PhotoGrapherSeq.NextVal,'Sam Hurd Photography',4344265018,700);
Insert into PHOTOGRAPHER VALUES (PhotoGrapherSeq.NextVal,'Moshe Zusman Photography',2025067218,750);
Insert into PHOTOGRAPHER VALUES (PhotoGrapherSeq.NextVal,'BT Photography',2025067218,650);
Insert into PHOTOGRAPHER VALUES (PhotoGrapherSeq.NextVal,'Max Photography',2025067218,600);
Insert into PHOTOGRAPHER VALUES (PhotoGrapherSeq.NextVal,'New Man Photography',2025067218,620);
Insert into PHOTOGRAPHER VALUES (PhotoGrapherSeq.NextVal,'Windon Photography',2025067218,755);
Insert into PHOTOGRAPHER VALUES (PhotoGrapherSeq.NextVal,'All Hell Breaks Loose Photography',2025067218,775);
Insert into PHOTOGRAPHER VALUES (PhotoGrapherSeq.NextVal,'Ocassions Photography',2025067218,650);
Insert into PHOTOGRAPHER VALUES (PhotoGrapherSeq.NextVal,'Pictures Photography',2025067218,600);
Insert into PHOTOGRAPHER VALUES (PhotoGrapherSeq.NextVal,'LowCost Photography',2025067218,645);
Insert into PHOTOGRAPHER VALUES (PhotoGrapherSeq.NextVal,'NotOld Photography',2025067218,675);
Insert into PHOTOGRAPHER VALUES (PhotoGrapherSeq.NextVal,'Pics on Hire',2025067218,725);
Insert into PHOTOGRAPHER VALUES (PhotoGrapherSeq.NextVal,'Clicks and Snaps',2025067218,700);
Insert into PHOTOGRAPHER VALUES (PhotoGrapherSeq.NextVal,'Snapshots',2025067218,670);

Insert into ENTERTAINER VALUES (EntSeq.NextVal,'Capitol Steps',2023121555,'Comedy',750);
Insert into ENTERTAINER VALUES (EntSeq.NextVal, 'The Walt Disney Company',2022224810,'Comedy',800);
Insert into ENTERTAINER VALUES (EntSeq.NextVal, 'Aloha Luau Entertainment',2022438484,'Comedy',900);
Insert into ENTERTAINER VALUES (EntSeq.NextVal, 'Charlies Entertainment',2023682837,'Comedy',1470);
Insert into ENTERTAINER VALUES (EntSeq.NextVal, 'People With Smiles',2022438437,'Comedy',1780);
Insert into ENTERTAINER VALUES (EntSeq.NextVal, 'Draft House',2022438445,'Comedy',940);
Insert into ENTERTAINER VALUES (EntSeq.NextVal, 'CarPool',2022438345,'Comedy',1647);
Insert into ENTERTAINER VALUES (EntSeq.NextVal, 'Big Dady Comics',2022438753,'Comedy',960);
Insert into ENTERTAINER VALUES (EntSeq.NextVal, 'LOL',2022433457,'Comedy',990);
Insert into ENTERTAINER VALUES (EntSeq.NextVal, 'Laugh Till You Drop',2022432737,'Comedy',1000);
Insert into ENTERTAINER VALUES (EntSeq.NextVal, 'Maximum Entertainmet',2022362839,'Comedy',990);
Insert into ENTERTAINER VALUES (EntSeq.NextVal, 'Jokers of Elm Street',2022432834,'Comedy',1000);
Insert into ENTERTAINER VALUES (EntSeq.NextVal, 'Jonny Walker',2022430239,'Comedy',1300);
Insert into ENTERTAINER VALUES (EntSeq.NextVal, 'Empty Pitchers',2022430094,'Comedy',1200);
Insert into ENTERTAINER VALUES (EntSeq.NextVal, 'AIB',2022433845,'Comedy',2800);
Insert into ENTERTAINER VALUES (EntSeq.NextVal, 'Big Daddy',2022433545,'Comedy',1350);
Insert into ENTERTAINER VALUES (EntSeq.NextVal, 'Sweet drama',2022663845,'Comedy',2000);

Insert into MUSIC VALUES (MusicSeq.NextVal,3015891001,700,1);
Insert into MUSIC VALUES (MusicSeq.NextVal,7036606025,750,1);
Insert into MUSIC VALUES (MusicSeq.NextVal,7036623443,850,1);
Insert into MUSIC VALUES (MusicSeq.NextVal,7036234454,770,1);
Insert into MUSIC VALUES (MusicSeq.NextVal,7036634534,900,1);
Insert into MUSIC VALUES (MusicSeq.NextVal,7036606345,940,1);
Insert into MUSIC VALUES (MusicSeq.NextVal,7036634565,970,1);
Insert into MUSIC VALUES (MusicSeq.NextVal,7036600923,960,1);
Insert into MUSIC VALUES (MusicSeq.NextVal,7036602937,736,1);
Insert into MUSIC VALUES (MusicSeq.NextVal,7036606027,930,1);
Insert into MUSIC VALUES (MusicSeq.NextVal,7036609853,900,1);
Insert into MUSIC VALUES (MusicSeq.NextVal,7036606986,935,1);
Insert into MUSIC VALUES (MusicSeq.NextVal,7036606923,1000,1);
Insert into MUSIC VALUES (MusicSeq.NextVal,7036698237,1200,1);
Insert into MUSIC VALUES (MusicSeq.NextVal,7036602386,1500,1);

Insert into FOOD VALUES (MenuSeq.NextVal,'Parmesian Garlic Cheese Bread,Chicken Salad,Lasagna,Lemon Meringue Cheesecake',1000);
Insert into FOOD VALUES (MenuSeq.NextVal,'Southern Fried Chicken Sliders,Chicken Salad,Lasagna,Lemon Meringue Cheesecake',950);
Insert into FOOD VALUES (MenuSeq.NextVal,'Factory Nachos,Chicken Salad,Lasagna,Lemon Meringue Cheesecake',850);
Insert into FOOD VALUES (MenuSeq.NextVal,'Parmesian Garlic Cheese,Bread	Chicken Salad,Lasagna,Lemon Meringue,Cheesecake
',900);
Insert into FOOD VALUES (MenuSeq.NextVal,'Southern Fried Chicken Sliders,Chicken Salad,Lasagna,Lemon Meringue Cheesecake',890);
Insert into FOOD VALUES (MenuSeq.NextVal,'Southern Fried Chicken Sliders,Chicken Salad,Roasted Chicken Breast,Sorbet du Jour',1000);
Insert into FOOD VALUES (MenuSeq.NextVal,'Grilled Shrimp Cocktail,Arugula Salad,Crab Cake,Lemon Meringue Cheesecake',1200);
Insert into FOOD VALUES (MenuSeq.NextVal,'Pulled Pork Potstickers,Arugula Salad,House-Made Potato Gnocchi,Bread Pudding',900);
Insert into FOOD VALUES (MenuSeq.NextVal,'Southern Fried Chicken Sliders,Hearts of Romaine Salad,House-Made Potato Gnocchi,Salted Caramel Cheesecake',850);
Insert into FOOD VALUES (MenuSeq.NextVal,'Pulled Pork Potstickers,Chicken Salad,Roasted Chicken Breast,Sorbet du Jour',970);
Insert into FOOD VALUES (MenuSeq.NextVal,'Grilled Shrimp Cocktail,Hearts of Romaine Salad,Lasagna,Salted Caramel Cheesecake',950);
Insert into FOOD VALUES (MenuSeq.NextVal,'Goat Cheese Risotto Balls,Arugula Salad,House-Made Potato Gnocchi,Lemon Meringue Cheesecake',1050);
Insert into FOOD VALUES (MenuSeq.NextVal,'Grilled Shrimp Cocktail,Chicken Salad,Crab Cake,Sorbet du Jour',1020);
Insert into FOOD VALUES (MenuSeq.NextVal,'Factory Nachos,Hearts of Romaine Salad,Roasted Chicken Breast,Bread Pudding',1300);
Insert into FOOD VALUES (MenuSeq.NextVal,'Parmesian Garlic Cheese Bread,Hearts of Romaine Salad,Lasagna,Salted Caramel Cheesecake',1500);


----------------------------------
--Insert into Linen Values (1,'Orange',200);
Insert into LINEN VALUES (LinenSeq.NextVal,'Red',250);
Insert into LINEN VALUES (LinenSeq.NextVal,'Blue',350);
Insert into LINEN VALUES (LinenSeq.NextVal,'White',300);
Insert into LINEN VALUES (LinenSeq.NextVal,'Yellow',550);
Insert into LINEN VALUES (LinenSeq.NextVal,'Green',450);
Insert into LINEN VALUES (LinenSeq.NextVal,'Saffron',300);
Insert into LINEN VALUES (LinenSeq.NextVal,'Pink',250);
Insert into LINEN VALUES (LinenSeq.NextVal,'Black',200);
Insert into LINEN VALUES (LinenSeq.NextVal,'Grey',225);
Insert into LINEN VALUES (LinenSeq.NextVal,'Purple',275);
Insert into LINEN VALUES (LinenSeq.NextVal,'Silver',350);
Insert into LINEN VALUES (LinenSeq.NextVal,'Cyan',300);
Insert into LINEN VALUES (LinenSeq.NextVal,'Brown',350);
Insert into LINEN VALUES (LinenSeq.NextVal,'Indigo',400);
Insert into LINEN VALUES (LinenSeq.NextVal,'Orange',450);

Insert into EVENTS VALUES (EventSeq.NextVal,'Holiday Party',
TO_DATE('2016/12/30 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),'ONSITE',TO_TIMESTAMP('2016-12-30 06:14:00', 'YYYY-MM-DD HH24:MI:SS'),1,150,20,5,1,1,1,1,1,1,1,5000,null,null,null,null);

Insert into EVENTS VALUES (EventSeq.NextVal,
'Food Fest',
TO_DATE('2016/11/30 19:00:00', 'yyyy/mm/dd hh24:mi:ss'),
'ONSITE',
TO_TIMESTAMP('2016-11-30 19:00:00', 'yyyy-mm-dd hh24:mi:ss'),
2,
170,
50,
10,
2,
2,
2,
2,
2,
2,
2,
3050,
null,
null,
null,
null);

Insert into EVENTS VALUES (EventSeq.NextVal,
'Meet and Greet',
TO_DATE('2016/10/02 16:04:44', 'yyyy/mm/dd hh24:mi:ss'),
'ONSITE',
TO_TIMESTAMP('2016-10-02 16:02:44', 'yyyy-mm-dd hh24:mi:ss'),
15,
185,
12,
2,
15,
15,
15,
15,
15,
15,
15,
9350,
null,
null,
null,
null);

Insert into EVENTS VALUES (EventSeq.NextVal,
'Grand Opening Ceremony',
TO_DATE('2016/10/11 20:04:44', 'yyyy/mm/dd hh24:mi:ss'),
'OFFSITE',
TO_TIMESTAMP('2016-10-11 20:02:44', 'yyyy-mm-dd hh24:mi:ss'),
14,
1070,
50,
10,
14,
14,
14,
14,
14,
14,
14,
12050,
null,
null,
null,
null);

Insert into EVENTS VALUES (EventSeq.NextVal,
'Club Party',
TO_DATE('2016/11/07 22:04:44', 'yyyy/mm/dd hh24:mi:ss'),
'OFFSITE',
TO_TIMESTAMP('2016-11-07 22:02:44', 'yyyy-mm-dd hh24:mi:ss'),
13,
600,
20,
8,
13,
13,
13,
13,
13,
13,
13,
9000,
null,
null,
null,
null);

Insert into EVENTS VALUES (EventSeq.NextVal,
'Bachelorette Party',
TO_DATE('2016/12/04 21:30:44', 'yyyy/mm/dd hh24:mi:ss'),
'ONSITE',
TO_TIMESTAMP('2016-12-04 21:00:44', 'yyyy-mm-dd hh24:mi:ss'),
12,
180,
15,
3,
12,
12,
12,
12,
12,
12,
12,
850,
null,
null,
null,
null);

Insert into EVENTS VALUES (EventSeq.NextVal,
'Bachelors Party',
TO_DATE('2016/11/17 22:24:44', 'yyyy/mm/dd hh24:mi:ss'),
'ONSITE',
TO_TIMESTAMP('2016-11-17 21:30:44', 'yyyy-mm-dd hh24:mi:ss'),
11,
160,
10,
1,
11,
11,
11,
11,
11,
11,
11,
780,
null,
null,
null,
null);

Insert into EVENTS VALUES (EventSeq.NextVal,
'Parade Rehersal',
TO_DATE('2016/09/30 13:04:44', 'yyyy/mm/dd hh24:mi:ss'),
'OFFSITE',
TO_TIMESTAMP('2016-09-30 13:02:44', 'yyyy-mm-dd hh24:mi:ss'),
10,
550,
30,
8,
10,
10,
10,
10,
10,
10,
10,
10050,
null,
null,
null,
null);

Insert into EVENTS VALUES (EventSeq.NextVal,
'Thanksgiving Party',
TO_DATE('2016/11/24 17:04:44', 'yyyy/mm/dd hh24:mi:ss'),
'ONSITE',
TO_TIMESTAMP('2016-11-24 17:02:44', 'yyyy-mm-dd hh24:mi:ss'),
9,
190,
20,
5,
9,
9,
9,
9,
9,
9,
9,
7300,
null,
null,
null,
null);

Insert into EVENTS VALUES (EventSeq.NextVal,
'Birthday Party',
TO_DATE('2016/08/28 18:04:44', 'yyyy/mm/dd hh24:mi:ss'),
'OFFSITE',
TO_TIMESTAMP('2016-08-28 18:02:44', 'yyyy-mm-dd hh24:mi:ss'),
8,
150,
20,
3,
8,
8,
8,
8,
8,
8,
8,
5550,
null,
null,
null,
null);

Insert into EVENTS VALUES (EventSeq.NextVal,
'Fund Raiser Event',
TO_DATE('2016/09/13 16:00:44', 'yyyy/mm/dd hh24:mi:ss'),
'ONSITE',
TO_TIMESTAMP('2016-09-13 16:00:44', 'yyyy-mm-dd hh24:mi:ss'),
7,
170,
50,
10,
7,
7,
7,
7,
7,
7,
7,
4550,
null,
null,
null,
null);

Insert into EVENTS VALUES (EventSeq.NextVal,
'Tech Conference',
TO_DATE('2016/12/15 09:00:00', 'yyyy/mm/dd hh24:mi:ss'),
'ONSITE',
TO_TIMESTAMP('2016-12-15 10:00:00', 'yyyy-mm-dd hh24:mi:ss'),
6,
170,
30,
10,
6,
6,
6,
6,
6,
6,
6,
6050,
null,
null,
null,
null);

Insert into EVENTS VALUES (EventSeq.NextVal,
'Wedding Reception',
TO_DATE('2016/11/12 18:04:44', 'yyyy/mm/dd hh24:mi:ss'),
'OFFSITE',
TO_TIMESTAMP('2016-11-12 18:02:44', 'yyyy-mm-dd hh24:mi:ss'),
5,
600,
70,
20,
5,
5,
5,
5,
5,
5,
5,
9150,
null,
null,
null,
null);

Insert into EVENTS VALUES (EventSeq.NextVal,
'Big Al Family Meeting',
TO_DATE('2016/09/23 17:34:44', 'yyyy/mm/dd hh24:mi:ss'),
'ONSITE',
TO_TIMESTAMP('2016-09-23 17:38:44', 'yyyy-mm-dd hh24:mi:ss'),
4,
175,
50,
10,
4,
4,
4,
4,
4,
4,
4,
8050,
null,
null,
null,
null);

Insert into EVENTS VALUES (EventSeq.NextVal,
'House Party',
TO_DATE('2017/01/23 10:04:44', 'yyyy/mm/dd hh24:mi:ss'),
'OFFSITE',
TO_TIMESTAMP('2017-01-23 10:35:44', 'yyyy-mm-dd hh24:mi:ss'),
3,
670,
50,
10,
3,
3,
3,
3,
3,
3,
3,
5050,
null,
null,
null,
null);


--PART 4

--JOIN
SELECT CLIENT_LAST_NAME, client_first_name
FROM client LEFT JOIN events
    ON events.event_id = client.client_id;

SELECT ENTERTAINER_NAME
FROM Entertainer LEFT JOIN events 
     ON events.EVENT_ID = Entertainer.ENTERTAINER_ID;

SELECT FLORIST_NAME
FROM Florist LEFT JOIN EVENTS
     ON events.EVENT_FLORIST_ID = Florist.FLORIST_ID;

--SUBQUERIES
SELECT FLORIST_NAME
FROM Florist
WHERE FLORIST_ID in( select events.EVENT_FLORIST_ID from Events);

SELECT ENTERTAINER_NAME
FROM ENTERTAINER
WHERE ENTERTAINER_ID in( select events.EVENT_ENTERTAINER_ID from EVENTS);


SELECT PHOTOGRAPHER_name
FROM PHOTOGRAPHER
WHERE PHOTOGRAPHER_ID in( select events.EVENT_PHOTOGRAPHER_ID from events);

--NORMAL QUERIES
SELECT CLIENT_FIRST_NAME from client;

SELECT ENTERTAINER_NAME from entertainer;

--GROUP BY QUERIES
SELECT EVENT_LOCATION_ID, SUM(EVENT_COST) AS TOTAL_COST_PER_LOCATION
FROM EVENTS
GROUP BY (EVENT_LOCATION_ID)
HAVING SUM(EVENT_COST) > 100;

SELECT COUNT(PHOTOGRAPHER.PHOTOGRAPHER_ID) AS NUMBER_OF_PHOTOGRAPHERS, PHOTOGRAPHER_PRICE
FROM PHOTOGRAPHER INNER JOIN EVENTS ON PHOTOGRAPHER.PHOTOGRAPHER_ID = EVENTS.EVENT_PHOTOGRAPHER_ID
GROUP BY PHOTOGRAPHER_PRICE
HAVING COUNT(PHOTOGRAPHER.PHOTOGRAPHER_ID) > 1;

--PART 5

--1. WHAT'S THE FOOD FOR A CLIENT X
SELECT EVENT_NAME, FOOD.FOOD_DESCRIPTION, FOOD.FOOD_PRICE
FROM FOOD INNER JOIN EVENTS ON FOOD.FOOD_ID = EVENTS.EVENT_FOOD_ID
WHERE EVENTS.EVENT_CLIENT_ID = 1;

--2. HOW MANY EVENTS IN LOCATION X
SELECT EVENT_NAME, FOOD.FOOD_DESCRIPTION, FOOD.FOOD_PRICE
FROM FOOD INNER JOIN EVENTS ON FOOD.FOOD_ID = EVENTS.EVENT_FOOD_ID
WHERE EVENTS.EVENT_CLIENT_ID = 1;

--3. FIND EVENTS WITH MORE THAN 100 BUT LESS THAN 200 GUESTS
SELECT * 
FROM EVENTS
WHERE EVENT_GUEST_NUMBER > 100 AND EVENT_GUEST_NUMBER < 200;

--4. KNOW HOW MANY EVENTS HAVE BEEN HOSTED
SELECT COUNT(*) AS NUMBER_OF_EVENTS
FROM EVENTS;

--5. FLORISTS USED IN CTIBANK LOCATION EVENTS
SELECT LOCATION.LOCATION_NAME, EVENTS.EVENT_NAME, FLORIST.FLORIST_NAME, FLORIST.FLORIST_PHONE, FLORIST.FLORIST_PRICE
FROM FLORIST INNER JOIN EVENTS 
     ON FLORIST.FLORIST_ID = EVENTS.EVENT_FLORIST_ID 
     INNER JOIN LOCATION 
     ON LOCATION.LOCATION_ID = EVENTS.EVENT_LOCATION_ID
WHERE LOCATION.LOCATION_NAME = 'CitiBank';

--6. HOW MANY EVENTS EACH MONTH FOR 2016
SELECT TO_CHAR(TO_DATE(EXTRACT(MONTH FROM EVENT_DATE), 'MM'), 'MONTH') "MONTH", count(*) AS NUMBER_OF_EVENTS
FROM EVENTS
WHERE EXTRACT(YEAR FROM EVENT_DATE) = '2016'
GROUP BY EXTRACT(MONTH FROM EVENT_DATE)
ORDER BY EXTRACT(MONTH FROM EVENT_DATE);

--7. CLIENTS FOR ZIPCODE X IN CITY X
SELECT CLIENT_FIRST_NAME, CLIENT_LAST_NAME
FROM CLIENT INNER JOIN ZIPCODE ON CLIENT.CLIENT_ZIPCODE = ZIPCODE.ZIPCODE
WHERE CLIENT_ZIPCODE = 20013 AND ZIPCODE.ZIP_CITY = 'Washington';

--8. HOW MUCH IS EARNED IN EACH CITY
SELECT ZIPCODE.ZIP_CITY, SUM(EVENTS.EVENT_COST) AS COST
FROM EVENTS INNER JOIN CLIENT ON EVENTS.EVENT_CLIENT_ID = CLIENT.CLIENT_ID INNER JOIN ZIPCODE ON CLIENT.CLIENT_ZIPCODE = ZIPCODE.ZIPCODE
GROUP BY (ZIPCODE.ZIP_CITY)
ORDER BY (COST) DESC;

--9. HOW MUCH IS EARNED AVG PER EVENT (PRECISION OF 3) IN EACH CITY
SELECT ZIPCODE.ZIP_CITY, ROUND(SUM(EVENTS.EVENT_COST)/COUNT(ZIPCODE.ZIP_CITY), 3) AS AVG_PER_EVENT
FROM EVENTS INNER JOIN CLIENT ON EVENTS.EVENT_CLIENT_ID = CLIENT.CLIENT_ID INNER JOIN ZIPCODE ON CLIENT.CLIENT_ZIPCODE = ZIPCODE.ZIPCODE
GROUP BY (ZIPCODE.ZIP_CITY)
ORDER BY (AVG_PER_EVENT) DESC;

--10. SHOW EVENTS WITH THE 3 LOWEST PRICES OF FLORISTS
SELECT EVENT_ID, EVENT_NAME
FROM EVENTS
WHERE EVENT_FLORIST_ID IN (SELECT FLORIST_ID
                                  FROM (SELECT FLORIST_ID,
                                               rank() over (ORDER BY FLORIST_PRICE ASC) rnk
                                        FROM FLORIST)
                                  WHERE rnk < 4);
                                  
-- UPDATE QUERIES

UPDATE client SET CLIENT_FIRST_NAME = 'SpaceX' WHERE CLIENT_ID =1;

UPDATE entertainer SET ENTERTAINER_NAME = 'Daft Punk' WHERE ENTERTAINER_ID =1;

UPDATE florist SET FLORIST_NAME = 'Foggy Bottom Florist' WHERE FLORIST_ID =1;

UPDATE photographer SET PHOTOGRAPHER_NAME = 'James Bond Photography' WHERE
PHOTOGRAPHER_ID =1;

UPDATE location SET LOCATION_NAME = 'Warner Theatre' WHERE LOCATION_ID =1;


--TRIGGERS

--For Clients

CREATE or replace TRIGGER CLIENT_AUDIT_TRIG
  BEFORE INSERT OR UPDATE ON CLIENT
  FOR EACH ROW
BEGIN
	If INSERTING then
		:new.Created_By := user;
		:new.Created_Date := sysdate;
    :new.Updated_By := user;
		:new.Updated_Date := sysdate;
	end if;
	
	if UPDATING then
		:new.Updated_By := user;
		:new.Updated_Date := sysdate;	
	end if;
END;
/

-- For Events

create or replace TRIGGER Events_AUDIT_TRIG
  BEFORE INSERT OR UPDATE ON Events
  FOR EACH ROW
BEGIN
	If INSERTING then
		:new.Created_By := user;
		:new.Created_Date := sysdate;
		:new.Updated_By := user;
		:new.Updated_Date := sysdate;	
	end if;
	
	if UPDATING then
		:new.Updated_By := user;
		:new.Updated_Date := sysdate;	
	end if;
END;
/

-- For Location

create or replace TRIGGER Location_AUDIT_TRIG
  BEFORE INSERT OR UPDATE ON Location
  FOR EACH ROW
BEGIN
	If INSERTING then
		:new.Created_By := user;
		:new.Created_Date := sysdate;
		:new.Updated_By := user;
		:new.Updated_Date := sysdate;	
	end if;
	
	if UPDATING then
		:new.Updated_By := user;
		:new.Updated_Date := sysdate;	
	end if;
END;	
/

-- Procedure for writing data in event_History table

CREATE OR REPLACE PROCEDURE add_event_history
  (  p_event_name                 Events_History.event_Name%type
   , p_event_start_date           Events_History.event_Date%type
   , p_event_loc_Id               Events_History.event_Location_Id%type
   , p_event_Guest_Num            Events_History.event_Guest_Number%type
   , p_event_NumberOfWaiters      Events_History.event_NumberOfWaiters%type 
   , p_event_NumberOfBartenders   Events_History.event_NumberOfBartenders%type 
   , p_event_Linen_Id             Events_History.event_Linen_Id%type 
   , p_event_Food_Id              Events_History.event_Food_Id%type 
   , p_event_Florist_Id           Events_History.event_Florist_Id%type 
   , p_event_Music_Id             Events_History.event_Music_Id%type 
   , p_event_Entertainer_Id       Events_History.event_Entertainer_Id%type
   , p_event_Photographer_Id      Events_History.event_Photographer_Id%type
   , p_event_Client_Id            Events_History.event_Client_Id%type
   , p_event_Cost                 Events_History.event_Cost%type
   , p_Created_By                 Events_History.Created_By%type
   , p_Created_Date               Events_History.Created_Date%type
   , p_Updated_By                 Events_History.Updated_By%type
   , p_Updated_Date               Events_History.Updated_Date%type
   )
IS
BEGIN
  INSERT INTO Events_History (event_Name, event_Date, event_Location_Id,event_Guest_Number,
                           event_NumberOfWaiters, event_NumberOfBartenders,event_Linen_Id,event_Food_Id,event_Florist_Id,event_Music_Id,
                           event_Entertainer_Id,event_Photographer_Id,event_Client_Id,event_Cost,Created_By,Created_Date,Updated_By,Updated_Date)
    VALUES(p_event_name, p_event_start_date, p_event_loc_Id, p_event_Guest_Num, p_event_NumberOfWaiters,p_event_NumberOfBartenders,p_event_Linen_Id,
                          p_event_Food_Id,p_event_Florist_Id,p_event_Music_Id,p_event_Entertainer_Id,p_event_Photographer_Id,p_event_Client_Id,p_event_Cost,
                          p_Created_By,p_Created_Date,p_Updated_By,p_Updated_Date);
END add_event_history;
/

CREATE OR REPLACE TRIGGER update_events_history
  BEFORE UPDATE ON Events
  FOR EACH ROW
BEGIN
  add_event_history(:old.event_Name, :old.event_Date, :old.event_Location_Id,:old.event_Guest_Number, :old.event_NumberOfWaiters,:old.event_NumberOfBartenders,
                  :old.event_Linen_Id,:old.event_Food_Id,:old.event_Florist_Id,
                  :old.event_Music_Id,:old.event_Entertainer_Id,:old.event_Photographer_Id,:old.event_Client_Id,:old.event_Cost,:old.Created_By,:old.Created_Date,
                  :old.Updated_By,:old.Updated_Date);
END;