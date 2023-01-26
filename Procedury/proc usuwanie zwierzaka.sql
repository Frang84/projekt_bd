IF OBJECT_ID('[Usuwanie Zwierzaka]','P') IS NOT NULL
DROP PROC [Usuwanie Zwierzaka]

GO

CREATE PROC [Usuwanie Zwierzaka] (@ID INT)
AS
UPDATE boksy
SET [ID Zwierzaka] = null
WHERE [ID Zwierzaka] = @ID

DELETE FROM karmienie
WHERE [ID Zwierzaka] = @ID

DELETE FROM opiekuni
WHERE [ID Zwierzaka] = @ID

GO
