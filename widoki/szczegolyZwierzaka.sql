CREATE VIEW szczegolyZwierzaka AS
SELECT
Zwierzeta.[ID Zwierzaka], Zwierzeta.Imie, gatunki.nazwa, rasa.[nazwa rasy],Zwierzeta.plec ,Zwierzeta.waga, zwierzeta.sterylizacja, Zwierzeta.opis,
[specjalne potrzeby].opis AS 'Specjalne potrzeby',boksy.[ID boksu]
FROM Zwierzeta
LEFT JOIN rasa ON rasa.[ID rasy] = Zwierzeta.[ID rasy]
LEFT JOIN gatunki ON gatunki.[ID gatunku] = Zwierzeta.[ID gatunku]
LEFT JOIN [specjalne potrzeby] ON [specjalne potrzeby].[ID Zwierzaka] = Zwierzeta.[ID Zwierzaka]
LEFT JOIN boksy ON boksy.[ID Zwierzaka] = Zwierzeta.[ID Zwierzaka]



