/*Funkcja podliczajaca ile wyniosa 
koszty pensji pracownikow*/

CREATE FUNCTION SumaPensji()
RETURNS MONEY
AS 
BEGIN 
DECLARE @SUM AS MONEY 
SELECT @SUM = SUM(pensja) FROM pracownicy
RETURN @SUM 
END


DECLARE @RESULT AS MONEY 
SELECT @RESULT = dbo.SumaPensji()
PRINT @RESULT




