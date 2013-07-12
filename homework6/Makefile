
OBJECTS = functions.o quadrature.o test.o
TEST2= functions.o quadrature.o test2.o
FFLAGS = 
NUM_PROCS ?= 4   # default if not specified on command line or env variable

.PHONY: test clean 

test2: test2.exe
	openmpiexec -n $(NUM_PROCS) test2.exe

test2.exe: $(TEST2)
	openmpif90 $(FFLAGS) $(TEST2) -o test2.exe

test: test.exe
	openmpiexec -n $(NUM_PROCS) test.exe

test.exe: $(OBJECTS)
	openmpif90 $(FFLAGS) $(OBJECTS) -o test.exe

%.o : %.f90
	openmpif90 $(FFLAGS) -c  $< 

clean:
	rm -f *.o *.exe *.mod

