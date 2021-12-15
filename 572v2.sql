
--Main Character table that stores all the basic information about every character in Super Smash Brothers Ultimate
CREATE TABLE Character(
   CharacterID              NUMBER(10)  CONSTRAINT Character_CharacterID_NN         NOT NULL ,CONSTRAINT Character_CharacterID_PrimaryKey PRIMARY KEY(CharacterID)
  ,GameSeries               VARCHAR(50) CONSTRAINT Character_GameSeries_NN          NOT NULL 
  ,FighterStyle             VARCHAR(20) CONSTRAINT Character_FighterStyle           NOT NULL 
);
 
--Holds the Released dates of every character in Super Smash Bros Ultimate, including the original Game Series the characters came from. Basically the History of each Character
CREATE TABLE Released(
    CharacterIDR              NUMBER(10)  CONSTRAINT Released_CharacterIDR_NN NOT NULL ,CONSTRAINT Released_CharacterIDR_PrimaryKey PRIMARY KEY(CharacterIDR)
   ,GameSeriesR               VARCHAR(50) CONSTRAINT Released_GameSeriesR_NN  NOT NULL 
   ,DateReleased              VARCHAR(50) CONSTRAINT Released_DateReleased_NN NOT NULL   
);

--This table holds the Name of each character, easier to manage because its a seperate table, that way we can pull a name, only when we need it 
CREATE TABLE CName(
    CharacterIDC                NUMBER(10)  CONSTRAINT CName_CharacterIDC_NN NOT NULL ,CONSTRAINT CName_CharacterIDR_PrimaryKey PRIMARY KEY(CharacterIDC)
   ,CharacterName               VARCHAR(50) CONSTRAINT CName_CharacterName_NN  NOT NULL  
);


--This table holds the Technique of each Character. Given a Character ID we can return what Fighting Style that character uses and what the range of that character is.
Create Table Technique(
    CharacterIDT  NUMBER(10)  CONSTRAINT RSpecial_CharacterIDT_NN  NOT NULL, CONSTRAINT Technique_CharacterIDT_PK Primary Key(CharacterIDT),
    FightStyle    VARCHAR(20) CONSTRAINT Technique_FighterStyle_NN NOT NULL,
    Range         VARCHAR(15) CONSTRAINT Technique_Range_NN        NOT NULL 
);

--This is the TierList that the user would make. 
CREATE TABLE TierList(
   TierListID               NUMBER(10)    CONSTRAINT TierList_TierListID_NN           NOT NULL
  ,UserIDTL                 NUMBER(10)    CONSTRAINT TierList_UserIDTL_NN             NOT NULL ,CONSTRAINT TierList_UserIDTL_PrimaryKey PRIMARY KEY(UserIDTL) 
 );
 
 
--THIS IS THE COMMENTS THAT PEOPLE COULD POST IN THE REGRADES TO THE TIER LIST
CREATE TABLE Comments(
   TierListIDC                NUMBER(10)    CONSTRAINT Comment_TierListIDC_NN            NOT NULL 
  ,UserIDC                    NUMBER(10)    CONSTRAINT Comment__UserIDC_NN               NOT NULL 
  ,CommentID                  NUMBER(10)    CONSTRAINT Comment_CommentID_NN              NOT NULL ,CONSTRAINT Comment_CommentID_PrimaryKey PRIMARY KEY(CommentID)
 );
 
--HERE IS WHAT ACTUALLY HOLD THE COMMENT 
CREATE TABLE CommentInfo(
   CommentText                VARCHAR(500)  CONSTRAINT CommentInfo_CommentText_NN            NOT NULL 
  ,UserIDCI                   NUMBER(10)    CONSTRAINT CommentInfo_UserIDCI_NN               NOT NULL 
  ,CommentIDCI                NUMBER(10)    CONSTRAINT CommentInfo_CommentIDCI_NN            NOT NULL ,CONSTRAINT CommentInfo_CommentID_PrimaryKey PRIMARY KEY(CommentIDCI)
 );
 

