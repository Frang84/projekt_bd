CREATE FUNCTION wybieranieParametrow
(
	@ID AS INT = 0,
	@imieZwierzaka AS NVARCHAR(50) = NULL,

	@wiekZwierzakaOd AS INT,
	@wiekZwierzakaDo AS INT,

	@wagaZwierzakaOd AS INT,
	@wagaZwierzakaDo AS INT
	)
RETURNS TABLE
AS
RETURN( 
SELECT 
[ID Zwierzaka],
Imie,
wiek,
waga,
rasa.[nazwa rasy],
opis
FROM Zwierzeta
JOIN rasa ON rasa.[ID rasy] = Zwierzeta.[ID rasy]
WHERE   ( (Zwierzeta.wiek BETWEEN @wiekZwierzakaOd AND @wiekZwierzakaDo ) OR (@wiekZwierzakaOd = 0 AND @wiekZwierzakaDo = 0))  AND
		((Zwierzeta.waga BETWEEN @wagaZwierzakaOd AND @wagaZwierzakaDo) OR (@wagaZwierzakaOd = 0 AND @wagaZwierzakaDo = 0)) AND 
		(Zwierzeta.[ID Zwierzaka] = @ID or @ID = 0) AND 
		(Zwierzeta.Imie LIKE @imieZwierzaka or @imieZwierzaka IS NULL)
)