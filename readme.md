Simple Conversor
=================

This is a simple proyect to make an easy conversor Decimal to binary and vice versa.

We use two functions to make the conversion, the decimal to binary function is a recursive example and the decimal to binary is a simple function.

the main just control the in/out process and the main menu logic.

Compilation process
--------------------

To compile conversor.c use:

+ gcc conversor.c -o app -lm

Flag '-lm' is important for math library

To genearate the assambly file (conversor.s) use:

+ gcc -Wall -S conversor.c

Execute
--------------------

To execute just run:

+ ./app
