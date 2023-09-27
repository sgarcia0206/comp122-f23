# COMP122 Lecture Notes: September 25, 2023

## Announcements:
   1. Quiz This Weekend.
      - To be posted in Slack on Friday Night (post 5:00pm)

   1. Name: Table Encodings
      - Status: Assigned
      - Deliverable ID: 21
      - Invitation URL: https://classroom.github.com/a/79eoHK-K
      - Due Date: Oct 03 23:59:59 (Tuesday)
   
   1. Name: UTF-8 Encoding
      - Status: Assigned
      - Deliverable ID: 22
      - Invitation URL: https://classroom.github.com/a/GEC4DKyv
      - Due Date: Oct 05 23:59:59 (Thursday)
    


## Today's Agenda:
   1. Lecture
      1. Complete: Introduction to Formating and Encodings
      1. Provide Examples of table lookup
      1. Provide Examples of utf-8 encoding

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
  1. Table Lookup Examples
     * https://drive.google.com/drive/u/0/folders/1ZLRC2SE5znDr8orhsZveRKd45TQs0A_e
     - MW
       - binary string    --> octal, hex, dec
       - octal, hex, dec  --> binary string 

       - binary string --> ASCII, base64
       - ASCII, base64 --> binary string 

       - binary string --> UTF-8
       - UTF-8         --> binary string 

     - TR
       - binary string    --> octal, hex, dec
       - octal, hex, dec  --> binary string 

       - binary string --> ASCII, base64
       - ASCII, base64 --> binary string 

       - binary string --> UTF-8
       - UTF-8         --> binary string 


  1. Encoding and Decoding of UTF-8
     - encode_utf8.md
     - decode_utf8.md

  1. UTF-8 examples
     - MW
     - TR


# Today's Lab Material
  1. Algorithm If-then-else --> TAC Transformation
     1. Identify the parts of the if-the-else statement
        * {test}: the boolean expression of the if-then-else
        * {cons}: the consequence code block for the if-then-else
        * {alte}: the alternative code block for the if-then-else
        * {done}: the first line of code executed after the if-then-else

     1. Insert the {init} label, with a null statement, before the start of the if-then-else
     1. Append the {done} label, with a null statement, after the end of the if-then-else

     1. Insert the {cons} label, with a null statement, at top of the consequence code block
     1. Append '// goto {done}' to the end of consequence code block

     1. Insert the {cons} label, with a null statement, at top of the consequence code block
     1. Append '// goto {done}' to the end of consequence code block

        * The resulting template before code movement

          ```java tac
          init:    ;
                   if(  <test>  ) {
          cons:      ;
                     <consequencey>
                     // goto done
                    } else {   ;
          alt:       ;
                     <alternative>
                     // goto done
                   }
          done:    ;
          ```

     1. Simplify the boolean expression into three parts
        - evaluate the left-hand side into $l
          - move the eval of $l into the {init} block
        - evaluate the righ-hand side into $r
          - move the eval of $r into the {init} block
        - replace the boolean expresion with a simple test:  `$l <cond> $r`
          - yeilding:    `if ( $l <cond> $r ) {`



  1. Algorithm  For-loop (aka structured while-loop) --> TAC Transformation
     1. Identify with labels the section of the loop
        - {init}: the initialization arm of the for-loop
        - {loop}: the line of code that contains `for( <init> ; <test> ; <next> ) {`
        - {body}: the body of the for-loop
        - {next}: the next arm of the for-loop
        - {done}: the first line of code executed after the for-loop

     1. Insert the {init} label, with a null statement, before the start of the for-loop
     1. Associate the {loop} label with `for( init ; test ; next ) {`
     1. Append the {done} label, with a null statement, after the end of the for-loop

     1. Insert the {body} label, with a null statement, at the top of the {body}
     1. Insert the {next} label, with a null statement, at the end of the {body}
     1. Append 'continue {loop};' to the end of of the {next} block

        * The resulting template before code movement

          ```java tac
          init:    ;
          loop:    for( <init> ; <test> ; <next> ) {
          body:       ;
                      <body>

          next:       ;

                      continue loop;
                   }
          done:    ;
          ```

     1. Move the init arm to the {init} block

     1. Simplify the boolean expression into three parts
        - evaluate the left-hand side into $l
          - move the eval of $l into the {init} block
          - place a copy of the eval of $l into the {next} block
        - evaluate the righ-hand side into $r
          - move the eval of $r into the {init} block
          - place a copy of the eval of $r into the {next} block
        - replace the boolean expresion with a simple test:  `$l <cond> $r`
          - yeilding:    `loop: for(;  $l <cond> $r ;)`

     1. Move the next arm to the {next} block


  1. Practicum on While Loops
     - Count-down
     - Summation
     - Factorial


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


