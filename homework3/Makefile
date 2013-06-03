# $UWHPSC/codes/fortran/newton/Makefile
# Modified by Ryan (Weiran) Zhao 
# Mon,Jun 03th 2013 07:42:50 PM EDT

TEST1_OBJ = functions.o newton.o test1.o 
INTER_OBJ = functions.o newton.o intersections.o
MODULES = functions.mod newton.mod

FFLAGS = -g

.PHONY: test1 clean intersections

intersections: intersections.exe
	./intersections.exe

intersections.exe: $(MODULES) $(INTER_OBJ)
	gfortran $(FFLAGS) $(INTER_OBJ) -o intersections.exe

test1: test1.exe
	./test1.exe

test1.exe: $(MODULES) $(TEST1_OBJ)
	gfortran $(FFLAGS) $(TEST1_OBJ) -o test1.exe

%.o : %.f90
	gfortran $(FFLAGS) -c  $< 

%.mod: %.f90
	gfortran $(FFLAGS) -c $<

clean:
	rm -f *.o *.exe *.mod

