# BAZA DANYCH SCHRONISKA DLA ZWIERZĄT
Co roku zwierzęta oddawane są od schronisk. Dzieje się to na skutek śmierci właściciel, braku odpowiedzialności czy też zmiany sytuacji materialnej. Obecnie to ostatni z wyżej wymienionych powodów jest najczęstszą przyczyna decyzji o oddaniu psa lub kota. Schroniska z tego powodu są coraz bardziej obciążone. Nasza baza danych powstała w celu ułatwienia w zarządzaniu ta jakże szczytną instytucją. 
## założenia projektu
Projekt ma na celu stworzenie bazy danych, która będzie przechowywać informacje o zwierzętach jak i opiekunach. baza danych z założenia ma ułatwiać prowadzenie schroniska oraz automatyzować część czynności, które normalnie musieliby robić pracownicy.  
## główne założenia 
Głównym założeniem projektu było stworzenie bazy danych, na której może operować strona internetowa schroniska. Osoby chcące zaadoptować swojego wymarzonego pupila powinny móc bez problemu dobrać wielkość, wiek, oraz inne potrzeby przyszłego nowego członka rodziny do swoich upodobań oraz możliwości bytowych. Od strony pracowników baza ta pozwala na podstawowe zarządzanie instytucją. Dzieki naszemu projektowi wiadome są przybliżone koszty jakie schronisko będzie musiało ponieć podczas swojego działania. 
## możliwości 
Zaprojektowana przez nas baza danych ma wiele zaimplementowanych funkcjonalności. Pozwala na wyszukiwanie zwierząt o odpowiednich parametrach takich jak wielkość, wiek czy też rasa. Możemy także zobaczyć jakie zwierzęta znajdują się obeznie w domu tymczasowym lub zobaczyć szczegółowe zapotrzebowania poodopiecznego. 
## Strategie pielęgnowania bazy danych
1.Utworzenie kopii zapasowych - w wypaku bazy danych schroniska jest to tanie rozwiązanie ze względu na ilośc rekordów, która jest przetrzymywana z tabelach.

2.Zagrożenia wewnętrzne - w tym wypadku należy chronić baze danych przed uzytkownikami, którzy pracuja w schronisku i z jakiegoś powodu celowo chcą zaszkodzić organizacji. W celu zapobiegania takich ataków należy uważac, aby za dużo osób nie miało dostępu do bazy danych jako uprzywilejowany użytkownik. 

