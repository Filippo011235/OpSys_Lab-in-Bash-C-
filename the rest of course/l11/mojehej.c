#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define ILOSC_WATKOW 7

void *FunkcjaWatku(void * arg){
  printf("czesc swiecie mowi: %d\n", (int) arg );
  pthread_exit(NULL);
}

 
int main(){
  pthread_t TabWatkow[ILOSC_WATKOW]; // do identyf. watkow
  
  printf("Glowny program zaczyna tworzyc\n");
  
  for(int i = 0; i < ILOSC_WATKOW; i++){
    if( pthread_create(&TabWatkow[i], NULL, FunkcjaWatku, (void *) i) != 0) { // atrybuty domyslne,
      perror("pthread_create");
      exit(1);
    }
  }
  
  printf("Koncze glowny program");
  pthread_exit(NULL);

  printf("Koncze glowny program");

  
  exit(0);
} // main