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
      - Complete: Introduction to Formating and Encodings

   1. Lab: 
      - Provide Examples of table lookup
      - Provide Examples of utf-8 encoding
      - If-the-else --> TAC Translation Review 


## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am
     - general questions about exam and assignments
     - binary addition?
     - last question on question:
       - the one with rval, lval, and the memory represention?
     - where in the three layers is the user payload sent?


   * T/R @ 9:00 am
     - SOF: Start of Frame: clarification
     - Mapping and Functions slide: review


---
# Today's Lecture Material

  1. Complete: Introduction to Encodings: 
     - introduction-to-encodings.pdf
       * ASCII characters 
       * MIPS encodings

 

# Today's Lab Material

 1. Table Lookup Examples
     * https://drive.google.com/drive/u/0/folders/1ZLRC2SE5znDr8orhsZveRKd45TQs0A_e

     - MW-M
       - binary string    --> octal, hex, bcd
         * 101011101101
           - 2# 101 011 101 101   ==>  8# 5355
           - 2# 1010 1110 1101    ==> 16# A E D
           - 2# 1010 1110 1101    ==> BCD: NA NA NA

         * 0111 1001 0001
           - 2# 011 110 010 001  ==>  8# 3 6 2 1
           - 2# 0111 1001 0001   ==> 16# 7 9 1
           - 2# 0111 1001 0001   ==> BCD: 7 9 1

         * Binary String: 010100010100101001
           - 010 100 010 100 101 001 ==> 8# 242 451
           - 0101 0001 0100 1010 01 ==> 16# 5 1 4 5 NA
           - 0101 0001 0100 1010 01 ==> BCD: 5 1 4 5 NA

         * Binary Number: 010100010100101001
           - 2# 000 000 000 010 100 010 100 101 001 ==> 8# 0242451
           - 2# 0000 0000 0001 0100 0101 0010 1001 ==> 16# 0 0 1 4 5 2 9
           - 2# 0000 0000 0001 0100 0101 0010 1001 ==> BCD: 0 0 1 4 5 2 9

       - octal, hex, bcd  --> binary string 

       - binary string --> ASCII, base64
         * 1010101111100011100011010101 
           - | 10 1010  | 11 1110 | 00 1110 | 00 1101 | 0101 | 
           - base64: q + O N  NA

       - ASCII, base64 --> binary string 

     - MW-A
       - binary string    --> octal, hex, bcd
   
         * 101101001010
           - 2# 101 101 001 010   ==>  8# 5 512
           - 2# 1011 0100 1010    ==> 16# B 4 A
           - 2# 1011 0100 1010    ==> BCD: NA 4

         * 001101111010
           - 2# 001 101 111 010    ==>  8# 1572
           - 2# 0011 0111 1010    ==> 16# 37A
           - 2# 0011 0111 1010    ==> BCD: 3 7 NA

         * Binary String: 1011101010010110100101010
           -    101 110 101 001 011 010 010 101 0 ==> 
           - 8#   5   6   5   1   3   2   2   5 NA

           - 1011 1010 1001 0110 1001 0101 0 ==> 16#  BA965 NA
           - 1011 1010 1001 0110 1001 0101 0 ==> BCD: NA NA 9 6 5 NA

         * Binary Number: 1011101010010110100101010
           - 2# 000 001 011 101 010 010 110 100 101 010 ==> 8# 0135226452
           - 2# 00 0001 0111 0101 0010 1101 0010 1010 ==> 16# 01752C2A
           - 2# 00 0001 0111 0101 0010 1101 0010 1010 ==> BCD:

       - octal, hex, bcd  --> binary string 

       - binary string --> ASCII, base64
         * base64
         * 10110100000101111001010010010101
         * | 10 1101 | 00 0001 | 01 1110 | 01 0100 | 10 0101  | 01 |
         * t           B         e         U         l          NA

       - ASCII, base64 --> binary string 

     - TR
       - binary string    --> octal, hex, bcd
         * 111010110001
           - 2# 111 010 110 001  --> 8# 7261  -> 2# 111 010 110 001
           - 2# 1110 1011 0001   --> 16# EB1
           - 2# 1110 1011 0001  --> BCD: NA NA 1

         * 010111101011
           - 2# 010 111 101 011  -->  
             8#   2   7   5   3
           - 2# 0101 1110 1011  -->  16# 5EB
           - 2# 0101 1110 1011  -->  bcd: 5 NA NA   (error)

         * Binary String: 10100100101101011
           - 101 001 001 011 010 11 -> 8# 5 1 1 3 2 NA
           - 1010 0100 1011 0101 1 -> 16# A 4 B 5 NA
           - 10100100101101011 -> BCD: NA 4 NA 5 NA

         * Binary Number: 00000000000000 10100100101101011
           - 2# 010 100 100 101 101 011 -> 8# 2 4 4 5 5 3
           - 2# 0001 0100 1001 0110 1011 -> 16# 1 4 9 6 A
           - 2# 10100100101101011 -> BCD: 1 4 9 6 NA 

       - octal, hex, bcd  --> binary string 

       - binary string --> ASCII, base64
         - 010001001001010111101010
         - | 01 0001 | 00 1001 | 01 0111 | 10 1010 | -> BASE64: 
         -         R         J         X         q

       - ASCII, base64 --> binary string 

       * MIPS
         - add $t1, $t2, $t3    
         - Pattern:  func rd, rs, rt

         - R-Format:  op, rs, rt, rd, sh, func
          - op: 000 000 
          - rs: 0 1010
          - rt: 0 1011
          - rd: 0 1001
          - sh: 0 0000
          - func: 100 000

         - op: 00000001010010110100100000100000



  1. Encoding and Decoding of UTF-8
     - encode-utf8.md
     - decode-utf8.md


  1. UTF-8 examples
     - MW
     - TR



  1. Algorithm If-then-else --> TAC Transformation
     1. Identify the parts of the if-the-else statement
        * {test}: the boolean expression of the if-then-else
        * {cons}: the consequence code block for the if-then-else
        * {alt}:  the alternative code block for the if-then-else
        * {done}: the first line of code executed after the if-then-else

     1. Insert the {init} label, with a null statement, before the start of the if-then-else
     1. Append the {done} label, with a null statement, after the end of the if-then-else

     1. Insert the {cons} label, with a null statement, at top of the consequence code block
     1. Append '// goto {done};' to the end of consequence code block

     1. Insert the {alt} label, with a null statement, at top of the alternative code block
     1. Append '// goto {done};' to the end of consequence code block

        * The resulting template before code movement

          ```java tac
          init:    ;
                   if(  <test>  ) {
          cons:      ;
                     <consequence>
                     // goto done;
                    } else {   ;
          alt:       ;
                     <alternative>
                     // goto done;
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