--THIS IS THE WHAT HOLDS INFORMATION ABOUT THE PROFESSIONAL 
CREATE TABLE ProInfo(
    ProIDI          NUMBER(10)  CONSTRAINT ProInfo_ProIDI_NN   NOT NULL, CONSTRAINT ProInfo_ProIDI_PrimaryKey PRIMARY KEY (ProIDI),
    ProFName        VARCHAR(20) CONSTRAINT ProInfo_ProFName_NN NOT NULL,
    ProLName        VARCHAR(20) CONSTRAINT ProInfo_ProLName_NN NOT NULL,
    WinLoseRatio    NUMBER(5),
    CharacterPlayed NUMBER(10)
);

--BASIC PROFESSIONAL PLAYER PROFILE, QUICK ACCESS TO IMPORTANT INFORMATION
CREATE TABLE Pro(
    ProID               NUMBER(10) CONSTRAINT Pro_ProID_NN NOT NULL, CONSTRAINT Pro_ProID_PrimaryKey PRIMARY KEY (ProID),
    CompetitionHistory  VARCHAR(100),
    UpcomingCompetition VARCHAR(100)
);

--HISTORY OF GIVEN PROFESSIONAL PLAYER(PROIDH)
CREATE TABLE History(
    ProIDH              NUMBER(10) CONSTRAINT History_ProIDH_NN NOT NULL, CONSTRAINT History_ProIDH_PrimaryKey PRIMARY KEY (ProIDH),
    CompetitionHistoryH VARCHAR(100), 
    NameHistory         VARCHAR(100),
    DateHistory         VARCHAR(100)
);

--USERS THAT LOGIN
CREATE TABLE Users(
    UserID  NUMBER(10) CONSTRAINT User_UserID_NN NOT NULL, CONSTRAINT User_UserID_PrimaryKey PRIMARY KEY (UserID),
    Email   VARCHAR(50),
    FavoriteCharacter VARCHAR(50)
);

--USER INFORMATION, WHAT THEY PLAY, FOLLOWERS, FOLLOWING, ETC..
CREATE TABLE Info(
   UserIDI   NUMBER(10) CONSTRAINT User_UserIDI_NN NOT NULL, CONSTRAINT User_UserIDI_PrimaryKey PRIMARY KEY (UserIDI),  
   UsernameI VARCHAR(30) CONSTRAINT Info_UsernameI_NN NOT NULL, 
   Role      VARCHAR(30),
   Follower  VARCHAR(30),
   Following VARCHAR(30)
);



--ALL THE ALTER TABLES NEEDED FOR THE FOREIGN KEYS
alter table Character
add constraint Character_CharacterID foreign key (CharacterID) references CName(CharacterIDC);
 
alter table Released 
add constraint Released_CharacterID foreign key (CharacterIDR) references Character(CharacterID);         
           
    
alter table Technique
add constraint Technique_CharacterIDT foreign key (CharacterIDT) references Character(CharacterID);    
     
alter table TierList
add constraint TierList_UserIDTL foreign key (UserIDTL) references Users(UserID); 
          
alter table CommentInfo
add constraint CommentInfo_UserIDCI foreign key (UserIDCI) references Users(UserID);
 
alter table CommentInfo
add constraint CommentInfo_CommentIDCI foreign key (CommentIDCI) references Comments(CommentID); 
    
alter table Comments
add constraint Comment_TierListIDC foreign key (TierListIDC) references TierList(TierListID); 
    
alter table Comments
add constraint Comment_UserIDC foreign key (UserIDC) references Users(UserID); 
    
alter table CommentInfo
add constraint CommentInfo_UserIDCI foreign key (UserIDCI) references Users(UserID);
 
alter table CommentInfo
add constraint CommentInfo_CommentIDCI foreign key (CommentIDCI) references Comments(CommentID); 
    
alter table ProInfo
add constraint ProInfo_CharacterPlayed foreign key (CharacterPlayed) references Character(CharacterID); 
    
alter table ProInfo
add constraint ProInfo_ProIDI foreign key (ProIDI) references Pro(ProID); 
         
alter table History
add constraint History_ProIDH foreign key (ProIDH) references Pro(ProID); 
    
alter table Info
add constraint Info_UserIDI foreign key (UserIDI) references Users(UserID); 

--THESE ARE ALL THE INSERTS

