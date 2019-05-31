#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <errno.h>   // errno
#include <stdlib.h>  // exit(-1);
#include <string.h>  // strlen

int main() {
  int fd[2], IDDziecka, licz;
  char bufor;
  char nazwa_obr[20];
  FILE *obrazek;
  
  pipe(fd);

  switch(IDDziecka = fork()) {
  case -1:
    fprintf(stderr, "Nie styklo, %d\n", errno); /*errno-no. ostatniego bledu*/
    exit(-1);

  case 0:          /* akcje dzieciucha */
    printf("Jestem Dzieckiem\n");
    close(fd[1]);
    close(0);
    dup(fd[0]); // dup zajmuje najnizszy dostepny file descriptor
    close(fd[0]); // zamkniecie nie uzywanego
    
    execlp("display","display",(char*) NULL);
    //read(fd[0], &bufor, 1);
    exit(0);
    
  default:         /* akcje rodzica */
    printf("Jestem Rodzicem\n");    
    close(fd[0]);
    printf("Jak sie nazywa obraz do przeslania? \n");
    scanf("%20s", nazwa_obr);
    printf("Plik o nazwie: %s", nazwa_obr);
    obrazek = fopen(nazwa_obr, "r");
    if(obrazek == NULL){
      printf("Cos nie styklo :(\n");
      exit(-1);
    }
    
    while(!feof(obrazek)){
	bufor = getc(obrazek);
	write(fd[1], &bufor, 1);
    }
    close(fd[1]);
    fclose(obrazek);
    exit(0);
  } /* switch */
} /* main */
    
