--PRO PLAYER, HIS INFORMATION, AND THE CHARACTER HE PLAYS. CONNECTING PRO,PROINFO, AND CNAME
SELECT 
L.PROID AS "ID",
C.PROFNAME || ' ' || C.PROLNAME AS "Name",
C.WinLoseRatio AS "Win/Loss Percent",
D.CharacterName AS "CHARACTER"

FROM 
PRO L
JOIN PROINFO C
 ON L.PROID  = C.PROIDI
JOIN CNAME D 
    ON D.CharacterIDC = C.CHARACTERPLAYED;
    
--PRO PLAYER AND WHAT COMPETITIONS HES GONE TO. CONNECTING PRO, PROINFO, AND HISTORY
SELECT * FROM HISTORY;

SELECT 
L.PROID AS "ID",
D.PROFNAME || ' ' || D.PROLNAME AS "Name",
C.COMPETITIONHISTORYH AS "HISTORY",
C.DATEHISTORY AS "DATES"

FROM 
PRO L
JOIN HISTORY C
 ON L.PROID  = C.PROIDH
JOIN PROINFO D
 ON L.PROID  = D.PROIDI;
 
--UPDATING WIN/LOSS RATIO PERCENTAGE 
SELECT * FROM PROINFO;
update PROINFO
set WINLOSERATIO = '41'
where PROIDI =  0001;

SELECT * FROM PROINFO;

--DELETING A TIERLIST GIVEN ID AND USER
Select * from TierList;

DELETE
FROM
    TierList
WHERE
    USERIDTL = 0001 AND
    TIERLISTID = 0002;
    
--SHOWING ALL CHARACTERS, WHERE THEY ARE FROM, FIGHERSTYLE, AND CHARACTER NAME
select CName.characteridc, Cname.charactername , character.gameseries, character.fighterstyle from cname join
character on cname.characteridc = character.characterid;

--SHOWING WHEN CHARACTERS WERE RELEASED AND THEIR ORIGIN
select CName.characteridc, Cname.charactername , released.gameseriesR, released.datereleased from cname join
released on cname.characteridc = released.characteridr;

--SORTING CHARACTER BY FIGHTING STYLE
select CName.characteridc, Cname.charactername , character.gameseries, character.fighterstyle from cname join
character on cname.characteridc = character.characterid where character.fighterstyle  = 'Brawler';

select CName.characteridc, Cname.charactername , character.gameseries, character.fighterstyle  from cname join
character on cname.characteridc = character.characterid where character.fighterstyle  = 'Swordfighter';

select CName.characteridc, Cname.charactername , character.gameseries, character.fighterstyle   from cname join
character on cname.characteridc = character.characterid where character.fighterstyle  = 'Gunner';

SELECT
    CName.characteridc,
    Cname.charactername,
    character.gameseries,
    character.fighterstyle 
FROM
    cname join character on cname.characteridc = character.characterid
GROUP BY
    character.fighterstyle
HAVING
    character.fighterstyle  == 'Gunner';

--UPDATING THE USERS FAVORITE CHARACTER
update users 
set favoritecharacter = 'Luigi'
where userid =  0001;

--VIEWING USER(S) AND THEIR BASIC PROFILES
SELECT * FROM USERS;
SELECT 
L.USERID AS "ID",
C.USERNAMEI AS "Name",
C.ROLE AS "ROLE",
C.FOLLOWER AS "FOLLOWERS",
C.FOLLOWING AS "FOLLOWING",
L.FAVORITECHARACTER AS "MAIN"
FROM 
USERS L
JOIN INFO C
 ON L.USERID  = C.USERIDI;


select FighterStyle, count(CharacterID)
from character
group by FighterStyle;

select FighterStyle, count(CharacterID)
from character
group by FighterStyle
having 
gameSeries = 'Super Mario';

select * from Rating;

Select C.CharacterID, r.totalspecial
From Character C
Join Rating R
ON R.CharacterIDRate = C.CharacterID 
And R.AirSmash > 10
Order by C.CharacterID;

--THESE ARE SORTING BY SPECIFIC POWER LEVELS
Select C.CharacterID, r.TotalSpecial
From Character C
Join Rating R
ON R.CharacterIDRate = C.CharacterID
And R.TotalSpecial > 10
Order by C.CharacterID;

Select C.CharacterID, r.groundsmash
From Character C
Join Rating R
ON R.CharacterIDRate = C.CharacterID
And R.groundsmash > 10
Order by C.CharacterID;

Select C.CharacterID, r.AirSmash
From Character C
Join Rating R
ON R.CharacterIDRate = C.CharacterID
And R.AirSmash > 10
Order by C.CharacterID;