--THESE ARE ALL THE CHARACTER
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1010,'Super Mario','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1020,'Donkey Kong','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1030,'The Legend of Zelda','Swordfighter');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1040,'Metroid','Gunner');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1041,'Metroid','Gunner');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1050,'Yoshi','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1060,'Kirby','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1070,'Star Fox','Gunner');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1080,'Pokemon','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1090,'Super Mario','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1100,'Earthbound','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1110,'F-Zero','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1120,'Pokemon','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1130,'Super Mario','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1131,'Super Mario','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1140,'Super Mario','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1150,'Ice Climbers','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1160,'The Legend of Zelda','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1170,'The Legend of Zelda','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1180,'Super Mario','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1190,'Pokemon','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1200,'Star Fox','Gunner');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1210,'Fire Emblem','Swordfighter');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1211,'Fire Emblem','Swordfighter');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1220,'The Legend of Zelda','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1230,'The Legend of Zelda','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1240,'Pokemon','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1250,'Fire Emblem','Swordfighter');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1251,'Fire Emblem','Swordfighter');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1260,'Game and Watch','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1270,'Kirby','Swordfighter');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1280,'Kid Icarus','Swordfighter');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1281,'Kid Icarus','Swordfighter');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1290,'Metroid','Gunner');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1300,'WarioWare','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1310,'Metal Gear Solid','Gunner');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1320,'Fire Emblem','Swordfighter');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1330,'Pokemon','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1340,'Pokemon','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1350,'Pokemon','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1360,'Donkey Kong','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1370,'Earthbound','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1380,'Sonic the Hedgehog','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1390,'Kirby','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1400,'Pikmen','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1410,'Pokemon','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1420,'R.O.B','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1430,'The Legend of Zelda','Swordfighter');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1440,'Star Fox','Gunner');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1450,'Animal Crossing','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1460,'Mega Man','Gunner');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1470,'Wii Fit','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1480,'Super Mario','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1490,'Punch-Out!!','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1500,'Pokemon','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1510,'Mii','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1520,'Mii','Swordfighter');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1530,'Mii','Gunner');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1540,'Kid Icarus','Swordfighter');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1550,'Pac-Man','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1560,'Fire Emblem','Swordfighter');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1570,'Xenoblade Chronicles','Swordfighter');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1580,'Super Mario','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1590,'Duck Hunt','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1600,'Street Fighter','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1601,'Street Fighter','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1610,'Final Fantasy','Swordfighter');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1620,'Fire Emblem','Swordfighter');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1630,'Bayonetta','Gunner');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1640,'Splatoon','Gunner');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1650,'Metroid','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1660,'Castlevania','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1661,'Castlevania','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1670,'Donkey Kong','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1680,'Animal Crossing','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1690,'Pokemon','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1700,'Super Mario','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1710,'Persona','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1720,'Dragon Quest','Swordfighter');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1730,'Banjo-Kazooie','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1740,'Fatal Fury','Brawler');
INSERT INTO Character(CharacterID,GameSeries,FighterStyle) VALUES (1750,'Fire Emblem','Swordfighter');

Select * from Character;


