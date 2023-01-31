IF OBJECT_ID('dodawanieGodzinWolontariatu','P') IS NOT NULL
DROP PROC dodawanieGodzinWolontariatu

IF OBJECT_ID('dodawanieKarmy','P') IS NOT NULL
DROP PROC dodawanieKarmy

IF OBJECT_ID('domTyczasowy','P') IS NOT NULL
DROP PROC domTyczasowy


IF OBJECT_ID('[odejmowanie karmy]','P') IS NOT NULL
DROP PROC [odejmowanie karmy]

IF OBJECT_ID('[Usuwanie Zwierzaka]','P') IS NOT NULL
DROP PROC [Usuwanie Zwierzaka]

IF OBJECT_ID('[Rozpoczecie adopcji]','P') IS NOT NULL
DROP PROC [Rozpoczecie adopcji]

IF OBJECT_ID('[Anulowanie adopcji]','P') IS NOT NULL
DROP PROC [Anulowanie adopcji]


IF OBJECT_ID('[finalizacja adopcji]','P') IS NOT NULL
DROP PROC [finalizacja adopcji]


GO

CREATE PROCEDURE dodawanieGodzinWolontariatu 
@idWolontariusza AS INT, @iloscGodzin AS INT
AS 
UPDATE wolontariusze SET [Ilosc godzin] = [Ilosc godzin] + @iloscGodzin
WHERE [ID zatrudnionego] = @idWolontariusza

GO


CREATE PROCEDURE dodawanieKarmy 
@idKarmy AS INT, @ilosc AS INT
AS	
UPDATE karmy SET ilosc = ilosc + @ilosc 
WHERE [ID karmy] = @idKarmy

GO



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


GO
CREATE PROCEDURE [odejmowanie karmy]( @ID INT, @waga INT)
AS
UPDATE karmy
SET ilosc = ( ilosc - @WAGA)
WHERE [ID karmy] = @ID

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


CREATE PROC [Rozpoczecie adopcji] (@IDzwierzaka INT, @IDadoptujacego INT)
AS
DELETE FROM [Statusy Zwierzat] 
WHERE [ID Zwierzaka] = @IDzwierzaka AND [ID statusu] != 2

INSERT INTO [Statusy Zwierzat] ([ID Zwierzaka] , [ID statusu] )
VALUES (@IDzwierzaka , 3)

INSERT INTO adopcje ([ID adoptujacego] , [ID Zwierzaka] )
VALUES (@IDadoptujacego , @IDzwierzaka )



GO



CREATE PROC [Anulowanie adopcji]  (@IDzwierzaka INT)
AS
DELETE FROM [Statusy Zwierzat] WHERE [ID Zwierzaka] = @IDzwierzaka AND [ID statusu] = 3

INSERT INTO [Statusy Zwierzat] ([ID statusu] , [ID Zwierzaka] )
VALUES ( 5 , @IDzwierzaka )

DELETE FROM adopcje WHERE @IDzwierzaka = [ID Zwierzaka] 

GO


CREATE PROC [finalizacja adopcji] (@IDzwierzaka INT)
AS
DELETE FROM [Statusy Zwierzat] WHERE [ID Zwierzaka] = @IDzwierzaka

UPDATE boksy 
SET [ID Zwierzaka] = null
WHERE [ID Zwierzaka] = @IDzwierzaka

DELETE FROM karmienie WHERE [ID Zwierzaka] = @IDzwierzaka

DELETE FROM opiekuni WHERE [ID Zwierzaka] = @IDzwierzaka

DELETE FROM [specjalne potrzeby] WHERE [ID Zwierzaka] = @IDzwierzaka

GO
