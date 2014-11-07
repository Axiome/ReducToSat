#include <stdio.h>
#include <stdlib.h>

int main(int argc, char ** argv){
	
	int cpt = 0;
	for(int i = 3; i < argc; i+=2){
		printf("-%d -%d 0\n", atoi(argv[i]), atoi(argv[i+1]));
	}
	for(int i = 3; i < argc; i+=2){
		printf("%d", atoi(argv[i]));
		cpt = 0;
		for(int j = 3; j < argc; j+=2){
			if(atoi(argv[i]) == atoi(argv[j])){
				printf(" %d", atoi(argv[j+1]));
			}
			if(atoi(argv[i+1]) == atoi(argv[j])){
				cpt += 1;	
			}
		}
		printf(" 0\n");
		if(cpt == 0){
			printf("%d 0\n", atoi(argv[i+1]));
		}
	}
}