--THESE ARE ALL THE NAMES
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1010,'Mario');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1020,'Donkey Kong');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1030,'Link');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1040,'Samus');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1041,'Dark Samus');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1050,'Yoshi');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1060,'Kirby');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1070,'Fox');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1080,'Pikachu');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1090,'Luigi');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1100,'Ness');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1110,'Captain Falcon');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1120,'Jigglepuff');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1130,'Peach');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1131,'Daisy');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1140,'Bowser');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1150,'Ice Climbers');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1160,'Sheilk');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1170,'Zelda');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1180,'Dr. Mario');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1190,'Pichu');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1200,'Falco');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1210,'Marth');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1211,'Lucina');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1220,'Young Link');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1230,'Ganondorf');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1240,'Mewtwo');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1250,'Roy');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1251,'Chrom');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1260,'Mr. Game and Watch');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1270,'Meta Knight');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1280,'Pit');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1281,'Dark Pit');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1290,'Zero Suit Samus');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1300,'Wario');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1310,'Snake');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1320,'Ike');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1330,'Pokemon Trainer: Squirtle');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1340,'Pokemon Trainer: Ivysaur');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1350,'Pokemon Trainer: Charizard');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1360,'Diddy Kong');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1370,'Lucas');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1380,'Sonic');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1390,'King Dedede');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1400,'Olimar');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1410,'Lucario');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1420,'R.O.B');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1430,'Toon Link');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1440,'Wolf');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1450,'Villager');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1460,'Mega Man');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1470,'Wii Fit Trainer');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1480,'Rosalina and Luma');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1490,'Little Mac');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1500,'Greninja');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1510,'Mii Fighter Brawler');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1520,'Mii Fighter Swordfighter');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1530,'Mii Fighter Gunner');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1540,'Palutina');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1550,'Pac-Man');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1560,'Robin');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1570,'Shulk');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1580,'Bowser Jr.');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1590,'Duck Hunt');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1600,'Ryu');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1601,'Ken');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1610,'Cloud');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1620,'Corrin');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1630,'Bayonetta');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1640,'Inkling');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1650,'Ridley');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1660,'Simon');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1661,'Richter');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1670,'King K. Rool');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1680,'Isabelle');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1690,'Inceneroar');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1700,'Piranha Plant');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1710,'Joker');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1720,'Hero');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1730,'Banjo and Kazooie');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1740,'Terry');
INSERT INTO CName(CharacterIDC,CharacterName) VALUES (1750,'Byleth');

select * from CNAME; 

--These are all the released dates for the smash characters
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1010,'Super Mario','1/21/1999');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1020,'Donkey Kong','1/21/1999');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1030,'The Legend of Zelda','1/21/1999');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1040,'Metroid','1/21/1999');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1041,'Metroid','10/7/2018');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1050,'Yoshi','1/21/1999');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1060,'Kirby','1/21/1999');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1070,'Star Fox','1/21/1999');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1080,'Pokemon','1/21/1999');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1090,'Super Mario','1/21/1999');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1100,'Earthbound','1/21/1999');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1110,'F-Zero','1/21/1999');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1120,'Pokemon','1/21/1999');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1130,'Super Mario','11/21/2001');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1131,'Super Mario','10/7/2018');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1140,'Super Mario','11/21/2001');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1150,'Ice Climbers','11/21/2001');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1160,'The Legend of Zelda','1/21/2008');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1170,'The Legend of Zelda','11/21/2001');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1180,'Super Mario','11/21/2001');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1190,'Pokemon','11/21/2001');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1200,'Star Fox','11/21/2001');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1210,'Fire Emblem','11/21/2001');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1211,'Fire Emblem','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1220,'The Legend of Zelda','11/21/2001');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1230,'The Legend of Zelda','11/21/2001');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1240,'Pokemon','11/21/2001');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1250,'Fire Emblem','11/21/2001');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1251,'Fire Emblem','10/7/2018');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1260,'Game and Watch','11/21/2001');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1270,'Kirby','1/21/2008');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1280,'Kid Icarus','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1281,'Kid Icarus','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1290,'Metroid','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1300,'WarioWare','1/21/2008');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1310,'Metal Gear Solid','1/21/2008');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1320,'Fire Emblem','1/21/2008');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1330,'Pokemon','1/21/2008');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1340,'Pokemon','1/21/2008');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1350,'Pokemon','1/21/2008');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1360,'Donkey Kong','1/21/2008');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1370,'Earthbound','1/21/2008');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1380,'Sonic the Hedgehog','1/21/2008');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1390,'Kirby','1/21/2008');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1400,'Pikmen','1/21/2008');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1410,'Pokemon','1/21/2008');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1420,'R.O.B','1/21/2008');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1430,'The Legend of Zelda','1/21/2008');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1440,'Star Fox','1/21/2008');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1450,'Animal Crossing','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1460,'Mega Man','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1470,'Wii Fit','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1480,'Super Mario','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1490,'Punch-Out!!','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1500,'Pokemon','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1510,'Mii','10/7/2018');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1520,'Mii','10/7/2018');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1530,'Mii','10/7/2018');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1540,'Kid Icarus','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1550,'Pac-Man','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1560,'Fire Emblem','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1570,'Xenoblade Chronicles','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1580,'Super Mario','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1590,'Duck Hunt','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1600,'Street Fighter','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1601,'Street Fighter','10/7/2018');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1610,'Final Fantasy','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1620,'Fire Emblem','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1630,'Bayonetta','9/13/2014');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1640,'Splatoon','10/7/2018');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1650,'Metroid','10/7/2018');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1660,'Castlevania','10/7/2018');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1661,'Castlevania','10/7/2018');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1670,'Donkey Kong','10/7/2018');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1680,'Animal Crossing','10/7/2018');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1690,'Pokemon','10/7/2018');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1700,'Super Mario','2/1/2019');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1710,'Persona','4/17/2019');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1720,'Dragon Quest','7/30/2019');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1730,'Banjo-Kazooie','9/4/2019');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1740,'Fatal Fury','11/6/2019');
INSERT INTO Released(CharacterIDR,GameSeriesR,DateReleased) VALUES (1750,'Fire Emblem','1/28/2020');

