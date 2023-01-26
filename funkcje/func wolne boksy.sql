IF OBJECT_ID('[ilosc wolnych boksow]','FN') IS NOT NULL
DROP FUNCTION [ilosc wolnych boksow]

GO

CREATE FUNCTION [ilosc wolnych boksow] ( @id INT)
RETURNS INT
BEGIN 
RETURN (SELECT COUNT(boksy.[ID boksu]) FROM boksy
	WHERE [ID gatunku] = @id AND [ID Zwierzaka] IS NULL)
END

GO
