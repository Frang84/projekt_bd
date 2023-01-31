

DECLARE @I INT = 1

WHILE @I <=10
BEGIN 
	EXEC dbo.[status do adopcji] @I
	SET @I = @I +1
END

WHILE @I <=15
BEGIN 
	EXEC dbo.domTyczasowy @I
	EXEC dbo.[status do adopcji] @I
	SET @I = @I +1
END

WHILE @I <=20
BEGIN 
	EXEC dbo.[status do leczenia] @I
	SET @I = @I +1
END

WHILE @I <=32
BEGIN 
	EXEC dbo.[status do adopcji] @I
	SET @I = @I +1
END

WHILE @I <=44
BEGIN 
	EXEC dbo.domTyczasowy @I
	EXEC dbo.[status do adopcji] @I
	SET @I = @I +1
END

WHILE @I <=50
BEGIN 
	EXEC dbo.[status do leczenia] @I
	SET @I = @I +1
END


EXEC [Rozpoczecie adopcji] @IDzwierzaka = 2 , @IDadoptujacego = 1
EXEC [Rozpoczecie adopcji] @IDzwierzaka = 4 , @IDadoptujacego = 2
EXEC [Rozpoczecie adopcji] @IDzwierzaka = 5 , @IDadoptujacego = 3
EXEC [Rozpoczecie adopcji] @IDzwierzaka = 8 , @IDadoptujacego = 4
EXEC [Rozpoczecie adopcji] @IDzwierzaka = 10 , @IDadoptujacego = 5
EXEC [Rozpoczecie adopcji] @IDzwierzaka = 21 , @IDadoptujacego = 6
EXEC [Rozpoczecie adopcji] @IDzwierzaka = 24, @IDadoptujacego = 7
EXEC [Rozpoczecie adopcji] @IDzwierzaka = 29 , @IDadoptujacego = 8
EXEC [Rozpoczecie adopcji] @IDzwierzaka = 33 , @IDadoptujacego = 9
EXEC [Rozpoczecie adopcji] @IDzwierzaka = 40 , @IDadoptujacego = 10





EXEC [Anulowanie adopcji] @IDzwierzaka = 4 
EXEC [Anulowanie adopcji] @IDzwierzaka = 33


EXEC [finalizacja adopcji] @IDzwierzaka = 1
EXEC [finalizacja adopcji] @IDzwierzaka = 10
EXEC [finalizacja adopcji] @IDzwierzaka = 29



INSERT INTO [specjalne potrzeby] ([ID Zwierzaka] , opis )
VALUES (1,'lubi od czasu do czasu jesc lody smietankowe'),
(2,'lubi od czasu do czasu jesc lody smietankowe'),
(3,'przyjmuje leki na stawy'),
(4,'lubi od czasu do czasu jesc lody smietankowe'),
(5,'potrzebuje duzych porcji glaskania i kochania'),
(6,'przyjmuje leki na trzustke'),
(7,'potrzebuje duzych porcji glaskania i kochania'),
(8,'lubi od czasu do czasu jesc lody smietankowe'),
(9,'przyjmuje leki na trzustke'),
(10,'potrzebuje duzych porcji glaskania i kochania'),
(11,'lubi od czasu do czasu jesc lody smietankowe'),
(12,'przyjmuje leki na stawy'),
(13,'lubi od czasu do czasu jesc lody smietankowe'),
(14,'przyjmuje leki na stawy'),
(15,'lubi od czasu do czasu jesc lody smietankowe'),
(16,'przyjmuje leki na stawy'),
(17,'przyjmuje leki na stawy'),
(18,'przyjmuje leki na trzustke'),
(19,'lubi od czasu do czasu jesc lody smietankowe'),
(20,'potrzebuje duzych porcji glaskania i kochania'),
(21,'przyjmuje leki na trzustke'),
(22,'przyjmuje leki na trzustke'),
(23,'przyjmuje leki na stawy'),
(24,'potrzebuje duzych porcji glaskania i kochania'),
(25,'przyjmuje leki na trzustke'),
(26,'przyjmuje leki na stawy'),
(27,'potrzebuje duzych porcji glaskania i kochania'),
(28,'potrzebuje duzych porcji glaskania i kochania'),
(29,'potrzebuje duzych porcji glaskania i kochania'),
(30,'przyjmuje leki na stawy'),
(31,'przyjmuje leki na trzustke'),
(32,'lubi od czasu do czasu jesc lody smietankowe'),
(33,'przyjmuje leki na trzustke'),
(34,'potrzebuje duzych porcji glaskania i kochania'),
(35,'przyjmuje leki na trzustke'),
(36,'lubi od czasu do czasu jesc lody smietankowe'),
(37,'przyjmuje leki na trzustke'),
(38,'przyjmuje leki na trzustke'),
(39,'przyjmuje leki na trzustke'),
(40,'przyjmuje leki na trzustke'),
(41,'przyjmuje leki na trzustke'),
(42,'lubi od czasu do czasu jesc lody smietankowe'),
(43,'przyjmuje leki na stawy'),
(44,'potrzebuje duzych porcji glaskania i kochania'),
(45,'przyjmuje leki na stawy'),
(46,'lubi od czasu do czasu jesc lody smietankowe'),
(47,'potrzebuje duzych porcji glaskania i kochania'),
(48,'przyjmuje leki na stawy'),
(49,'lubi od czasu do czasu jesc lody smietankowe'),
(50,'przyjmuje leki na trzustke')


EXEC dodawanieGodzinWolontariatu @idWolontariusza = 2 , @iloscGodzin = 18
EXEC dodawanieGodzinWolontariatu @idWolontariusza = 4 , @iloscGodzin = 8
EXEC dodawanieGodzinWolontariatu @idWolontariusza = 5 , @iloscGodzin = 20
EXEC dodawanieGodzinWolontariatu @idWolontariusza = 12 , @iloscGodzin = 6
EXEC dodawanieGodzinWolontariatu @idWolontariusza = 13 , @iloscGodzin = 30
