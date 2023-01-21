/*INSERT INTO gatunki (nazwa)
VALUES('Kot')*/

/*SELECT * FROM gatunki */

/*INSERT INTO rasa ([ID gatunku],[nazwa rasy])
VALUES(2,'Dachowiec')*/

/*SELECT * FROM rasa*/


/*INSERT INTO Zwierzeta
VALUES('Biala',2,1,'Lotos', '2015-10-10',5,2,'W','T','chudy kto stal sie gruby',null)*/

/*select * from Zwierzeta*/



INSERT INTO gatunki (nazwa)
VALUES ('pies'),
('swinka morska')

/* musi byc przed tabea zwierzeta*/
DECLARE @Counter INT 
SET @Counter=1
WHILE ( @Counter <= 50 )
BEGIN
      INSERT INTO boksy ([ID gatunku])
	  VALUES (1)
    SET @Counter  = @Counter  + 1
END
SET @Counter=1
WHILE ( @Counter <= 50 )
BEGIN
      INSERT INTO boksy ([ID gatunku])
	  VALUES (2)
    SET @Counter  = @Counter  + 1
END


INSERT INTO Statusy([nazwa statusu])
VALUES ('do adopcji'),
		('dom tymczasowy'),
		('w trakcie adopcji'),
		('pilne'),
		('wkrotce do adopcji'),
		('w trakcie leczenia'),
		('do adopcji z domu tymczasowego')


INSERT INTO karmy(nazwa,ilosc,Cena,dostawca)
VALUES  ('Favorite', 100, 4.19,'Karmex'),
		('CEBICAN DAILY CARE DLA PSÓW DOROSŁYCH', 400,6.44,'Karmex'),
		('SUCHA KARMA JOSERA JOSIDOG ADULT ECONOMY 15', 1500,7.70,'Karmex'),
		('KARMA MORANDO PRO PUPPY DLA SZCZENIĄT KURCZAK',324, 8.21, 'POL-KARM'),
		('Wolf of Wilderness „The Taste Of"',1250,25.75,'POL-KARM'),
		('Purizon Adult',305,22.38,'POL-KARM'),
		('Purizon Adult dla kota, ryba',2000,44.50,'Karmex'),
		('Purizon Kitten, kurczak i ryba',345,65.33,'Karmex'),
		('Korzystny pakiet Feringa Classic Meat Menu',543,26.17,'POL-KARM'),
		('Feringa karma mokra dla kociąt',120,29.0,'POL-KARM')


	

INSERT INTO rasa([ID gatunku],[nazwa rasy])
VALUES (1,'Dachowiec'),
		(1,'Brytyjski'),
		(1,'Maine Coon'),
		(1,'Perski'),
		(1,'Norweski lesny'),
		(1,'Ragdol'),
		(2,'Mieszaniec'),
		(2,'Owczarek Niemiecki'),
		(2,'Amstaff'),
		(2,'Syberian Husky'),
		(2,'Sznaucer miniaturowy'),
		(2,'Owczarek Belgijski'),
		(2,'Maltanczyk'),
		(2,'Golden Retriever'),
		(2,'Labrador'),
		(2,'Pinczer'),
		(2,'Bokser'),
		(2,'Jamnik')

INSERT INTO zatrudniony
VALUES (NULL, 132201834 ,43 ,' NADIA ',' MICHALSKI ', 106325829852 ),
(NULL, 369611698 ,69 ,' PAWEŁ ',' ADAMIUK ', 737414920649 ),     
(NULL, 183621047 ,28 ,' PIOTR ',' WOJCIECHOWSKI ', 49145971976 ),
(NULL, 642261573 ,18 ,' KRZYSZTOF ',' OLSZEWSKI ', 42897793880 ),
(NULL, 859054228 ,18 ,' TOMASZ ',' SKORNIAK ', 599069761003 ),   
(NULL, 182898356 ,64 ,' ZOFIA ',' OPALA ', 740385435545 ),
(NULL, 406221794 ,61 ,' MARIA ',' GRABOWSKI ', 932907896259 ),
(NULL, 694423950 ,34 ,' WIKTORIA ',' LEWANDOWSKI ', 839918908809 ),
(NULL, 675557463 ,45 ,' MICHAŁ ',' LISOWSKI ', 125664907242 ),
(NULL, 744730983 ,41 ,' HANNA ',' JANKOWSKI ', 70387879924 ),
(NULL, 614392868 ,59 ,' JAN ',' ADAMIEC ', 461852974240 ),
(NULL, 766700276 ,67 ,' ADRIANNA ',' KWIATKOWSKI ', 819744675271 ),
(NULL, 512627358 ,58 ,' ANDRZEJ ',' ADAMKIEWICZ ', 927723168654 )

SET IDENTITY_INSERT dbo.wolontariusze ON
GO
SET IDENTITY_INSERT dbo.pracownicy ON
GO


INSERT INTO wolontariusze([ID zatrudnionego],[Ilosc godzin])
VALUES
(2,0),
(4,0),
(5,0),
(12,0),
(13,0)



INSERT INTO pracownicy([ID zatrudnionego],[data przyjecia],pensja)
VALUES
(1,'2015-10-17',3500),
(3,'2015-1-7',3200),
(6,'2000-10-1',3500),
(7,'2010-10-17',8500),
(8,'2005-10-17',6500),
(9,'2017-10-17',7500),
(10,'2019-10-17',6500),
(11,'2019-10-17',4500)



INSERT INTO adoptujacy
VALUES(NULL, 593631218 ,68 ,' MARIA ',' OLSZEWSKI ' ),
(NULL, 443277178 ,35 ,' TOMASZ ',' ADAMKIEWICZ ' ),
(NULL, 864003710 ,38 ,' KRZYSZTOF ',' SKORNIAK ' ),
(NULL, 750347349 ,47 ,' WIKTORIA ',' LISOWSKI ' ),
(NULL, 119761572 ,57 ,' ZOFIA ',' LEWANDOWSKI ' ),
(NULL, 910882307 ,55 ,' ADRIANNA ',' WOJCIECHOWSKI ' ),
(NULL, 913868103 ,36 ,' NADIA ',' KWIATKOWSKI ' ),
(NULL, 946390123 ,53 ,' PAWEŁ ',' OPALA ' ),
(NULL, 237920370 ,52 ,' MICHAŁ ',' ADAMIK ' ),
(NULL, 402633090 ,52 ,' IZA ',' ADAMIEC ' )


INSERT INTO URLOPY ([ID zatrudnionego] , od, do)
VALUES (2, '2021-07-03' , '2021-07-17' ),
(3, '2021-07-03' , '2021-07-17' ),
(7, '2021-08-03' , '2021-08-17' ),
(5, '2021-08-17' , '2021-08-30' ),
(1, '2022-06-03' , '2022-06-17' ),
(11, '2022-07-03' , '2022-07-17' ),
(10, '2022-07-16' , '2022-07-30' ),
(2, '2022-08-03' , '2022-08-17' ),
(9, '2022-08-17' , '2022-08-30' )




		





