
OBJECTS = functions.o quadrature2.o test2.o
FFLAGS = -fopenmp

.PHONY: test clean 

test: test.exe
	./test.exe

test.exe: $(OBJECTS)
	gfortran $(FFLAGS) $(OBJECTS) -o test.exe

%.o : %.f90
	gfortran $(FFLAGS) -c  $< 

clean:
	rm -f *.o *.exe *.mod