Select * from Released;

--Here are the users
Select * from Users;
INSERT INTO Users(UserID,Email,FavoriteCharacter) VALUES (0001,'me@group10.com','King K. Rool');

--Here is the login for the user
Select * from Info;
INSERT INTO Info(UserIDI,UsernameI,Role,Follower,Following) VALUES (0001,'me@group10.com','normal user', 'N/A', 'N/A');

--First Tier List Created By user 0001
Select * from TierList;
INSERT INTO TierList(TierListID,UserIDTL) VALUES (0001,0001);

--Adding in the first pro player
SELECT * FROM PRO;
SELECT * FROM PROINFO;
SELECT * FROM HISTORY;
INSERT INTO PRO(PROID,competitionhistory, upcomingcompetition) VALUES (0001, 'N/A', 'N/A');
INSERT INTO PROINFO(PROIDI,PROFNAME, PROLNAME, WinLoseRatio, CHARACTERPLAYED) VALUES (0001, 'Samuel', 'Buzby', 41, 1400);
INSERT INTO HISTORY(PROIDH,COMPETITIONHISTORYH, NAMEHISTORY, DATEHISTORY) VALUES (0001, 'Thunder Smash, 2GGC:CIVIL WAR(SINGLES)', 'AngelOfIcarus48,dT|DaBuz,PL.XFIRE|Dabuz' , '2019-05-05, 2017-03-26');


--This table holds every Ground Smash information of each character, also passes along the total rank of each grond smash for evaluation
Create Table GroundSmash(
    CharacterIDGSma  NUMBER(10) CONSTRAINT GroundSmash_CharacterIDGSma_NN NOT NULL,
    GUpSma           NUMBER(3)  CONSTRAINT GroundSmash_GUpSma_CK    CHECK (GUpSma >= 0 AND GUpSma <= 100),
    GSideSma         NUMBER(3)  CONSTRAINT GroundSmash_GSideSma_CK  CHECK (GSideSma >= 0 AND GSideSma <= 100),
    GDownSma         NUMBER(3)  CONSTRAINT GroundSmash_GDownSma_CK  CHECK (GDownSma >= 0 AND GDownSma <= 100),
    GNeuSma          NUMBER(3)  CONSTRAINT GroundSmash_GNeuSma_CK   CHECK (GNeuSma >= 0 AND GNeuSma <= 100),
    CONSTRAINT GroundSmash_CharacterIDGSma_PK Primary Key(CharacterIDGSma)
);

--This table holds every Air Smash information of each character, also passes along the total rank of each grond smash for evaluation
Create table AirSmash(
    CharacterIDASma  NUMBER(10) CONSTRAINT AirSmash_CharacterIDASma_NN NOT NULL,
    AUpSma           NUMBER(3)  CONSTRAINT AirSmash_AUpSma_CK    CHECK (AUpSma >= 0 AND AUpSma <= 100),
    ASideSma         NUMBER(3)  CONSTRAINT AirSmash_ASideSma_CK  CHECK (ASideSma >= 0 AND ASideSma <= 100),
    ADownSma         NUMBER(3)  CONSTRAINT AirSmash_ADownSma_CK  CHECK (ADownSma >= 0 AND ADownSma <= 100),
    ANeuSma          NUMBER(3)  CONSTRAINT AirSmash_ANeuSma_CK   CHECK (ANeuSma >= 0 AND ANeuSma <= 100),
    CONSTRAINT AirSmash_CharacterIDASma_PK Primary Key(CharacterIDASma)
);

