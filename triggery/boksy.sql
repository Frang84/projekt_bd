

GO  
IF OBJECT_ID(N'boks',N'TR') IS NOT NULL  
    DROP TRIGGER boks  
GO
CREATE TRIGGER boks
ON Zwierzeta AFTER INSERT
AS
 --select [ID Zwierzaka] from inserted
 select [ID Zwierzaka] FROM inserted
 UPDATE boksy
 SET [ID Zwierzaka] = ( SELECT TOP 1 [ID Zwierzaka] FROM inserted )
 WHERE [ID boksu] = (Select TOP 1 [ID boksu] FROM boksy
					WHERE [ID Zwierzaka] is null  and [ID gatunku] = (SELECT TOP 1 [ID gatunku] FROM inserted ) )
