create database Finance;

use Finance;

CREATE TABLE Account (
    AcctName VARCHAR(50) PRIMARY KEY,
    Password VARCHAR(50) NOT NULL,
    LastSignedOn DATE,
    SbscrbrName VARCHAR(100),
    SbscrbrAddress VARCHAR(255),
    SbscrbrEMail VARCHAR(100),
    SbscrbrPhone VARCHAR(20),
    AcctCreatedOn DATE
);





CREATE TABLE Region (
    RegionName VARCHAR(50) PRIMARY KEY,
    Climate VARCHAR(50),
    Precipitation VARCHAR(50),
    Foliage VARCHAR(50),
    PlayersIn INT
);

CREATE TABLE `Character` (
    CharName VARCHAR(50) PRIMARY KEY,
    AcctName VARCHAR(50),
    Level INT,
    ExpPoints INT,
    Type VARCHAR(50),
    MaxHitPoints INT,
    CurrHitPoints INT,
    MaxMana INT,
    CurrMana INT,
    LastPlayed DATE,
    CreatedOn DATE,
    RegionName VARCHAR(50),
    FOREIGN KEY (AcctName) REFERENCES Account(AcctName),
    FOREIGN KEY (RegionName) REFERENCES Region(RegionName)
);


CREATE TABLE Item (
    ItemName VARCHAR(50) PRIMARY KEY,
    ItemType VARCHAR(50),
    ItemDamage INT
);


CREATE TABLE ItemInstantiation (
    IDNum INT PRIMARY KEY,
    ItemName VARCHAR(50),
    Modifier VARCHAR(50),
    WhenCreated DATE,
    FOREIGN KEY (ItemName) REFERENCES Item(ItemName)
);


CREATE TABLE Creep (
    CreepName VARCHAR(50) PRIMARY KEY,
    HitPoints INT,
    Mana INT,
    Attack INT
);


CREATE TABLE CreepInstantiation (
    IDNum INT PRIMARY KEY,
    CreepName VARCHAR(50),
    FOREIGN KEY (CreepName) REFERENCES Creep(CreepName)
);


CREATE TABLE CharacterCarriesItem (
    CharName VARCHAR(50),
    IDNum INT,
    PRIMARY KEY (CharName, IDNum),
    FOREIGN KEY (CharName) REFERENCES `Character`(CharName),
    FOREIGN KEY (IDNum) REFERENCES ItemInstantiation(IDNum)
);


CREATE TABLE CreepCarriesItem (
    CreepIDNum INT,
    ItemIDNum INT,
    PRIMARY KEY (CreepIDNum, ItemIDNum),
    FOREIGN KEY (CreepIDNum) REFERENCES CreepInstantiation(IDNum),
    FOREIGN KEY (ItemIDNum) REFERENCES ItemInstantiation(IDNum)
);


CREATE TABLE RanInto (
    CharName VARCHAR(50),
    CreepIDNum INT,
    PRIMARY KEY (CharName, CreepIDNum),
    FOREIGN KEY (CharName) REFERENCES `Character`(CharName),
    FOREIGN KEY (CreepIDNum) REFERENCES CreepInstantiation(IDNum)
);


INSERT INTO Account (AcctName, Password, LastSignedOn, SbscrbrName, SbscrbrAddress, SbscrbrEMail, SbscrbrPhone, AcctCreatedOn)
VALUES 
    ('Gamer1', 'gamerpass1', '2024-08-10', 'Nina', '123 Pine Lane', 'nina@example.com', '555-1234', '2024-01-10'),
    ('Gamer2', 'gamerpass2', '2024-08-15', 'Omar', '456 Elm Blvd', 'omar@example.com', '555-5678', '2024-02-15'),
    ('Gamer3', 'gamerpass3', '2024-08-20', 'Luna', '789 Maple Dr', 'luna@example.com', '555-8765', '2024-03-20'),
    ('Gamer4', 'gamerpass4', '2024-08-25', 'Evan', '101 Oak St', 'evan@example.com', '555-4321', '2024-04-25'),
    ('Gamer5', 'gamerpass5', '2024-09-01', 'Riley', '202 Birch Ln', 'riley@example.com', '555-6789', '2024-05-30');
