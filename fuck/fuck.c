/** fuck.c
(C) 2020 cheeesy Licensed under MIT license **/
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>
char mode=0;
int main(int argc, char *argv[]) {
    if(argv[1]==NULL) { printf("Fuck what?!\n"); return 0; }
    for(int i=0;i<argc;++i) {
        for(int j=0;j<strlen(argv[i]);++j) { argv[i][j] = tolower(argv[i][j]); } /* put string into lower case. */
        if(mode!=0) break; /* break out if mode is set already. */
        if(strstr(argv[i],"you") || strstr(argv[i],"yall")) mode='y';
        if(strstr(argv[i],"me") || strstr(argv[i],"my")) mode='m';
        if(strstr(argv[i],"it")) mode='i';
        if(strstr(argv[i],"everything")) mode='/';
        if(strstr(argv[i],"off")) mode='o';
        if(strstr(argv[i],"this") || strstr(argv[i],"that")) mode='i';
    }
    switch(mode) {
    case 'y':
        printf("Excuse me?\n");
        return 0;
    case 'm':
        printf("I'm not capable of such a task.\n");
        return 0;
    case 'i':
        printf("I'll try my best.\n");
        return 0;
    case '/':
        printf("You don't want to do this, trust me.\n");
        return 0;
    case 'o':
        printf("I'm already gone.\n");
        return 0;
    }
    return 0;
}
