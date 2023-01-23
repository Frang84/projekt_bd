

CREATE PROCEDURE dodawanieGodzinWolontariatu 
@idWolontariusza AS INT, @iloscGodzin AS INT
AS 
UPDATE wolontariusze SET [Ilosc godzin] = [Ilosc godzin] + @iloscGodzin
WHERE [ID zatrudnionego] = @idWolontariusza



