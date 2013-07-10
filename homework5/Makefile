
TEST2= functions.o quadrature2.o test2.o
TEST3= functions.o quadrature3.o test3.o
FFLAGS = -fopenmp

.PHONY: test2 test3 clean 

test3: test3.exe
	./test3.exe

test2: test2.exe
	./test2.exe

test3.exe: $(TEST3)
	gfortran $(FFLAGS) $(TEST3) -o test3.exe

test2.exe: $(TEST2)
	gfortran $(FFLAGS) $(TEST2) -o test2.exe

%.o : %.f90
	gfortran $(FFLAGS) -c  $< 

clean:
	rm -f *.o *.exe *.mod

