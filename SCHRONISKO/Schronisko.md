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
1.Dodawanie godzin wolontariatu - jest to procedura służąca do dodawania godzin wolontariatu  \
2.Dodawanie karmy - procedura odpowiedzialna za uwzględnianie kupionej karmy  \
3.Odjemowanie karmy - procedura odpowiedzialna za odjemowanie karmy \
4.Dom tymczasowy - procedura, ktora przenosi poodopiecznego ze schroniska do domu tymczasowego i uwzględniając to ,że zatrudnione osoby nie musza zajmować się zwierzakiem ,a jego boks może zając inny porzucony przyjaciel \
5.Anulowanie adopcji - usuwa zwierzaka z tabeli adoptowani \
6.Rozpoczecie adopcji - Procedura rozpoczyna adoplcje 

## Widoki i funkcje 



  
