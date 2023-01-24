CREATE VIEW widokKarmienie AS 
SELECT Zwierzeta.[ID Zwierzaka],gatunki.nazwa,Zwierzeta.Imie,karmy.nazwa 'nazwa karmy',boksy.[ID boksu] FROM Zwierzeta
LEFT JOIN karmienie ON karmienie.[ID Zwierzaka] = Zwierzeta.[ID Zwierzaka]
LEFT JOIN karmy ON karmienie.[ID karmy] = karmy.[ID karmy]
LEFT JOIN gatunki ON gatunki.[ID gatunku] = Zwierzeta.[ID gatunku]
LEFT JOIN boksy ON boksy.[ID Zwierzaka] = Zwierzeta.[ID Zwierzaka]




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