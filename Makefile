CC=gcc
CFLAGS=-Wall

all: src/ipgp_dtft.c init_functions.o math_functions.o
	$(CC) $(CFLAGS) math_functions.o init_functions.o src/ipgp_dtft.c -o ipgp_dtft -lm

init_functions.o: src/init_functions.c
	$(CC) $(CFLAGS) -c src/init_functions.c -o init_functions.o 

math_functions.o: src/math_functions.c
	$(CC) $(CFLAGS) -c src/math_functions.c -o math_functions.o 

plot:
	R CMD BATCH --no-save --no-restore '--args input="${SPECTRUM}" output="${SPECTRUM}.png"' src/draw_3d_plot.R 

heatmap_plot:
	chmod +x src/draw_heatmap_plot.sh
	src/draw_heatmap_plot.sh ${SPECTRUM}

clean: 
	rm -f *~
	rm -f *.Rout
	rm -f *.o
	rm -f ipgp-dtft

clean_output:
	rm -f *.pdf
	rm -f *.png
