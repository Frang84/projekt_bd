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