3.Zagrożenia zewnętrzne z wykorzystaniem kodu SQL - aby chronić bazę danych przed tym zagrożeniem należy na bierząco dbać o  sprawdzanie luk w oprogramowaniu.
## Diagram ER
![DIAGRAM ER](https://github.com/Frang84/projekt_bd/blob/583973b373becbd73deb333a53b7afcfceb7e023/obrazy/obraz_2023-01-31_202725425.png)
## Dodatkowe więzy integralności bazy danych 
 - Zwierzeta: 
     - wiek > 0,
     - waga > 0,
     - sterylizacja = 'T' OR sterylizacja = 'N',
     - plec = 'SAMIEC' OR plec = 'SAMICA' .
 -Adoptujacy: 
     - wiek >= 18 ,
 - Pracownik: 
     - pensja > 0 .
 - Wolontariusze:
     - Ilosc godzin >= 0 .
 - Urlopy: 
     - od < do .
 - Karmy: 
     - cena > 0 ,
     - ilosc > 0 .

## Schematy dziedziczenia 
   - W tabeli Zwierzęta zastosowaliśmy rodzaj dziedziczenia TBH(Table per Hierarchy), w tym przypadku koty jak i psy mają te same atrybuty. Nie musimy więc tworzyć oddzielnych klas dziedziczących 
   - W przypadku tabeli Zatrudnieni mamy do czynienia z dziedziczeniem TPC(Table Per Concrete Class). Wolontariusz jak i pracownik mają imie, nazwisko oraz pesel. Pracownik pobiera jednak za swoją pracę wynagrodzenie. 

## Procedury 
```tsql
IF OBJECT_ID('dodawanieGodzinWolontariatu','P') IS NOT NULL
DROP PROC dodawanieGodzinWolontariatu

IF OBJECT_ID('dodawanieKarmy','P') IS NOT NULL
DROP PROC dodawanieKarmy

IF OBJECT_ID('domTyczasowy','P') IS NOT NULL
DROP PROC domTyczasowy


IF OBJECT_ID('[odejmowanie karmy]','P') IS NOT NULL
DROP PROC [odejmowanie karmy]

IF OBJECT_ID('[Usuwanie Zwierzaka]','P') IS NOT NULL
DROP PROC [Usuwanie Zwierzaka]

IF OBJECT_ID('[Rozpoczecie adopcji]','P') IS NOT NULL
DROP PROC [Rozpoczecie adopcji]

IF OBJECT_ID('[Anulowanie adopcji]','P') IS NOT NULL
DROP PROC [Anulowanie adopcji]


IF OBJECT_ID('[finalizacja adopcji]','P') IS NOT NULL
DROP PROC [finalizacja adopcji]


GO

CREATE PROCEDURE dodawanieGodzinWolontariatu 
@idWolontariusza AS INT, @iloscGodzin AS INT
AS 
UPDATE wolontariusze SET [Ilosc godzin] = [Ilosc godzin] + @iloscGodzin
WHERE [ID zatrudnionego] = @idWolontariusza

GO


CREATE PROCEDURE dodawanieKarmy 
@idKarmy AS INT, @ilosc AS INT
AS	
UPDATE karmy SET ilosc = ilosc + @ilosc 
WHERE [ID karmy] = @idKarmy

GO



CREATE PROCEDURE domTyczasowy
@IdZwierzaka INT 
AS 
	DELETE FROM [Statusy Zwierzat]
	WHERE [ID Zwierzaka] = @IdZwierzaka AND( [ID statusu] = 1 OR  [ID statusu] =5)

	DELETE FROM karmienie
	WHERE [ID Zwierzaka] = @IdZwierzaka

	DELETE FROM opiekuni 
	WHERE [ID Zwierzaka] = @IdZwierzaka

	UPDATE boksy SET boksy.[ID Zwierzaka] = NULL
	WHERE boksy.[ID Zwierzaka] = @IdZwierzaka

	INSERT INTO [Statusy Zwierzat] 
	VALUES(@IdZwierzaka,2)


GO
CREATE PROCEDURE [odejmowanie karmy]( @ID INT, @waga INT)
AS
UPDATE karmy
SET ilosc = ( ilosc - @WAGA)
WHERE [ID karmy] = @ID

GO




CREATE PROC [Usuwanie Zwierzaka] (@ID INT)
AS
UPDATE boksy
SET [ID Zwierzaka] = null
WHERE [ID Zwierzaka] = @ID

DELETE FROM karmienie
WHERE [ID Zwierzaka] = @ID

DELETE FROM opiekuni
WHERE [ID Zwierzaka] = @ID

GO


CREATE PROC [Rozpoczecie adopcji] (@IDzwierzaka INT, @IDadoptujacego INT)
AS

DELETE FROM [Statusy Zwierzat] 
WHERE [ID Zwierzaka] = @IDzwierzaka AND [ID statusu] != 2

INSERT INTO [Statusy Zwierzat] ([ID Zwierzaka] , [ID statusu] )
VALUES (@IDzwierzaka , 3)

INSERT INTO adopcje ([ID adoptujacego] , [ID Zwierzaka] )
VALUES (@IDadoptujacego , @IDzwierzaka )



GO



CREATE PROC [Anulowanie adopcji]  (@IDzwierzaka INT)
AS
DELETE FROM [Statusy Zwierzat] WHERE [ID Zwierzaka] = @IDzwierzaka AND [ID statusu] = 3

INSERT INTO [Statusy Zwierzat] ([ID statusu] , [ID Zwierzaka] )
VALUES ( 5 , @IDzwierzaka )

DELETE FROM adopcje WHERE @IDzwierzaka = [ID Zwierzaka] 

GO


CREATE PROC [finalizacja adopcji] (@IDzwierzaka INT)
AS
DELETE FROM [Statusy Zwierzat] WHERE [ID Zwierzaka] = @IDzwierzaka

UPDATE boksy 
SET [ID Zwierzaka] = null
WHERE [ID Zwierzaka] = @IDzwierzaka

DELETE FROM karmienie WHERE [ID Zwierzaka] = @IDzwierzaka

DELETE FROM opiekuni WHERE [ID Zwierzaka] = @IDzwierzaka

DELETE FROM [specjalne potrzeby] WHERE [ID Zwierzaka] = @IDzwierzaka

INSERT INTO [Statusy Zwierzat] ([ID statusu] , [ID Zwierzaka] )
VALUES (8 , @IDzwierzaka )

GO


----------------------------------------------------------------------
IF OBJECT_ID('[status do leczenia]','P') IS NOT NULL
DROP PROC [status do leczenia]

IF OBJECT_ID('[status do adopcji]','P') IS NOT NULL
DROP PROC [status do adopcji]

GO

CREATE PROC [status do leczenia] (@IDzwierzaka INT)
AS
DELETE FROM [Statusy Zwierzat] WHERE [ID Zwierzaka] = @IDzwierzaka AND ( [ID statusu] = 1 OR [ID statusu] = 5 OR [ID statusu] = 7 )

INSERT INTO [Statusy Zwierzat] ([ID statusu] , [ID Zwierzaka] )
VALUES ( 6, @IDzwierzaka )

GO 

CREATE PROC [status do adopcji] (@IDzwierzaka INT)
AS
DELETE FROM [Statusy Zwierzat] WHERE [ID Zwierzaka] = @IDzwierzaka AND ( [ID statusu] = 1 OR [ID statusu] = 5 OR [ID statusu] = 6 )
INSERT INTO [Statusy Zwierzat] ([ID statusu] , [ID Zwierzaka] )
VALUES ( 1, @IDzwierzaka )
```
1. Dodawanie godzin wolontariatu - jest to procedura służąca do dodawania godzin wolontariatu  \
2. Dodawanie karmy - procedura odpowiedzialna za uwzględnianie kupionej karmy  \
3. Odjemowanie karmy - procedura odpowiedzialna za odjemowanie karmy \
4. Dom tymczasowy - procedura, ktora przenosi poodopiecznego ze schroniska do domu tymczasowego i uwzględniając to ,że zatrudnione osoby nie musza zajmować się zwierzakiem ,a jego boks może zając inny porzucony przyjaciel \
5. Anulowanie adopcji - usuwa zwierzaka z tabeli adoptowani \
6. Rozpoczecie adopcji - Procedura rozpoczyna adoplcje \
7. status do leczenia - \
8. status do adopcji 

## Widoki 
```tsql
IF OBJECT_ID ('boksOsoba', 'V') IS NOT NULL  
DROP VIEW boksOsoba;

IF OBJECT_ID ('psy', 'V') IS NOT NULL  
DROP VIEW psy;

IF OBJECT_ID ('szczegolyZwierzaka', 'V') IS NOT NULL  
DROP VIEW szczegolyZwierzaka; 

IF OBJECT_ID ('tymczas', 'V') IS NOT NULL  
DROP VIEW tymczas; 

IF OBJECT_ID ('dane', 'V') IS NOT NULL  
DROP VIEW dane; 

IF OBJECT_ID ('koty', 'V') IS NOT NULL  
DROP VIEW koty; 


GO

CREATE VIEW boksOsoba AS 
SELECT zatrudniony.* , [ID boksu] FROM zatrudniony 
LEFT JOIN opiekuni ON zatrudniony.[ID zatrudnionego] = opiekuni.[ID zatrudnionego]
LEFT JOIN boksy ON opiekuni.[ID Zwierzaka] = boksy.[ID Zwierzaka]
GO



CREATE VIEW psy AS 
SELECT Zwierzeta.[ID Zwierzaka],Zwierzeta.Imie,gatunki.nazwa AS 'Gatunek',Zwierzeta.plec,rasa.[nazwa rasy],Zwierzeta.wiek,Zwierzeta.waga,Zwierzeta.opis, 
		[specjalne potrzeby].opis AS 'specjalne potrzeby',Zwierzeta.[data znalezienia], Zwierzeta.[miejsce znalezienia],Zwierzeta.sterylizacja
FROM Zwierzeta 
LEFT JOIN gatunki ON gatunki.[ID gatunku] = Zwierzeta.[ID gatunku]
LEFT JOIN [specjalne potrzeby] ON [specjalne potrzeby].[ID Zwierzaka] = Zwierzeta.[ID Zwierzaka]
LEFt JOIN rasa ON rasa.[ID rasy] = Zwierzeta.[ID rasy]
WHERE Zwierzeta.[ID gatunku] = 1

GO



CREATE VIEW szczegolyZwierzaka AS
SELECT
Zwierzeta.[ID Zwierzaka], Zwierzeta.Imie, gatunki.nazwa, rasa.[nazwa rasy],Zwierzeta.plec ,Zwierzeta.waga, zwierzeta.sterylizacja, Zwierzeta.opis,
[specjalne potrzeby].opis AS 'Specjalne potrzeby',boksy.[ID boksu]
FROM Zwierzeta
LEFT JOIN rasa ON rasa.[ID rasy] = Zwierzeta.[ID rasy]
LEFT JOIN gatunki ON gatunki.[ID gatunku] = Zwierzeta.[ID gatunku]
LEFT JOIN [specjalne potrzeby] ON [specjalne potrzeby].[ID Zwierzaka] = Zwierzeta.[ID Zwierzaka]
LEFT JOIN boksy ON boksy.[ID Zwierzaka] = Zwierzeta.[ID Zwierzaka]

GO



CREATE VIEW tymczas
AS
SELECT szczegolyZwierzaka.* FROM szczegolyZwierzaka
LEFT JOIN [Statusy Zwierzat] ON [Statusy Zwierzat].[ID Zwierzaka] = szczegolyZwierzaka.[ID Zwierzaka]
WHERE [Statusy Zwierzat].[ID statusu] = 2 OR [Statusy Zwierzat].[ID statusu] = 7

GO


CREATE VIEW dane AS
SELECT Z.[ID Zwierzaka] , Z.Imie , B.[ID boksu] , karmy.nazwa , S.opis FROM Zwierzeta AS Z
LEFT JOIN karmienie AS K
ON Z.[ID Zwierzaka] = K.[ID Zwierzaka]
LEFT JOIN karmy
ON K.[ID karmy] = karmy.[ID karmy]
LEFT JOIN boksy AS B
ON B.[ID Zwierzaka] = Z.[ID Zwierzaka]
LEFT JOIN [specjalne potrzeby] AS S
ON Z.[ID Zwierzaka] = S.[ID Zwierzaka]

GO


CREATE VIEW koty AS 
SELECT Zwierzeta.[ID Zwierzaka] , Imie , [nazwa rasy] , [miejsce znalezienia], [data znalezienia], wiek, waga, plec, sterylizacja, opis, zdjecie FROM Zwierzeta
left join rasa
ON Zwierzeta.[ID rasy] = rasa.[ID rasy]
WHERE Zwierzeta.[ID gatunku] = 2
```
1. boksOsoba - wyświetla informacje o osobie ktora zajmuje sie danym boksem oraz wysiwtla id boksu 
2. psy - widok wyswietlajacy psy 
3. szczegolyZwierzaka - widok wyswietlajacy szczegółowe informacje na temat zwierzaka oraz jego stanu 
4. tymczas - widok wyswietlajacy informacje o zwierzetach przebywajacych w domu tymczasowym 
5. dane - wyswietla informacje o tym jakie karmy powinien jesc dany zwierzak oraz jakie ma specjalne potrzeby 
6. koty - widok wyświetlający tylko koty do adopcji 

## Funkcje
```tsql
IF OBJECT_ID('[ilosc wolnych boksow]','FN') IS NOT NULL
DROP FUNCTION [ilosc wolnych boksow]

IF OBJECT_ID('urlop','FN') IS NOT NULL
DROP FUNCTION urlop

IF OBJECT_ID ('widokKarmienie', 'V') IS NOT NULL  
DROP VIEW widokKarmienie;


IF OBJECT_ID('karmienieInfo','FN') IS NOT NULL
DROP FUNCTION karmienieInfo

IF OBJECT_ID('SumaPensji','FN') IS NOT NULL
DROP FUNCTION SumaPensji

IF OBJECT_ID('wybieranieParametrow','FN') IS NOT NULL
DROP FUNCTION wybieranieParametrow


GO

CREATE FUNCTION [ilosc wolnych boksow] ( @id INT)
RETURNS INT
BEGIN 
RETURN (SELECT COUNT(boksy.[ID boksu]) FROM boksy
	WHERE [ID gatunku] = @id AND [ID Zwierzaka] IS NULL)
END

GO



CREATE FUNCTION urlop ( @poczatek DATE, @koniec DATE)
RETURNS BIT
BEGIN 
IF ( SELECT count(*) FROM urlopy
		WHERE od >= @poczatek AND do <= @koniec
	 ) < ((SELECT count(*) FROM pracownicy) * 0.2)
		BEGIN
		 RETURN 1
END
RETURN 0
END

GO


CREATE VIEW widokKarmienie AS 
SELECT Zwierzeta.[ID Zwierzaka],gatunki.nazwa,Zwierzeta.Imie,karmy.nazwa 'nazwa karmy',boksy.[ID boksu] FROM Zwierzeta
LEFT JOIN karmienie ON karmienie.[ID Zwierzaka] = Zwierzeta.[ID Zwierzaka]
LEFT JOIN karmy ON karmienie.[ID karmy] = karmy.[ID karmy]
LEFT JOIN gatunki ON gatunki.[ID gatunku] = Zwierzeta.[ID gatunku]
LEFT JOIN boksy ON boksy.[ID Zwierzaka] = Zwierzeta.[ID Zwierzaka]


GO


CREATE FUNCTION karmienieInfo 
(
	 @id INT ,
	 @imie NVARCHAR(50) ,
	 @IDboksu INT 
)
RETURNS TABLE
AS 
RETURN(
	SELECT * FROM widokKarmienie
	WHERE (
	(widokKarmienie.[ID Zwierzaka] = @id OR @id = 0) AND 
	(widokKarmienie.Imie LIKE @imie OR @imie IS NULL) AND 
	(widokKarmienie.[ID boksu] = @IDboksu OR @IDboksu = 0)
	)
)



/*"widokKarmienie" uzywany jest w funckji "karmienieInfo", ktora uzywana jest przez osoby pracujace w schronisku. Dzieki tej funckji pracownicy jak i 
wolontariusze moga dowiedziec sie co moga jesc ich poodopieczni. Uzycie widoku w funckji skraca dlugosc kodu funckji dzieki czemu kod funckji staje sie bardziej 
przejzysty*/

GO


CREATE FUNCTION SumaPensji()
RETURNS MONEY
AS 
BEGIN 
DECLARE @SUM AS MONEY 
SELECT @SUM = SUM(pensja) FROM pracownicy
RETURN @SUM 
END


GO


CREATE FUNCTION wybieranieParametrow
(
	@ID AS INT = 0,
	@imieZwierzaka AS NVARCHAR(50) = NULL,

	@wiekZwierzakaOd AS INT,
	@wiekZwierzakaDo AS INT,

	@wagaZwierzakaOd AS INT,
	@wagaZwierzakaDo AS INT
	)
RETURNS TABLE
AS
RETURN( 
SELECT 
[ID Zwierzaka],
Imie,
wiek,
waga,
rasa.[nazwa rasy],
opis
FROM Zwierzeta
JOIN rasa ON rasa.[ID rasy] = Zwierzeta.[ID rasy]
WHERE   ( (Zwierzeta.wiek BETWEEN @wiekZwierzakaOd AND @wiekZwierzakaDo ) OR (@wiekZwierzakaOd = 0 AND @wiekZwierzakaDo = 0))  AND
		((Zwierzeta.waga BETWEEN @wagaZwierzakaOd AND @wagaZwierzakaDo) OR (@wagaZwierzakaOd = 0 AND @wagaZwierzakaDo = 0)) AND 
		(Zwierzeta.[ID Zwierzaka] = @ID or @ID = 0) AND 
		(Zwierzeta.Imie LIKE @imieZwierzaka or @imieZwierzaka IS NULL)
)
```
1. ilosc wolnych boksow - zwraca liczbe mówiącą ile jest wolnych boksów w schronisku 
2. widok karmienie - widok używany w funkcji karmienie info 
3. karmienie info - funkcja zwracajaca tabele z informacjami o tym jakie karmy moze jesc wybrany poodopieczny
4. sumaPensji - funkcja zwracajaca sume pensji wszystkich pracowników 
5. wybieranie parametrow - funkcja działająca jako wyszukiwarka, w której wprowadzamy odpowiednie parametry 

## Triggery/Wyzwalacze
```tsql
IF OBJECT_ID(N'dataZatrudnienia',N'TR') IS NOT NULL  
    DROP TRIGGER dataZatrudnienia  


	IF OBJECT_ID(N'boks',N'TR') IS NOT NULL  
    DROP TRIGGER boks  


	IF OBJECT_ID(N'dataPrzyjecia',N'TR') IS NOT NULL  
    DROP TRIGGER  dataPrzyjecia 


	IF OBJECT_ID(N'karm',N'TR') IS NOT NULL  
    DROP TRIGGER karm  


IF OBJECT_ID(N'opiekun',N'TR') IS NOT NULL  
    DROP TRIGGER opiekun  

IF OBJECT_ID(N'[dodanie statusu]',N'TR') IS NOT NULL  
    DROP TRIGGER [dodanie statusu]
GO

CREATE TRIGGER dataZatrudnienia ON pracownicy 
AFTER INSERT 
AS
	DECLARE @data DATE 
	DECLARE @id INT 
	SELECT @id = MAX(pracownicy.[ID zatrudnionego]) FROM pracownicy
	SELECT @data = p.[data przyjecia] FROM pracownicy p
	WHERE p.[ID zatrudnionego] = @id
	IF @data IS NULL 
		UPDATE pracownicy 
		SET [data przyjecia] = CONVERT(DATE, GETDATE())
		WHERE pracownicy.[ID zatrudnionego] = @id

GO  

CREATE TRIGGER boks
ON Zwierzeta AFTER INSERT
AS 

DECLARE @idColumn INT

SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted

WHILE @idColumn IS NOT NULL
BEGIN

	UPDATE boksy
	SET [ID Zwierzaka] = @idColumn
	WHERE [ID boksu] = (Select TOP 1 [ID boksu] FROM boksy
				WHERE [ID Zwierzaka] is null  and [ID gatunku] = (SELECT TOP 1 [ID gatunku] FROM inserted WHERE [ID Zwierzaka] = @idColumn) )


    SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted WHERE [ID Zwierzaka] > @idColumn
END

GO

CREATE TRIGGER dataPrzyjecia ON Zwierzeta 
AFTER INSERT 
AS 

	DECLARE @idColumn INT
	DECLARE @czasDodania DATE

SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted

WHILE @idColumn IS NOT NULL
BEGIN
	SELECT @czasDodania = [data znalezienia] FROM Zwierzeta
	WHERE [ID Zwierzaka] = @idColumn

	IF @czasDodania is NULL
		UPDATE Zwierzeta 
			SET [data znalezienia] = CONVERT(DATE,GETDATE())
		WHERE [ID Zwierzaka] = @idColumn
	
    SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted WHERE [ID Zwierzaka] > @idColumn
END




GO  

CREATE TRIGGER karm
ON Zwierzeta AFTER INSERT
AS 

DECLARE @idColumn INT

SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted

WHILE @idColumn IS NOT NULL
BEGIN

	IF ((SELECT COUNT(*) FROM inserted where [ID Zwierzaka] = @idColumn AND wiek <= 1 AND [ID gatunku] = 1) > 0 )
	begin
	INSERT INTO karmienie 
	VALUES	(@idColumn , 4),
			(@idColumn , 5)
	SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted WHERE [ID Zwierzaka] > @idColumn
	CONTINUE 
	END

	IF ((SELECT COUNT(*) FROM inserted where [ID Zwierzaka] = @idColumn AND wiek > 1 AND [ID gatunku] = 1) > 0 )
	begin
	INSERT INTO karmienie 
	VALUES	(@idColumn , 1),
			(@idColumn , 2),
			(@idColumn , 3)
	SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted WHERE [ID Zwierzaka] > @idColumn
	CONTINUE 
	END

	IF ((SELECT COUNT(*) FROM inserted where [ID Zwierzaka] = @idColumn AND wiek <= 1 AND [ID gatunku] = 2) > 0 )
	begin
	INSERT INTO karmienie 
	VALUES	(@idColumn , 8),
			(@idColumn , 10)
	SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted WHERE [ID Zwierzaka] > @idColumn
	CONTINUE 
	END

	IF ((SELECT COUNT(*) FROM inserted where [ID Zwierzaka] = @idColumn AND wiek > 1 AND [ID gatunku] = 2) > 0 )
	begin
	INSERT INTO karmienie 
	VALUES	(@idColumn , 6),
			(@idColumn , 7),
			(@idColumn , 9)
	SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted WHERE [ID Zwierzaka] > @idColumn
	CONTINUE 
	END
		

    SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted WHERE [ID Zwierzaka] > @idColumn
END

GO

CREATE TRIGGER opiekun
ON Zwierzeta AFTER INSERT
AS 

DECLARE @idColumn INT

SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted

WHILE @idColumn IS NOT NULL
BEGIN

	INSERT INTO opiekuni
	SELECT TOP 2 @idColumn , t.[ID zatrudnionego]FROM
		(SELECT zatrudniony.[ID zatrudnionego] , COUNT(opiekuni.[ID zatrudnionego]) AS C FROM zatrudniony
		LEFT JOIN opiekuni
		ON zatrudniony.[ID zatrudnionego] = opiekuni.[ID zatrudnionego]
		GROUP BY zatrudniony.[ID zatrudnionego]) AS t 
	order by t.C

    SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted WHERE [ID Zwierzaka] > @idColumn
END

GO

CREATE TRIGGER [dodanie statusu]
ON Zwierzeta AFTER INSERT
AS
DECLARE @idColumn INT

SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted

WHILE @idColumn IS NOT NULL
BEGIN

	INSERT INTO [Statusy Zwierzat] ([ID statusu] , [ID Zwierzaka] )
	VALUES (5, @idColumn )
	
    SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted WHERE [ID Zwierzaka] > @idColumn
END
```
1. data zatrudnienia - trigger odpowiedzialny za dodawanie daty, w której został zatrudniony dany pracownik, jeśli osoba wpisujące dane do tabeli zapomni o tej kolumnie wtedy automatycznie data zostanie wpisana na dzień dzisiejszy 
2. boks - trigger odpowiedzilny za przydzielanie zwierzaka do bosku
3. dataPrzyjecia - trigger odpowiedzialny za dodawanie daty, w której został przyjety dany zwierzak, jeśli osoba wpisujące dane do tabeli zapomni o tej kolumnie wtedy automatycznie data zostanie wpisana na dzień dzisiejszy 
4. karma - trigger przydzielający na podstawie gatunku oraz wieku karmę jaką może jeść dane zwierze 
5. opiekun - trigger przydziela zwierzakowi dwóch opiekunów, wybiera ich spośród osób zajmujących się najmniejszą ilością zwierząt 
6. dodanie statusu - każdemu dodanemu zwierzakowi dodaje status wkrótce do adopcji 

# przykładowe zapytania 
```tsql
SELECT * FROM boks_osoba

SELECT * FROM szczegolyZwierzaka

SELECT * FROM tymczas

SELECT * FROM koty
 
SELECT * FROM psy

SELECT * FROM dane



EXEC dodawanieGodzinWolontariatu 1,3

EXEC dodawanieKarmy 2,10

EXEC  [odejmowanie karmy] 3,10

EXEC domTyczasowy 3 

EXEC [Anulowanie adopcji] 6

EXEC [Rozpoczecie adopcji] 8, 1

EXEC [status do leczenia] 4

EXEC [status do adopcji] 4


SELECT * FROM wybieranieParametrow (0,NULL,1,5,0,15)

SELECT * FROM  SumaPensji()

SELECT * FROM karmienieInfo(1,NULL,0)

```

# [skrypt tworzacy baze danych, procedury, widoki, triggery i funkcje](wszystko.sql)




  
