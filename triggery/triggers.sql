GO  
IF OBJECT_ID(N'boks',N'TR') IS NOT NULL  
    DROP TRIGGER boks  
GO
CREATE TRIGGER boks
ON Zwierzeta AFTER INSERT
AS 

DECLARE @idColumn INT

SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted

WHILE @idColumn IS NOT NULL
BEGIN

	UPDATE boksy
	SET [ID Zwierzaka] = @idColumn
	WHERE [ID boksu] = (Select TOP 1 [ID boksu] FROM boksy
				WHERE [ID Zwierzaka] is null  and [ID gatunku] = (SELECT TOP 1 [ID gatunku] FROM inserted WHERE [ID Zwierzaka] = @idColumn) )

    SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted WHERE [ID Zwierzaka] > @idColumn
END

GO  
IF OBJECT_ID(N'karm',N'TR') IS NOT NULL  
    DROP TRIGGER karm  
GO
CREATE TRIGGER karm
ON Zwierzeta AFTER INSERT
AS 

DECLARE @idColumn INT

SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted

WHILE @idColumn IS NOT NULL
BEGIN

	IF ((SELECT COUNT(*) FROM inserted where [ID Zwierzaka] = @idColumn AND wiek <= 1 AND [ID gatunku] = 1) > 0 )
	begin
	INSERT INTO karmienie 
	VALUES	(@idColumn , 4),
			(@idColumn , 5)
	SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted WHERE [ID Zwierzaka] > @idColumn
	CONTINUE 
	END

	IF ((SELECT COUNT(*) FROM inserted where [ID Zwierzaka] = @idColumn AND wiek > 1 AND [ID gatunku] = 1) > 0 )
	begin
	INSERT INTO karmienie 
	VALUES	(@idColumn , 1),
			(@idColumn , 2),
			(@idColumn , 3)
	SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted WHERE [ID Zwierzaka] > @idColumn
	CONTINUE 
	END

	IF ((SELECT COUNT(*) FROM inserted where [ID Zwierzaka] = @idColumn AND wiek <= 1 AND [ID gatunku] = 2) > 0 )
	begin
	INSERT INTO karmienie 
	VALUES	(@idColumn , 8),
			(@idColumn , 10)
	SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted WHERE [ID Zwierzaka] > @idColumn
	CONTINUE 
	END

	IF ((SELECT COUNT(*) FROM inserted where [ID Zwierzaka] = @idColumn AND wiek > 1 AND [ID gatunku] = 2) > 0 )
	begin
	INSERT INTO karmienie 
	VALUES	(@idColumn , 6),
			(@idColumn , 7),
			(@idColumn , 9)
	SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted WHERE [ID Zwierzaka] > @idColumn
	CONTINUE 
	END
		

    SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted WHERE [ID Zwierzaka] > @idColumn
END

GO


IF OBJECT_ID(N'opiekun',N'TR') IS NOT NULL  
    DROP TRIGGER opiekun  
GO
CREATE TRIGGER opiekun
ON Zwierzeta AFTER INSERT
AS 

DECLARE @idColumn INT

SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted

WHILE @idColumn IS NOT NULL
BEGIN

	INSERT INTO opiekuni
	SELECT TOP 2 @idColumn , t.[ID zatrudnionego]FROM
		(SELECT zatrudniony.[ID zatrudnionego] , COUNT(opiekuni.[ID zatrudnionego]) AS C FROM zatrudniony
		LEFT JOIN opiekuni
		ON zatrudniony.[ID zatrudnionego] = opiekuni.[ID zatrudnionego]
		GROUP BY zatrudniony.[ID zatrudnionego]) AS t 
	order by t.C

    SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted WHERE [ID Zwierzaka] > @idColumn
END

GO
