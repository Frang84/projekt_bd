# BAZA DANYCH SCHRONISKA DLA ZWIERZĄT
Co roku zwierzęta oddawane są od schronisk. Dzieje się to na skutek śmierci właściciel, braku odpowiedzialności czy też zmiany sytuacji materialnej. Obecnie to ostatni z wyżej wymienionych powodów jest najczęstszą przyczyna decyzji o oddaniu psa lub kota. Schroniska z tego powodu są coraz bardziej obciążone. Nasza baza danych powstała w celu ułatwienia w zarządzaniu ta jakże szczytną instytucją. 
## założenia projektu
Projekt ma na celu stworzenie bazy danych, która będzie przechowywać informacje o zwierzętach jak i opiekunach. baza danych z założenia ma ułatwiać prowadzenie schroniska oraz automatyzować część czynności, które normalnie musieliby robić pracownicy.  
## główne założenia 
Głównym założeniem projektu było stworzenie bazy danych, na której może operować strona internetowa schroniska. Osoby chcące zaadoptować swojego wymarzonego pupila powinny móc bez problemu dobrać wielkość, wiek, oraz inne potrzeby przyszłego nowego członka rodziny do swoich upodobań oraz możliwości bytowych. Od strony pracowników baza ta pozwala na podstawowe zarządzanie instytucją. Dzieki naszemu projektowi wiadome są przybliżone koszty jakie schronisko będzie musiało ponieć podczas swojego działania. 
## możliwości 
Zaprojektowana przez nas baza danych ma wiele zaimplementowanych funkcjonalności. Pozwala na wyszukiwanie zwierząt o odpowiednich parametrach takich jak wielkość, wiek czy też rasa. Możemy także zobaczyć jakie zwierzęta znajdują się obeznie w domu tymczasowym lub zobaczyć szczegółowe zapotrzebowania poodopiecznego. 
## Strategie pielęgnowania bazy danych
1.Utworzenie kopii zapasowych - w wypaku bazy danych schroniska jest to tanie rozwiązanie ze względu na ilośc rekordów, która jest przetrzymywana z tabelach.

2.Zagrożenia wewnętrzne - w tym wypadku należy chronić baze danych przed uzytkownikami, którzy pracuja w schronisku i z jakiegoś powodu celowo chcą zaszkodzić organizacji. W celu zapobiegania takich ataków należy uważac, aby za dużo osób nie miało dostępu do bazy danych jako uprzywilejowany użytkownik. 

3.Zagrożenia zewnętrzne z wykorzystaniem kodu SQL - aby chronić bazę danych przed tym zagrożeniem należy na bierząco dbać o  sprawdzanie luk w oprogramowaniu.
## Diagram ER
![DIAGRAM ER](https://github.com/Frang84/projekt_bd/blob/583973b373becbd73deb333a53b7afcfceb7e023/obrazy/obraz_2023-01-31_202725425.png)
## Dodatkowe więzy integralności bazy danych 
 - Zwierzeta: 
     - wiek > 0,
     - waga > 0,
     - sterylizacja = 'T' OR sterylizacja = 'N',
     - plec = 'SAMIEC' OR plec = 'SAMICA' .
 -Adoptujacy: 
     - wiek >= 18 ,
 - Pracownik: 
     - pensja > 0 .
 - Wolontariusze:
     - Ilosc godzin >= 0 .
 - Urlopy: 
     - od < do .
 - Karmy: 
     - cena > 0 ,
     - ilosc > 0 .

## Schematy dziedziczenia 
W tabeli Zwierzęta zastosowaliśmy rodzaj dziedziczenia TBH(Table per Hierarchy), w tym przypadku koty jak i psy mają te same atrybuty. Nie musimy więc tworzyć oddzielnych klas dziedziczących \ 
\
W przypadku tabeli Zatrudnieni mamy do czynienia z dziedziczeniem TPC(Table Per Concrete Class). Wolontariusz jak i pracownik mają imie, nazwisko oraz pesel. Pracownik pobiera jednak za swoją pracę wynagrodzenie. 




  