-- This table holds the Special moves for each character. Along side just the basic information of each Special, this table holds our preset Rank based on what patch we are currently in. In the front end this information would
-- be incorperated with a video that would actually show the move
Create Table Special(
    CharacterIDSpe    NUMBER(10) CONSTRAINT Special_CharacterIDSpe_NN NOT NULL, CONSTRAINT Special_CharacterIDSpe_PK Primary Key(CharacterIDSpe),
    UpSpe             NUMBER(3)  CONSTRAINT Special_UpSpe_CK    CHECK (UpSpe >= 0 AND UpSpe <= 100),
    SideSpe           NUMBER(3)  CONSTRAINT Special_SideSpe_CK  CHECK (SideSpe >= 0 AND SideSpe <= 100),
    DownSpe           NUMBER(3)  CONSTRAINT Special_DownSpe_CK  CHECK (DownSpe >= 0 AND DownSpe <= 100),
    NeuSpe            NUMBER(3)  CONSTRAINT Special_NeuSpe_CK   CHECK (NeuSpe >= 0 AND NeuSpe <= 100)
);


Create Table Rating(
    CharacterIDRate Number(10) CONSTRAINT Rating_CharacterIDRate_NN NOT NULL,
    AirSmash      Number(5),
    GroundSmash      Number(5),
    TotalSpecial    Number(5),
    CONSTRAINT Smash_CharacterIDSma_PK Primary Key(CharacterIDRate)
);

alter table Rating 
add constraint Special_CharacterIDRate foreign key (CharacterIDRate) references Character(CharacterID);

alter table Special 
add constraint Special_CharacterIDSpe foreign key (CharacterIDSpe) references Character(CharacterID);       
        
alter table GroundSmash 
add constraint GroundSmash_CharacterIDGSma foreign key (CharacterIDGSma) references Character(CharacterID);   
    
alter table AirSmash 
add constraint AirSmash_CharacterIDASma foreign key (CharacterIDASma) references Character(CharacterID);


--Triggers

--this created a trigger when the rating of each AirSmash is updated or created
--the result goes to the Smash table where it hold the total AirSmash Value
create or replace Trigger Total_Air_Smash
After Insert or Update On AirSmash
For Each Row
Begin
    Update Rating Set AirSmash = (:new.AUpSma + :new.ASideSma + :new.ADownSma +:new.ANeuSma) / 4
    Where CharacterIDRate = :new.CharacterIDASma;
End;

--this created a trigger when the rating of each GroundSmash is updated or created
--the result goes to the Smash table where it hold the total GroundSmash Value
create or replace Trigger Total_Ground_Smash
After Insert or Update On GroundSmash
For Each Row
Begin
    Update Rating Set GroundSmash = (:new.GUpSma + :new.GSideSma + :new.GDownSma +:new.GNeuSma) / 4
    Where CharacterIDRate = :new.CharacterIDGSma;
End;

--this created a trigger when the rating of each Special is updated or created
--the result goes to the Smash table where it hold the total Special Value
create or replace Trigger Special_Total
After Insert or Update On Special
For Each Row
Begin
    Update Rating Set TotalSpecial = (:new.UpSpe+ :new.SideSpe + :new.DownSpe +:new.NeuSpe) / 4
    Where CharacterIDRate = :new.CharacterIDSpe;
End;

