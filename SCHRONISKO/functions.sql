
IF OBJECT_ID('[ilosc wolnych boksow]','FN') IS NOT NULL
DROP FUNCTION [ilosc wolnych boksow]

IF OBJECT_ID('urlop','FN') IS NOT NULL
DROP FUNCTION urlop

IF OBJECT_ID ('widokKarmienie', 'V') IS NOT NULL  
DROP VIEW widokKarmienie;

IF OBJECT_ID('karmienieInfo','IF') IS NOT NULL
DROP FUNCTION karmienieInfo

IF OBJECT_ID('SumaPensji','FN') IS NOT NULL
DROP FUNCTION SumaPensji

IF OBJECT_ID('wybieranieParametrow','IF') IS NOT NULL
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
LEFT JOIN [Statusy Zwierzat] ON Zwierzeta.[ID Zwierzaka] = [Statusy Zwierzat]. [ID Zwierzaka] AND [Statusy Zwierzat].[ID statusu] = 8
WHERE Zwierzeta.[ID gatunku] = 1 AND [ID statusu] is null

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
	@wagaZwierzakaDo AS INT,

	@IDstatusu AS INT
	)
RETURNS TABLE
AS
RETURN( 
SELECT 
Zwierzeta.[ID Zwierzaka],
Imie,
wiek,
waga,
rasa.[nazwa rasy],
opis,
[nazwa statusu]
FROM Zwierzeta
JOIN rasa ON rasa.[ID rasy] = Zwierzeta.[ID rasy]
left join [Statusy Zwierzat] ON Zwierzeta.[ID Zwierzaka] = [Statusy Zwierzat].[ID Zwierzaka]
left join Statusy ON [Statusy Zwierzat].[ID statusu] =Statusy.[ID statusu]
WHERE   ( (Zwierzeta.wiek BETWEEN @wiekZwierzakaOd AND @wiekZwierzakaDo ) OR (@wiekZwierzakaOd = 0 AND @wiekZwierzakaDo = 0))  AND
		((Zwierzeta.waga BETWEEN @wagaZwierzakaOd AND @wagaZwierzakaDo) OR (@wagaZwierzakaOd = 0 AND @wagaZwierzakaDo = 0)) AND 
		(Zwierzeta.[ID Zwierzaka] = @ID or @ID = 0) AND 
		(Zwierzeta.Imie LIKE @imieZwierzaka or @imieZwierzaka IS NULL) AND
		( (Statusy.[ID statusu] = @IDstatusu ) OR (@IDstatusu = 0 AND Statusy.[ID statusu] = 1))
)
