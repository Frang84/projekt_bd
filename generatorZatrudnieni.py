import random

names = ['PIOTR','KRZYSZTOF','ANDRZEJ','TOMASZ','PAWEŁ','JAN','MICHAŁ','MARIA','NADIA','IZA','WERONIKA','HANNA','WIKTORIA','ZOFIA','MARIANNA','ADRIANNA']
lNames = ['LISOWSKI','ADAMIEC','ADAMIK','ADAMIUK','ADAMKIEWICZ','SKORNIAK','OPALA'] 

def generating(amount):
    for i in range(amount): 
        print('(NULL,',str(random.randint(100000,999999)),','+str(random.randint(18,70)),",'",names[random.randint(0,14)],"','",lNames[random.randint(0,6)],"',",str(random.randint(10000000000,999999999999)),')')




def main():
    generating(10)


if __name__ == "__main__":
    main()
