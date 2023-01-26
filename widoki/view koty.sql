IF OBJECT_ID ('koty', 'V') IS NOT NULL  
DROP VIEW koty; 
GO
CREATE VIEW koty AS 
SELECT Zwierzeta.[ID Zwierzaka] , Imie , [nazwa rasy] , [miejsce znalezienia], [data znalezienia], wiek, waga, plec, sterylizacja, opis, zdjecie FROM Zwierzeta
left join rasa
ON Zwierzeta.[ID rasy] = rasa.[ID rasy]
WHERE Zwierzeta.[ID gatunku] = 2