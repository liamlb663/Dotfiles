#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int getCurrentNRG(){
	char* file = "/sys/class/power_supply/BAT0/capacity";
	FILE* fptr = fopen(file, "r");
	if(fptr == NULL) return -1;
	char buf[3];
	fscanf(fptr, "%[^\n]", buf);
	return strtol(buf, NULL, 10);
}

char getStatus(){
	char* file = "/sys/class/power_supply/BAT0/status";
	FILE* fptr = fopen(file, "r");
	if(fptr == NULL) return '?';
	char buf[13];
	fscanf(fptr, "%[^\n]", buf);
	if(buf[0] == 'D') return '-';
	return '+';
}

int main(void){
	int bat = getCurrentNRG();
	fprintf(stdout, "%c%d%%", getStatus(), bat);
	return 0;
}
