# advanceClassificationRecursion.c
# advancedClassificationLoop.c
# basicClassification.c
# main.c
# written by orel dayan and roy asraf 

CC = gcc
AR = ar -rcs
BASIC = basicClassification.o
REC = advancedClassificationRecursion.o
LOOP = advancedClassificationLoop.o
FLAGS = -Wall -g

all:advancedClassificationLoop.o advancedClassificationRecursion.o advancedClassificationLoop.o mains maindloop maindrec loops loopd recursives recursived

mains: main.o libclassrec.a
	$(CC) $(FLAGS) -o mains main.o libclassrec.a -lm

maindloop: main.o libclassloops.so
	$(CC) $(FLAGS) -o maindloop main.o ./libclassloops.so -lm

maindrec: main.o libclassrec.so
	$(CC) $(FLAGS) -o maindrec main.o ./libclassrec.so -lm

loops: libclassloops.a

recursives: libclassrec.a

loopd: libclassloops.so

recursived: libclassrec.so

libclassloops.a: $(LOOP) $(BASIC)
	 $(AR) libclassloops.a $(LOOP) $(BASIC)

libclassloops.so: $(LOOP) $(BASIC)
	 $(CC) $(FLAGS) -shared -o libclassloops.so $(LOOP) $(BASIC)

libclassrec.a: $(REC) $(BASIC)
	 $(AR) libclassrec.a $(REC) $(BASIC) 

libclassrec.so: $(REC) $(BASIC)
	 $(CC) $(FLAGS) -shared -o libclassrec.so $(REC) $(BASIC) 

main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c

basicClassification.o: basicClassification.c
	$(CC) $(FLAGS) -c basicClassification.c -lm

advancedClassificationLoop.o: advancedClassificationLoop.c
	$(CC) $(FLAGS) -c advancedClassificationLoop.c -lm

advancedClassificationRecursion.o: advancedClassificationRecursion.c
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c


basicClassification.c:
	$(CC) $(FLAGS) -c basicClassification.c -lm

advancedClassificationLoop.c:
	$(CC) $(FLAGS) -c advancedClassificationLoop.c -lm

advancedClassificationRecursion.c:
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c -lm

clean: 
	rm -f *.o *.a *.so mains maindloop maindrec
   
