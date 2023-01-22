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



INSERT INTO Zwierzeta 
VALUES
('Edi',2,5,'SKLEP PAPIERNICZY NIKO','2023-6-24',5,37,'SAMIEC','N','Kochany kot szuka rak do glaskania i miziania',NULL),
('Armagedon',2,2,'UL. MILA','2023-1-3',6,42,'SAMICA','T','Kochany kot szuka rak do glaskania i miziania',NULL),
('Biszop',2,5,'UL. DOBRA','2023-12-15',6,20,'SAMICA','T','Kochany kot szuka rak do glaskania i miziania',NULL),
('Dante',2,4,'UL. KROLOWEJ JADWIGI','2023-8-20',4,43,'SAMICA','T','Kochany kot szuka rak do glaskania i miziania',NULL),
('Bart',2,3,'SKLEP PAPIERNICZY NIKO','2023-2-3',4,5,'SAMIEC','N','Kochany kot szuka rak do glaskania i miziania',NULL),
('Albercik',2,3,'STARY RYNEK','2023-4-12',11,27,'SAMIEC','N','Kochany kot szuka rak do glaskania i miziania',NULL),
('Behemot',2,5,'UL. DOBRA','2023-8-23',7,21,'SAMICA','N','Kochany kot szuka rak do glaskania i miziania',NULL),
('Donut',2,6,'OKOLICE SZKOLA PODSTAWOWA NUMER 3','2023-4-17',9,27,'SAMICA','N','Kochany kot szuka rak do glaskania i miziania',NULL),
('Edward',2,1,'UL. KROLOWEJ JADWIGI','2023-5-23',9,11,'SAMIEC','N','Kochany kot szuka rak do glaskania i miziania',NULL),
('Dylan',2,2,'OKOLICE SZKOLA PODSTAWOWA NUMER 3','2023-12-13',5,9,'SAMICA','T','Kochany kot szuka rak do glaskania i miziania',NULL),
('Admin',2,2,'OKOLICE HURTOWNI AGD','2023-2-21',7,9,'SAMICA','N','Kochany kot szuka rak do glaskania i miziania',NULL),
('Albus',2,2,'UL. MILA','2023-9-19',2,10,'SAMICA','T','Kochany kot szuka rak do glaskania i miziania',NULL),
('Ajax',2,2,'UL. MILA','2023-12-1',4,30,'SAMIEC','T','Kochany kot szuka rak do glaskania i miziania',NULL),
('Benetton',2,6,'SKLEP PAPIERNICZY NIKO','2023-3-23',5,32,'SAMICA','N','Kochany kot szuka rak do glaskania i miziania',NULL),
('Bond',2,4,'PLAC ZABAW OBOK SZKOLY','2023-9-28',5,45,'SAMICA','T','Kochany kot szuka rak do glaskania i miziania',NULL),
('Budda',2,5,'UL. DOBRA','2023-5-9',9,26,'SAMICA','T','Kochany kot szuka rak do glaskania i miziania',NULL),
('Aro',2,5,'UL. SZEROKA','2023-8-15',4,39,'SAMICA','T','Kochany kot szuka rak do glaskania i miziania',NULL),
('Desmond',2,5,'UL. DOBRA','2023-12-11',8,32,'SAMIEC','T','Kochany kot szuka rak do glaskania i miziania',NULL),
('Bigos',2,5,'LAS BORKOWSKI','2023-8-17',9,26,'SAMICA','N','Kochany kot szuka rak do glaskania i miziania',NULL),
('Baldwin',2,5,'STARY RYNEK','2023-10-14',3,20,'SAMIEC','T','Kochany kot szuka rak do glaskania i miziania',NULL),
('Fafik',1,17,'OKOLICE HURTOWNI AGD','2023-3-11',1,27,'SAMIEC','T','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Dolar',1,7,'STARY RYNEK','2023-9-4',5,13,'SAMIEC','T','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Happy',1,18,'UL.MARII KONOPNICKIEJ','2023-7-23',6,27,'SAMICA','T','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Corso',1,7,'STARY RYNEK','2023-5-2',11,27,'SAMIEC','N','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Flapi',1,7,'UL. SZEROKA','2023-4-24',12,31,'SAMIEC','T','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Imbir',1,18,'SKLEP PAPIERNICZY NIKO','2023-10-9',8,5,'SAMICA','T','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Jawor',1,16,'PLAC ZABAW OBOK SZKOLY','2023-5-16',3,16,'SAMICA','T','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Biszkopt',1,12,'UL. KROLOWEJ JADWIGI','2023-11-6',11,16,'SAMICA','T','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Bobik',1,10,'UL. SZEROKA','2023-6-14',4,9,'SAMIEC','N','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Brutus',1,15,'UL. RAJSKA','2023-4-7',12,29,'SAMICA','T','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Albin',1,17,'LAS BORKOWSKI','2023-10-8',5,35,'SAMICA','T','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Charlie',1,9,'UL. RAJSKA','2023-11-27',5,34,'SAMICA','N','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Diego',1,12,'UL. FAJNA','2023-1-14',12,18,'SAMICA','T','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Jumbo',1,12,'UL. RAJSKA','2023-11-22',6,28,'SAMICA','T','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Iwo',1,18,'LAS BORKOWSKI','2023-11-13',2,31,'SAMIEC','T','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Elvis',1,8,'UL. MILA','2023-6-13',6,9,'SAMIEC','N','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Grafit',1,18,'LAS BORKOWSKI','2023-3-15',1,39,'SAMICA','N','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Fafi',1,11,'NOWY RYNEK','2023-4-5',11,24,'SAMICA','N','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Junior',1,7,'UL. SZEROKA','2023-8-1',6,24,'SAMICA','N','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Chester',1,15,'LAS BORKOWSKI','2023-2-4',4,19,'SAMICA','T','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Gospel',1,14,'UL. DOBRA','2023-10-10',4,45,'SAMIEC','T','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Daktyl',1,10,'PLAC ZABAW OBOK SZKOLY','2023-5-10',11,35,'SAMICA','T','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Gaston',1,15,'NOWY RYNEK','2023-4-27',1,19,'SAMIEC','N','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Hamlet',1,12,'UL. FAJNA','2023-10-11',5,10,'SAMICA','N','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Irokez',1,16,'UL. RAJSKA','2023-5-26',5,11,'SAMICA','T','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Drops',1,13,'SKLEP PAPIERNICZY NIKO','2023-7-1',8,22,'SAMIEC','N','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Eddy',1,18,'UL. RAJSKA','2023-4-27',5,33,'SAMIEC','N','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Borys',1,16,'NOWY RYNEK','2023-4-18',3,26,'SAMIEC','T','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Afro',1,8,'UL. KROLOWEJ JADWIGI','2023-8-27',9,10,'SAMIEC','N','Kochany pies ktory zostal sierota czeka na dom',NULL),
('Egon',1,11,'OKOLICE SZKOLA PODSTAWOWA NUMER 3','2023-11-3',3,13,'SAMICA','T','Kochany pies ktory zostal sierota czeka na dom',NULL)



INSERT INTO [Statusy Zwierzat] ([ID Zwierzaka], [ID statusu])
VALUES
(1,1),
(1,7),
(2,6),
(3,1),
(3,4),
(4,1),
(4,4),
(5,1),
(5,4),
(6,6),
(7,5),
(8,6),
(9,6),
(10,5),
(11,1),
(11,4),
(12,1),
(12,2),
(13,1),
(13,4),
(14,1),
(14,2),
(15,5),
(16,1),
(16,2),
(17,1),
(17,4),
(18,6),
(19,1),
(19,2),
(20,1),
(20,4),
(21,6),
(22,6),
(23,1),
(23,4),
(24,6),
(25,6),
(26,5),
(27,1),
(27,2),
(28,1),
(28,7),
(29,6),
(30,1),
(30,4),
(31,5),
(32,6),
(33,6),
(34,6),
(35,6),
(36,5),
(37,1),
(37,4),
(38,1),
(38,4),
(39,1),
(39,7),
(40,5),
(41,1),
(41,2),
(42,5),
(43,5),
(44,1),
(44,4),
(45,1),
(45,7),
(46,1),
(46,2),
(47,5),
(48,1),
(48,4),
(49,6)
		





