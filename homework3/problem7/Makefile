# $UWHPSC/codes/fortran/newton/Makefile

OBJECTS = functions.o newton.o test_quartic.o
MODULES = functions.mod newton.mod

FFLAGS = -g

.PHONY: test_quartic clean 

test_quartic: test_quartic.exe
	./test_quartic.exe

test_quartic.exe: $(MODULES) $(OBJECTS)
	gfortran $(FFLAGS) $(OBJECTS) -o test_quartic.exe

%.o : %.f90
	gfortran $(FFLAGS) -c  $< 

%.mod: %.f90
	gfortran $(FFLAGS) -c $<

clean:
	rm -f *.o *.exe *.mod