--insert for the characterIDs for AirSmash
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1010,12,23,45,76);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1020,23,45,65,78);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1030,67,54,23,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1040,23,54,67,78);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1041,89,76,67,45);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1050,45,56,76,78);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1060,56,67,8,67);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1070,67,7,0,0);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1080,67,87,56,45);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1090,45,67,87,85);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1100,34,23,12,43);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1110,13,12,23,0);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1120,67,67,0,56);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1130,45,56,67,87);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1131,1,23,56,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1140,1,23,1,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1150,45,65,76,21);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1160,34,99,56,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1170,34,54,65,21);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1180,34,67,56,45);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1190,34,56,64,23);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1200,99,78,67,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1210,34,56,22,1);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1211,2,73,54,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1220,34,56,76,87);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1230,87,76,56,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1240,87,98,34,2);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1250,87,67,45,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1251,1,23,34,65);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1260,65,23,56,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1270,45,65,87,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1280,34,56,45,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1281,34,34,34,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1290,65,34,34,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1300,1,34,45,65);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1310,2,12,45,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1320,34,45,65,76);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1330,12,56,45,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1340,23,34,54,65);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)  
    VALUES (1350,34,65,45,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)  
    VALUES (1360,34,65,23,54);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)  
    VALUES (1370,1,23,1,1);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)  
    VALUES (1380,34,56,76,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)  
    VALUES (1390,87,76,65,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1400,34,45,56,76);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1410,45,78,45,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1420,23,34,56,23);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1430,1,23,56,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1440,1,23,54,76);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1450,56,66,87,97);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)  
    VALUES (1460,56,76,87,97);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1470,23,45,65,76);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1480,54,34,65,43);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1490,56,76,87,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1500,23,76,56,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)  
    VALUES (1510,34,56,87,98);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1520,54,45,45,78);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1530,65,45,65,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1540,34,45,65,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1550,2,34,45,3);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1560,65,45,45,65);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)  
    VALUES (1570,65,76,45,2);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)
    VALUES (1580,34,65,54,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)  
    VALUES (1590,34,45,34,54);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)  
    VALUES (1600,65,45,34,65);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1601,78,98,34,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1610,99,87,65,54);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)  
    VALUES (1620,34,54,65,70);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1630,40,50,60,70);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1640,50,60,87,20);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1650,45,54,30,20);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1660,54,65,76,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1661,43,50,40,30);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)  
    VALUES (1670,40,50,40,30);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)  
    VALUES (1680,50,30,40,40);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)  
    VALUES (1690,40,30,40,50);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)  
    VALUES (1700,45,56,45,43);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma) 
    VALUES (1710,45,34,23,2);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)  
    VALUES (1720,23,34,65,45);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)  
    VALUES (1730,34,45,65,23);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)  
    VALUES (1740,34,34,54,34);
INSERT INTO AirSmash(CharacterIDASma, AUpSma, ASideSma, ADownSma, ANeuSma)  
    VALUES (1750,34,65,76,45);

--insert for the characterIDs for GroundSmash
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1010,2,15,25,54);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1020,32,90,12,33);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1030,12,42,34,55);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1040,56,66,12,32);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1041,3,54,40,23);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1050,89,33,67,23);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1060,23,34,54,76);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1070,3,6,3,2);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1080,32,3,2,56);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1090,78,23,34,76);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1100,23,54,32,75);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1110,1,34,23,62);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1120,26,43,65,54);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1130,7,56,68,90);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1131,67,23,45,100);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1140,32,50,30,20);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1150,32,54,23,45);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1160,45,23,54,64);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1170,65,54,34,23);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1180,23,34,45,32);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1190,45,34,45,23);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1200,54,34,23,54);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1210,34,55,22,56);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1211,23,34,54,33);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1220,76,54,43,54);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1230,45,65,67,45);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1240,44,34,43,65);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1250,32,54,34,54);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1251,34,43,54,23);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1260,2,34,40,20);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1270,43,23,23,34);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1280,54,23,3,2);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1281,23,43,23,23);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1290,65,34,23,3);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1300,34,66,52,23);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1310,23,30,53,20);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1320,43,45,43,23);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1330,12,15,23,56);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1340,23,53,43,12);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1350,12,43,53,21);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1360,32,53,42,12);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1370,64,76,54,32);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1380,54,32,35,64);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1390,67,54,23,78);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1400,23,34,45,86);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1410,10,20,30,50);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1420,32,30,62,30);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1430,67,45,34,54);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1440,76,65,54,23);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1450,54,34,65,67);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1460,3,45,67,87);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1470,54,34,65,65);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1480,23,54,34,34);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1490,45,34,54,23);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1500,34,12,23,43);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1510,34,54,23,56);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1520,34,23,45,55);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1530,76,65,56,23);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1540,45,26,36,65);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1550,7,54,34,65);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1560,34,45,76,77);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1570,76,65,34,54);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1580,7,65,6,4);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1590,56,54,34,54);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1600,44,44,44,44);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1601,64,53,43,23);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1610,34,53,34,34);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1620,78,55,55,23);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1630,65,98,23,34);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1640,40,65,6,54);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1650,45,75,45,75);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1660,63,34,5,45);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1661,34,64,54,65);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1670,67,53,65,34);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1680,45,64,43,66);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1690,54,74,75,45);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1700,23,24,64,4);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1710,34,6,4,6);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1720,64,64,34,53);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma)
    Values (1730,44,33,66,44);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1740,64,43,53,45);
