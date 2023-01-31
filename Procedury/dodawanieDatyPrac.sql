CREATE TRIGGER dataZatrudnienia ON pracownicy 
AFTER INSERT 
AS
	DECLARE @data DATE 
	DECLARE @id INT 
	SELECT @id = MAX(pracownicy.[ID zatrudnionego]) FROM pracownicy
	SELECT @data = p.[data przyjecia] FROM pracownicy p
	WHERE p.[ID zatrudnionego] = @id
	IF @data IS NULL 
		UPDATE pracownicy 
		SET [data przyjecia] = CONVERT(DATE, GETDATE())
		WHERE pracownicy.[ID zatrudnionego] = @id