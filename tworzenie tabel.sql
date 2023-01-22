IF OBJECT_ID('opiekuni', N'U') IS NOT NULL
	drop table opiekuni
IF OBJECT_ID('karmienie', N'U') IS NOT NULL
	drop table karmienie
IF OBJECT_ID('karmy', N'U') IS NOT NULL
	drop table karmy
IF OBJECT_ID('specjalne potrzeby', N'U') IS NOT NULL
	drop table [specjalne potrzeby]
IF OBJECT_ID('adopcje', N'U') IS NOT NULL
	drop table adopcje
IF OBJECT_ID('boksy', N'U') IS NOT NULL
	drop table boksy
IF OBJECT_ID('urlopy', N'U') IS NOT NULL
	drop table urlopy
IF OBJECT_ID('wolontariusze', N'U') IS NOT NULL
	drop table wolontariusze
IF OBJECT_ID('pracownicy', N'U') IS NOT NULL
	drop table pracownicy
IF OBJECT_ID('zatrudniony', N'U') IS NOT NULL
	drop table [zatrudniony]
IF OBJECT_ID('adoptujacy', N'U') IS NOT NULL
	drop table [adoptujacy]
IF OBJECT_ID('Statusy Zwierzat', N'U') IS NOT NULL
	drop table [Statusy Zwierzat]
IF OBJECT_ID('Statusy', N'U') IS NOT NULL
	drop table Statusy
IF OBJECT_ID ( 'Zwierzeta' , N'U') IS NOT NULL 
	drop table Zwierzeta
IF OBJECT_ID('rasa', N'U') IS NOT NULL
	drop table rasa
	
IF OBJECT_ID('gatunki', N'U') IS NOT NULL
	drop table gatunki


CREATE TABLE gatunki(
[ID gatunku] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
nazwa NVARCHAR(50)
)



CREATE TABLE rasa(
[ID rasy] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
[ID gatunku] INT NOT NULL,
[nazwa rasy] NVARCHAR(50),
FOREIGN KEY ([ID gatunku]) REFERENCES gatunki([ID gatunku])
)


CREATE TABLE Zwierzeta(
[ID Zwierzaka] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
Imie NVARCHAR(50),
[ID gatunku] INT NOT NULL,
[ID rasy] INT ,
[miejsce znalezienia] NVARCHAR(1000),
[data znalezienia] DATE,
wiek INT NOT NULL,
waga INT,
plec NVARCHAR(6),
sterylizacja CHAR,
opis NVARCHAR(1000),
zdjecie IMAGE,
FOREIGN KEY ([ID gatunku]) REFERENCES gatunki([ID gatunku]),
FOREIGN KEY ([ID rasy]) REFERENCES rasa([ID rasy])
)



CREATE TABLE Statusy(
[ID statusu] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
[nazwa statusu] NVARCHAR(100),
)



CREATE TABLE [Statusy Zwierzat] (
[ID Zwierzaka] INT NOT NULL,
[ID statusu] INT NOT NULL,
PRIMARY KEY ( [ID Zwierzaka], [ID statusu]) ,
FOREIGN KEY ([ID Zwierzaka]) REFERENCES Zwierzeta([ID Zwierzaka]),
FOREIGN KEY ([ID statusu]) REFERENCES statusy([ID statusu])
)



CREATE TABLE adoptujacy(
[ID adoptujacego] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
adres NVARCHAR(200) ,
telefon NVARCHAR(12) NOT NULL,
wiek int,
imie NVARCHAR(50),
nazwisko NVARCHAR(50)
)




CREATE TABLE zatrudniony(
[ID zatrudnionego] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
adres NVARCHAR(200),
telefon NVARCHAR(12),
wiek int,
imie NVARCHAR(50),
nazwisko NVARCHAR(50),
pesel NVARCHAR(12) NOT NULL
)


CREATE TABLE pracownicy(
[ID zatrudnionego] INT NOT NULL,
[data przyjecia] DATE,
pensja INT,
FOREIGN KEY ([ID zatrudnionego]) REFERENCES zatrudniony([ID zatrudnionego])
)


CREATE TABLE wolontariusze(
[ID zatrudnionego] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
[Ilosc godzin] INT,
FOREIGN KEY ([ID zatrudnionego]) REFERENCES zatrudniony([ID zatrudnionego])
)


CREATE TABLE boksy(
[ID boksu] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
[ID Zwierzaka] INT ,
[ID gatunku] INT NOT NULL,
FOREIGN KEY ([ID Zwierzaka]) REFERENCES Zwierzeta([ID Zwierzaka]),
FOREIGN KEY ([ID gatunku]) REFERENCES gatunki([ID gatunku]),

)



CREATE TABLE urlopy(
[ID zatrudnionego] INT NOT NULL,
od DATE,
do DATE
PRIMARY KEY ([ID zatrudnionego], od),
FOREIGN KEY ([ID zatrudnionego]) REFERENCES zatrudniony([ID zatrudnionego])
)



CREATE TABLE adopcje(
[ID adoptujacego] INT,
[ID Zwierzaka] INT
PRIMARY KEY ([ID adoptujacego], [ID Zwierzaka]),
FOREIGN KEY ([ID Zwierzaka]) REFERENCES Zwierzeta([ID Zwierzaka]),
FOREIGN KEY ([ID adoptujacego]) REFERENCES adoptujacy([ID adoptujacego]),
)



CREATE TABLE [specjalne potrzeby](
[ID Zwierzaka] INT PRIMARY KEY NOT NULL , 
opis NVARCHAR(500),
FOREIGN KEY ([ID Zwierzaka]) REFERENCES Zwierzeta([ID Zwierzaka]),
)


CREATE TABLE karmy(
[ID karmy] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
nazwa NVARCHAR(100),
ilosc INT,
Cena MONEY,
dostawca NVARCHAR(100)
)



CREATE TABLE karmienie(
[ID Zwierzaka] INT,
[ID karmy] INT,
PRIMARY KEY ([ID Zwierzaka], [ID karmy]),
FOREIGN KEY ([ID Zwierzaka]) REFERENCES Zwierzeta([ID Zwierzaka]),
FOREIGN KEY ([ID karmy]) REFERENCES karmy([ID karmy])
)

CREATE TABLE opiekuni(
[ID Zwierzaka] INT NOT NULL,
[ID zatrudnionego] INT NOT NULL
PRIMARY KEY([ID Zwierzaka], [ID zatrudnionego]),
FOREIGN KEY ([ID Zwierzaka]) REFERENCES Zwierzeta([ID Zwierzaka]),
FOREIGN KEY ([ID zatrudnionego]) REFERENCES zatrudniony([ID zatrudnionego])
)