Insert Into GroundSmash(CharacterIDGSma, GUpSma, GSideSma, GDownSma, GNeuSma) 
    Values (1750,34,64,56,34);
    
--insert for all the specials
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1010,15,60,1,80);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1020,50,80,90,55);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1030,76,87,37,45);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1040,43,80,40,60);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1041,70,36,80,90);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1050,34,26,45,76);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1060,65,32,25,25);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1070,54,57,76,26);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1080,46,65,34,65);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1090,56,67,87,57);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1100,23,1,53,45);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1110,66,44,3,45);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1120,77,33,35,76);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1130,64,3,3,56);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1131,65,43,65,53);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1140,54,54,64,43);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1150,3,3,54,99);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1160,65,65,34,54);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1170,2,45,45,76);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1180,87,36,34,66);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1190,12,32,27,29);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1200,97,73,27,76);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1210,26,54,23,54);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1211,35,87,36,76);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1220,64,46,36,46);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1230,26,65,87,36);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1240,26,64,1,64);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1250,37,8,26,57);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1251,37,74,73,37);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1260,98,26,76,57);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1270,37,73,63,56);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1280,26,62,18,68);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1281,26,56,97,38);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1290,65,65,25,35);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1300,1,53,54,65);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1310,26,96,65,65);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1320,32,41,57,87);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1330,18,97,46,46);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1340,17,26,74,63);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe)  
    VALUES (1350,25,65,5,46);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe)  
    VALUES (1360,25,65,54,42);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe)  
    VALUES (1370,70,32,26,25);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe)  
    VALUES (1380,90,80,50,40);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe)  
    VALUES (1390,40,30,40,90);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1400,40,70,34,30);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1410,40,60,20,60);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1420,46,36,30,60);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1430,49,25,36,36);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1440,90,60,36,79);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1450,20,20,30,36);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe)  
    VALUES (1460,60,30,20,03);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1470,30,40,60,66);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1480,70,70,3,22);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1490,60,30,10,30);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1500,26,36,30,50);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe)  
    VALUES (1510,26,62,23,39);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1520,45,35,38,20);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1530,40,49,37,35);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1540,59,60,69,38);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1550,39,29,25,20);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1560,2,58,59,59);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe)  
    VALUES (1570,2,29,46,46);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1580,75,46,25,64);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe)  
    VALUES (1590,64,35,35,36);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe)  
    VALUES (1600,28,26,27,83);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1601,28,94,37,37);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1610,44,26,37,37);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe)  
    VALUES (1620,35,26,15,2);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1630,50,50,15,96);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1640,51,84,37,37);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1650,27,65,63,37);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1660,26,64,52,86);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1661,36,36,64,34);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe)  
    VALUES (1670,64,25,57,64);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe)  
    VALUES (1680,65,25,25,25);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe)  
    VALUES (1690,52,24,46,64);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe)  
    VALUES (1700,46,24,65,76);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe) 
    VALUES (1710,52,53,42,62);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe)  
    VALUES (1720,46,65,64,25);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe)  
    VALUES (1730,64,32,63,28);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe)  
    VALUES (1740,65,53,76,46);
INSERT INTO Special(CharacterIDSpe,UpSpe, DownSpe, SideSpe, NeuSpe)  
    VALUES (1750,52,52,34,54);



SELECT * FROM RATING;
