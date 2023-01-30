CREATE PROCEDURE domTyczasowy
@IdZwierzaka INT 
AS 
	DELETE FROM [Statusy Zwierzat]
	WHERE [ID Zwierzaka] = @IdZwierzaka AND( [ID statusu] = 1 OR  [ID statusu] =5)

	DELETE FROM karmienie
	WHERE [ID Zwierzaka] = @IdZwierzaka

	DELETE FROM opiekuni 
	WHERE [ID Zwierzaka] = @IdZwierzaka

	UPDATE boksy SET boksy.[ID Zwierzaka] = NULL
	WHERE boksy.[ID Zwierzaka] = @IdZwierzaka

	INSERT INTO [Statusy Zwierzat] 
	VALUES(@IdZwierzaka,2)