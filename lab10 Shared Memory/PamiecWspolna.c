#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <errno.h>   // errno
#include <stdlib.h>  // exit(-1);
#include <sys/stat.h> // stat
#include <sys/mman.h>
#include <fcntl.h>  /* For O_* constants */
#include <string.h>

#define MODES 0666
#define OBIEKT_SHM "/obiekt_shm"

// KOMPLILACJA gcc -lrt -Wall Odnowa.c

int main() {
  int fd_shm;
  struct stat infoobraz; // infoobraz.st_size
  //int rozmiar_pliku = 64;
  unsigned * adres;
  FILE * plik;
  char  *nazwa_plik = "k.txt";
  
  if(fork()){                          // RODZIC
    // ewentualne usuniecie poprzedniego shm
    if(shm_unlink(OBIEKT_SHM) < 0){
      perror("R Wszystko OK");
    } else {
      printf("R Musialem wyczyscic...\n");
    }

    // utworz obiekt shared memory
    if((fd_shm = shm_open(OBIEKT_SHM, O_RDWR | O_CREAT, MODES)) == -1){
      perror("R shm_open");
    }

 // while(1){
    // zapytanie o nazwe
    //printf("Jak sie nazywa plik do przeslania?(k.txt l.txt) \n");
    //scanf("%s", nazwa_plik);
    
    //gets(nazwa_plik);
    //read(0, nazwa_plik, 20);
    //printf("\n%s\n", nazwa_plik);
    
    plik = fopen(nazwa_plik,"r");
    if(plik == NULL){
      perror("R fopen");
    }
    int fd_plik  = fileno(plik);
    
    // stat i rozmiar pliku
    if(stat(nazwa_plik, &infoobraz) == -1){
      perror("R stat");
    }
    rozmiar_pliku = infoobraz.st_size;
   
    // ustaw wielkosc obiektu shm
    if(ftruncate(fd_shm, rozmiar_pliku) == -1 ) {
      perror("R ftruncate");
    }

    // mmap
    adres = mmap(0, rozmiar_pliku,PROT_READ | PROT_WRITE, MAP_SHARED, fd_shm, 0);
    if (adres == MAP_FAILED) {
      perror("R mmap");
    }

    //memcpy(adres, plik, rozmiar_pliku);
    read(fd_plik, adres, rozmiar_pliku);
    printf("Rodzic zapisal: \n%s\n", adres);
    
    // zamykanie
    munmap(adres, rozmiar_pliku);
    fclose(plik);
    // } // while  
          ////////////////////// DZIECKO /////////////////// 
  } else {
    char * i;
    
    sleep(1);
    
    fd_shm = shm_open(OBIEKT_SHM, O_RDWR, MODES);
    if(fd_shm == -1){
      perror("D shm");
    }

    printf("\n Dziecko przeczytalo: \n");
    while(read(fd_shm, &i, sizeof(char)) != 0) {
      printf("%c", i);
    }
    
    shm_unlink(OBIEKT_SHM);
  }
} // main
