IF OBJECT_ID('[odejmowanie karmy]','P') IS NOT NULL
DROP PROC [odejmowanie karmy]

GO
CREATE PROCEDURE [odejmowanie karmy]( @ID INT, @waga INT)
AS
UPDATE karmy
SET ilosc = ( ilosc - @WAGA)
WHERE [ID karmy] = @ID

GO
