GO
IF OBJECT_ID(N'dataPrzyjecia',N'TR') IS NOT NULL  
    DROP TRIGGER  dataPrzyjecia 

GO
CREATE TRIGGER dataPrzyjecia ON Zwierzeta 
AFTER INSERT 
AS 

	DECLARE @idColumn INT
	DECLARE @czasDodania DATE

SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted

WHILE @idColumn IS NOT NULL
BEGIN
	SELECT @czasDodania = [data znalezienia] FROM Zwierzeta
	WHERE [ID Zwierzaka] = @idColumn

	IF @czasDodania is NULL
		UPDATE Zwierzeta 
			SET [data znalezienia] = CONVERT(DATE,GETDATE())
		WHERE [ID Zwierzaka] = @idColumn
	
    SELECT @idColumn = MIN( [ID Zwierzaka] ) FROM inserted WHERE [ID Zwierzaka] > @idColumn
END



/*GO
IF OBJECT_ID(N'dataPrzyjecia',N'TR') IS NOT NULL  
    DROP TRIGGER  dataPrzyjecia 

--wyslij 
/*trigger ktory dodaje czas wypadku gdy osoba wprowadzajaca czas zapomni go dodac. Minus teo rozwiazanie jest to ze trigger nie dziala*/
GO
CREATE TRIGGER dataPrzyjecia ON Zwierzeta 
AFTER INSERT 
AS 
	DECLARE @idDodanego INT
	DECLARE @czasDodania DATE
	SELECT @idDodanego = MAX([ID Zwierzaka]) FROM Zwierzeta
	SELECT @czasDodania = [data znalezienia] FROM Zwierzeta
	WHERE [ID Zwierzaka] = @idDodanego
	DECLARE @i INT = @@ROWCOUNT
	WHILE @i >= 0
	BEGIN
		IF @czasDodania is NULL 
			UPDATE Zwierzeta 
			SET [data znalezienia] = CONVERT(DATE,GETDATE())
			WHERE [ID Zwierzaka] = (@idDodanego - @i)
		SET	@i = @i - 1
		END

--wyslij 
/*trigger ktory dodaje czzs w wypadku gdyby osoba ktora wpordza dane do systemu zapomniala podac czas znalezienia trigger automatycznie doda obecna chwile.
Minusem rozwiazania jest to ze dziala tylkow wypadku dodawania pojedynczych wierszy. Dlatego istnieje funkcja dodaj zwierzaka ktora dodaje zwierzeta 
i pozwala dodawac jedno zwierze na raz.Nie mam kurwa pojecia czy to ma sens*/
CREATE TRIGGER dataPrzyjecia ON Zwierzeta 
AFTER INSERT 
AS 
	DECLARE @idDodanego INT
	DECLARE @czasDodania DATE
	SELECT @idDodanego = MAX([ID Zwierzaka]) FROM Zwierzeta
	SELECT @czasDodania = [data znalezienia] FROM Zwierzeta
	WHERE [ID Zwierzaka] = @idDodanego
		IF @czasDodania is NULL 
			UPDATE Zwierzeta 
			SET [data znalezienia] = CONVERT(DATE,GETDATE())
			WHERE [ID Zwierzaka] = @idDodanego 
		


--wyslij 
CREATE PROCEDURE dodajZwierzaka 
(	
	@imie NVARCHAR(50),
	@gatunek INT,
	@rasa INT,
	@miejsceZnalezienia NVARCHAR(1000),
	@dataZnalezienia DATE,
	@wiek INT,
	@waga INT,
	@plec NVARCHAR(6),
	@sterylizacja char(1),
	@opis NVARCHAR(1000),
	@zdjecie IMAGE = NULL
	)
	AS 
	BEGIN 
		INSERT INTO Zwierzeta
		VALUES 
		(
		@imie,
		@gatunek,
		@rasa,
		@miejsceZnalezienia,
		@dataZnalezienia,
		@wiek,
		@waga,
		@plec,
		@sterylizacja,
		@opis,
		@zdjecie
		)
	END */
