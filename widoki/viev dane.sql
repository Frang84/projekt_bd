IF OBJECT_ID ('dane', 'V') IS NOT NULL  
DROP VIEW dane; 
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