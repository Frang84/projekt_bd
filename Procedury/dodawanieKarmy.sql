
/*procedura do dodawania akrmy kozna dodac check do ilosci karmy aby ilosc nigdy nie zeszla ponizej zera*/
CREATE PROCEDURE dodawanieKarmy 
@idKarmy AS INT, @ilosc AS INT
AS	
UPDATE karmy SET ilosc = ilosc + @ilosc 
WHERE [ID karmy] = @idKarmy