INSERT INTO Region (RegionName, Climate, Precipitation, Foliage, PlayersIn)
VALUES 
    ('Mystic Woods', 'Mild', 'Light', 'Lush', 12),
    ('Frozen Tundra', 'Cold', 'Heavy', 'Sparse', 8),
    ('Sunken Ruins', 'Tropical', 'Heavy', 'Thick', 4),
    ('Golden Plains', 'Warm', 'Moderate', 'Open', 9),
    ('Shattered Peaks', 'Arid', 'None', 'Rocky', 7);
INSERT INTO `Character` (CharName, AcctName, Level, ExpPoints, Type, MaxHitPoints, CurrHitPoints, MaxMana, CurrMana, LastPlayed, CreatedOn, RegionName)
VALUES 
    ('Paladin', 'Gamer1', 15, 1800, 'Paladin', 120, 110, 70, 60, '2024-08-10', '2024-01-10', 'Mystic Woods'),
    ('Sorcerer', 'Gamer2', 11, 1500, 'Sorcerer', 85, 80, 140, 130, '2024-08-15', '2024-02-15', 'Sunken Ruins'),
    ('Assassin', 'Gamer3', 14, 2000, 'Assassin', 95, 90, 50, 45, '2024-08-20', '2024-03-20', 'Golden Plains'),
    ('Cleric', 'Gamer4', 9, 1000, 'Cleric', 75, 70, 110, 110, '2024-08-25', '2024-04-25', 'Frozen Tundra'),
    ('Ranger', 'Gamer5', 13, 1700, 'Ranger', 90, 85, 60, 55, '2024-09-01', '2024-05-30', 'Shattered Peaks');
INSERT INTO Item (ItemName, ItemType, ItemDamage)
VALUES 
    ('Hammer of Justice', 'Weapon', 60),
    ('Wand of Power', 'Weapon', 45),
    ('Chestplate of Strength', 'Armor', 35),
    ('Boots of Speed', 'Armor', 25),
    ('Crossbow of Accuracy', 'Weapon', 50);
INSERT INTO ItemInstantiation (IDNum, ItemName, Modifier, WhenCreated)
VALUES 
    (6, 'Hammer of Justice', 'Divine', '2024-08-05'),
    (7, 'Wand of Power', 'Mystic', '2024-08-10'),
    (8, 'Chestplate of Strength', 'Reinforced', '2024-08-15'),
    (9, 'Boots of Speed', 'Swift', '2024-08-20'),
    (10, 'Crossbow of Accuracy', 'Precise', '2024-08-25');
INSERT INTO Creep (CreepName, HitPoints, Mana, Attack)
VALUES 
    ('Imp', 80, 20, 15),
    ('Golem', 250, 10, 35),
    ('Phantom', 60, 30, 25),
    ('Giant Spider', 180, 40, 30),
    ('Vampire', 220, 50, 40);
INSERT INTO CreepInstantiation (IDNum, CreepName)
VALUES 
    (6, 'Imp'),
    (7, 'Golem'),
    (8, 'Phantom'),
    (9, 'Giant Spider'),
    (10, 'Vampire');
INSERT INTO CharacterCarriesItem (CharName, IDNum)
VALUES 
    ('Paladin', 6),
    ('Sorcerer', 7),
    ('Assassin', 8),
    ('Cleric', 9),
    ('Ranger', 10);
INSERT INTO CreepCarriesItem (CreepIDNum, ItemIDNum)
VALUES 
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);
INSERT INTO RanInto (CharName, CreepIDNum)
VALUES 
    ('Paladin', 6),
    ('Sorcerer', 7),
    ('Assassin', 8),
    ('Cleric', 9),
    ('Ranger', 10);
    
    
    select *
    from account;

select *
    from region;
    
    
    select *
    from item;
    
    select *
    from ItemInstantiation;
    
    select *
    from creep;
    
    select *
    from creep instantiation;
    
    select *
    from `character` carrying;
    
    select *
    from creep carrying;