#include<stdio.h>

int doppel;

int main(void) {
  for(int i=0; i<26; ++i) {
    doppel = i*i;
    if(i<=9) printf(" ");
    printf("%d² = %d ", i, doppel);
    if(doppel<=9) printf(" ");
    if(doppel<=99) printf(" ");
    printf("=> ");
    printf("sqrt(%d) ", doppel);
    if(doppel<=9) { printf(" "); }
    if(doppel<=99) { printf(" "); }
    printf("= %d", i);
    printf("\n");
  }
  return 0;
}
