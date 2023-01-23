CREATE VIEW szczegolyZwierzaka AS
SELECT
Zwierzeta.[ID Zwierzaka], Zwierzeta.Imie, gatunki.nazwa, rasa.[nazwa rasy],Zwierzeta.plec ,Zwierzeta.waga, zwierzeta.sterylizacja, karmy.nazwa AS 'Nazwa karmy',
[specjalne potrzeby].opis AS 'Specjalne potrzeby'
FROM Zwierzeta
LEFT JOIN rasa ON rasa.[ID rasy] = Zwierzeta.[ID rasy]
LEFT JOIN gatunki ON gatunki.[ID gatunku] = Zwierzeta.[ID gatunku]
LEFT JOIN karmienie ON karmienie.[ID Zwierzaka] = Zwierzeta.[ID Zwierzaka]
LEFT JOIN karmy ON karmy.[ID karmy] = karmienie.[ID karmy] --czy to ma sens 
LEFT JOIN [specjalne potrzeby] ON [specjalne potrzeby].[ID Zwierzaka] = Zwierzeta.[ID Zwierzaka]



