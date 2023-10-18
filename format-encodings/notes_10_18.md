# COMP122 Lecture Notes: October 18, 2023

## Announcements:

      
## Today's Agenda:
   1. Conversion Between Bases
      - Review an then Fractional Values

   1. Binary32 Assignment
      - Time to work on the assignment


## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am

   * T/R @ 9:00 am


---
# Today's Lecture Material
  1. Conversion Between Bases
       - Review and then Fractions
       - See slides: conversion-between-bases.pdf

  1. Base 10 to Base N: Whole Part
     
     - Pattern (table)

       |  number | / N -> | quotient | remainder | glyph |
       |---------|:------:|---------:|----------:|:-----:|
       |         | / N -> |          |           |       |         

       Answer:        (read glyph from bottom to the top)

     - Pattern (code block)

       ```response
       number = number    
           number   / N = quotient, remainder
           quotient / N = 

       answer:    (read remainders from bottom to the top)
       ```

     - Example:



  1. Base 10 to Base N: Fractional Part

     - Pattern (code block)
       ```response
          number = ddddd
          max =  1,00000
             number  * N = overflow, product
             product * N = 

          answer:    (read remainders from bottom to the top)
        ```

     - Example:  .456 to Base 2
       ```response
          number = 456
          max =  1,000
            456 * 2 = 0, 912
            912 * 2 = 1, 824
            824 * 2 = 1, 648
            648 * 2 = 1, 296

            296 * 2 = 0, 592
            592 * 2 = 1, 184
            184 * 2 = 0, 368
            368 * 2 = 0, 736

            736 * 2 = 1, 472
            472 * 2 =
        answer:  2# 0111 0100 1
        ```
  1. Code: Whole Part
     ```java
     mips.read_d()
     number = mips.retval;


     ```

  1. Code: Fractional Part
     ```java
     mips.read_d()
     number = mips.retvalue;
     mips.read_d();
     precision = mips.retval;

     max = (int) Math.pow(10, precision);



     ```



# Today's Lab Material
  1. Binary32 Assignment
     - Review the specification: README.md
     - Makefile review
     - Time to work on the assignment

---
## Resources


---
<!-- This section for student's to place their own notes. -->
<!-- This section will not be updated by the Professor.   -->

## Notes  


