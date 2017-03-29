#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX 10
int read_write_file(char *input_file, char *output_file);
int i=1;

int main(){
    //params: input file, output file
    read_write_file("audio_samples\\phone_ring.csv","audio_samples\\phone_ring_out.csv");

    return 0;
}

int read_write_file(char *input_file, char *output_file){
	FILE *fp_in, *fp_out;
	char value[9], *pch;
    int counter = 0;

	if ((fp_in = fopen(input_file, "r")) == NULL) {
		printf("Sample %i: READ FILE ERROR: unable to open the file '%s'.\n", i, input_file);
		i++;
		return 1;
	}    if ((fp_out = fopen(output_file, "w")) == NULL) {
		printf("Sample %i: WRITE FILE ERROR: unable to open the file '%s'.\n", i, output_file);
		i++;
		return 1;
	}

	while (!feof(fp_in)) {
        fgets(value, 9, fp_in);
        pch = strtok(value, "\n");

        fprintf(fp_out, "\t%i : %s ;\n", counter, pch);
        counter++;
  	}

  	fclose(fp_in);
  	fclose(fp_out);
  	printf("Sample %i: sucess when reading and wrinting.\n", i);
  	i++;
  	return 0;
}
