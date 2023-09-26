# COMP122 Lecture Notes: September 25, 2023

## Announcements:
   1. Quiz This Weekend.

   1. Assignment: practice-quiz-models
      - Status: past due

   1. Assignment: PEMDAS and TAC
      - Status:  almost graded

   1. Assignment: Table Encodings
      - Status: assigned
      - Due Date: Oct 03 23:59:59 (Thursday)

## Today's Agenda:
   1. Complete: Introduction to Formating and Encodings
   1. Start: Introduction to Numbering Systems

   1. Lab: 
      - While Loop Transformation


## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am


   * T/R @ 9:00 am


---
# Today's Lecture Material

  1. Complete: Introduction to Encodings: 
     - introduction-to-encodings.pdf
       * ASCII characters 
       * MIPS encodings

  1. Start: Introduction to Numbering Systems
     - introduction-to-numbering-systems.pdf


# Today's Lab Material
  1. Loop Construction

  1. Practicum on While Loops
     - 


---
## Resources

  1. Example Mapping of an for-loop (a while loop in disguised)

     ```java
     top = 10;
     for( i=top; i > 0 ; i -- ) {
        mips.print_d(i);
     }
     ```

     ```java tac
             top = 10;

             i=top;

     loop:  for(; i > 0 ;) {
     body:      null;
                mips.print_d(i);

     next:      null;
                i --; 
                continue loop;  
             }
     done:   null;
     ```


     ```mips

     ```

  1. reference/TAC2mips.md   (Here is a subset)

     | JAVA: MIPS OS Interface       | MIPS Macro                |
     |-------------------------------|---------------------------|
     | `mips.print_t(a);`            | `print_t(a)`              |
     | `mips.print_ti(imm);`         | `print_ti(imm)`           |
     | `mips.print_c(a);`            | `print_c(a)`              |
     | `mips.print_ci(imm);`         | `print_ci(imm)`           |
     |  See print_routines.md        | etc., etc., etc.,         |

  - Control flow labels
      * {cons}: the consequence for an if-then-else statement
      * {alt}:  the alternative for an if-then-else statement
      * {test}: the conditional statement loop statement
      * {body}: the body of a loop
      * {done}: the statement after a control-flow statement

 

      | TAC Control Flow                  | MIPS Instruction           |
      |-----------------------------------|----------------------------|
      |                                   |                            |
      | `continue label;`                 | `b label`                  |
      | `break label;`                    | `b {done}`                 |
      |                                   |                            |
      | `for(; a <cond> b ;) {`           | `b<! cond> a, b, {done}`   |
      |                                   |                            |
      | `for(; a <cond> b ;) {`           | `b<cond> a, b, {body}`     |
      |                                   | `b {done}`                 |
      |                                   |                            |
      | `while(a <cond> b) {`             | `b<! cond> a, b, {done}`   |
      |                                   |                            |



      | `TAC <cond>` | `MIPS <cond>` | `MIPS <! cond>` |`TAC <! cond>` |
      |:------------:|:-------------:|:---------------:|:-------------:|
      | `<`          | `lt`          | `ge`            |  `>=`         |
      | `<=`         | `le`          | `gt`            |  `>`          |
      | `!=`         | `ne`          | `eq`            |  `==`         |
      | `==`         | `eq`          | `ne`            |  `!=`         |
      | `>=`         | `ge`          | `lt`            |  `<`          |
      | `>`          | `gt`          | `le`            |  `>=`         |
   



---
<!-- This section for student's to place their own notes. -->
<!-- This section will not be updated by the Professor.   -->

## Notes  


