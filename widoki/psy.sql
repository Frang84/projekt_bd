CREATE VIEW psy AS 
SELECT Zwierzeta.[ID Zwierzaka],Zwierzeta.Imie,gatunki.nazwa AS 'Gatunek',Zwierzeta.plec,rasa.[nazwa rasy],Zwierzeta.wiek,Zwierzeta.waga,Zwierzeta.opis, 
		[specjalne potrzeby].opis AS 'specjalne potrzeby',Zwierzeta.[data znalezienia], Zwierzeta.[miejsce znalezienia],Zwierzeta.sterylizacja
FROM Zwierzeta 
LEFT JOIN gatunki ON gatunki.[ID gatunku] = Zwierzeta.[ID gatunku]
LEFT JOIN [specjalne potrzeby] ON [specjalne potrzeby].[ID Zwierzaka] = Zwierzeta.[ID Zwierzaka]
LEFt JOIN rasa ON rasa.[ID rasy] = Zwierzeta.[ID rasy]
WHERE Zwierzeta.[ID gatunku] = 1



