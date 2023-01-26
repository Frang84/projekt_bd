IF OBJECT_ID('urlop','FN') IS NOT NULL
DROP FUNCTION urlop
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
