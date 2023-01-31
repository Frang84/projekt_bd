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