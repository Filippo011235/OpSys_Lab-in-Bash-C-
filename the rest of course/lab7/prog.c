#include <stdio.h>
#include <unistd.h>

int main () {
  int PIDproc = getpid();

  printf("PID tego procesu %d\n", PIDproc);
  sleep(1);
}
