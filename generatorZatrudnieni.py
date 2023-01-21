import random

names = ['PIOTR','KRZYSZTOF','ANDRZEJ','TOMASZ','PAWEŁ','JAN','MICHAŁ','MARIA','NADIA','IZA','WERONIKA','HANNA','WIKTORIA','ZOFIA','MARIANNA','ADRIANNA','JULIA','ZUZANNA']#18
lNames = ['LISOWSKI','ADAMIEC','ADAMIK','ADAMIUK','ADAMKIEWICZ','SKORNIAK','OPALA','LEWANDOWSKI','JANKOWSKI','KWIATKOWSKI','WOJCIECHOWSKI','GRABOWSKI','MICHALSKI','OLSZEWSKI','PIOTROWSKA','MAZUR','WIECZOREK','WITKOWSKA'] #18
NameDog = ['Afro', 'Albin', 'Amor', 'Azor', 'Biszkopt', 'Bobik', 'Borys', 'Brutus', 'Cezar', 'Charlie', 'Chester', 'Corso', 'Daktyl', 'Diego', 'Dolar', 'Drops', 'Edek', 'Eddy', 'Egon', 'Elvis', 'Fafi', 'Fafik', 'Figiel', 'Flapi', 'Gaston', 'Gospel', 'Grafit', 'Gucio', 'Hamlet', 'Happy', 'Harry', 'Hektor', 'Imbir', 'Irokez', 'Irys', 'Iwo', 'Jawor', 'Jerry', 'Jumbo', 'Junior', 'Kajtek', 'Karmel', 'Karmin']
NameCat = ['Ajax', 'Albercik', 'Armagedon', 'Aro', 'Albus', 'Admin','Bart', 'Bigos', 'Baldwin', 'Behemot','Benetton', 'Budda', 'Bond', 'Biszop','Dante', 'Donut', 'Desmond', 'Dylan','Edi', 'Edward']
Places = ['LAS BORKOWSKI','UL. KROLOWEJ JADWIGI','UL.MARII KONOPNICKIEJ','UL. RAJSKA','UL. DOBRA','UL. MILA','UL. FAJNA','PLAC ZABAW OBOK SZKOLY','UL. SZEROKA','STARY RYNEK','NOWY RYNEK','OKOLICE HURTOWNI AGD','SKLEP PAPIERNICZY NIKO','OKOLICE SZKOLA PODSTAWOWA NUMER 3','UL. WARSZAWSKA','UL. MARII KONOPNICKIEJ']
sex = ['SAMIEC','SAMICA']
sterylizacja = ['T','N']

def generating(amount):
    for i in range(amount): 
        print('(NULL,',str(random.randint(100000000,999999999)),','+str(random.randint(18,70)),",'",names[random.randint(0,14)],"','",lNames[random.randint(0,6)],"',",str(random.randint(10000000000,999999999999)),')')

def generatingBetter(amount,random1,random2):
    for i in range(amount):
        print('(NULL,',str(random.randint(100000000,999999999)),','+str(random.randint(18,70)),",'",names[random1[i]],"','",lNames[random2[i]],"',",str(random.randint(10000000000,999999999999)),')')


def uniqueRandom(low, high, num):
    numbers = []
    if(high-low < num):
        print('wyjebalo sie, za duzy przedzial za malo liczb')
    else:
        y =  0
        stop = True
        i = 0
        while i < num : 
            x = random.randint(low, high-1)
            for j in range(y):
                if x == numbers[j] :
                    stop = False
                    break
            if stop:
                numbers.insert(y, x)
                y+=1
                i+=1
            stop = True
    return numbers
            

def generatingAdoptujacy(amount,random1,random2):
    for i in range(amount):
        print('(NULL,',str(random.randint(100000000,999999999)),','+str(random.randint(18,70)),",'",names[random1[i]],"','",lNames[random2[i]],"'",'),')


def convertTuple(tup):
    st = ''.join(map(str, tup))
    return st

def generatingPsy(amount,random1):
    f = open('dogs.txt','a')
    for i in range(amount):
        tup =  "('",str(NameDog[random1[i]]),"',1,",str(random.randint(7, 18)),",'",Places[random.randint(0, 13)],"','2023-",str(random.randint(1, 12)),'-',str(random.randint(1, 28)),"',",str(random.randint(1, 12)),",",str(random.randint(5, 45)),",'",sex[random.randint(0,1)],"','",sterylizacja[random.randint(0, 1)],"','Kochany pies ktory zostal sierota czeka na dom',NULL),\n" 
        dogs = convertTuple(tup)
        f.write(dogs)
    f.close()
        

def generatingCats(amount,random1):
    f = open('cats.txt','a')
    for i in range(amount):
        tup =  "('",NameCat[random1[i]],"',2,",str(random.randint(1, 6)),",'",Places[random.randint(0, 13)],"','2023-",str(random.randint(1, 12)),'-',str(random.randint(1, 28)),"',",str(random.randint(1, 12)),",",str(random.randint(5, 45)),",'",sex[random.randint(0,1)],"','",sterylizacja[random.randint(0, 1)],"','Kochany kot szuka rak do glaskania i miziania',NULL),\n" 
        cats = convertTuple(tup)
        f.write(cats)
    f.close()
        




def main():
    #uniquerandomnumbers = uniqueRandom(0, 7, 5)
    #randomNames = uniqueRandom(0, 16, 14)
    #randomLnames = uniqueRandom(0, 14, 14)
    #generatingAdoptujacy(10,randomNames,randomLnames)   
    print(len(NameCat))
    random1 = uniqueRandom(0, 20, 20)
    generatingCats(20, random1)
    #random1 = uniqueRandom(0, 40, 30)
    #generatingPsy(30, random1)




if __name__ == "__main__":
    main()
