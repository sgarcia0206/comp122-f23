# Java TAC to ARM Transliteration

Once you have rewritten your JAVA method into the JAVA TAC style, you can use the information in this document to transliterate your method into a ARM subroutine.

Note that sometimes there is not a 100% direct correlation between your JAVA TAC instruction and a set of ARM instruction. Hence, some thinking is necessary when performing the transliteration.

## Other Resources

  - ARMM Cheat-sheet: ~/classes/comp122/reference/ARM-cheatsheet.pdf
  - Java to Java TAC transformation: (under development)

## Notation:
  - Scalar values:                lower case letters, e.g. `a, b, c, ..x`
  - Arrays and Memory locations:  upper case letters, e.g., `A, B, C, ..X`
  - Literals and Immediate values:  `imm`
  - Registers:  a word prefix with a dollar, e.g., $zero
  - Metasymbol: a word enclosed in braces, e.g., {loop}

### Mathematical Equations and the Null Statement

  * Notation: TAC Instructions and Corresponding ARM Instructions
    - Patterns
      1. Java Instructions with one literal:  `x = a <op_i> 2;`
         - `ARM <op_i>  <- Java operator`
           * addi: +, subi: -, ori: |, andi: &, xori: ^
      1. Java Instructions with two variables: `x = a <op> b;`
         - `ARM <op>  <- Java operator`
           * add: +, sub: -, or: |, and: &, xor: ^,



      | TAC Mathematical Equations    | ARM  Instructions         |
      |-------------------------------|---------------------------|
      | `;`                           | `nop`                     |
      | `x = imm;`                    | `li x, #imm`              |
      | `x = - imm;`                  | `subi x, $zero, #imm`     |
      | `x = - a;`                    | `sub  x, $zero, a`        |
      | `x = a;`                      | `move x, a`               |
      | `x = a + imm; `               | `ADD x, a, #imm`          |
      | `x = a + b;`                  | `ADD x, a, b`             |
      | `x = a - imm; `               | `SUB x, a, #imm`          |
      | `x = a - b;`                  | `SUB x, a, b`             |
      | `x = imm - a; `               | `RSB x, a, #imm`          |
      | `x = b - a;`                  | `RSB x, a, b`             |

      | TAC Mathematical Shortcuts    | ARM  Instructions         |
      |-------------------------------|---------------------------|
      | `x++`                         | `add x, x, 1`             |
      | `x--`                         | `sub x, x, 1`             |
      | `++x`                         | `add x, x, 1`             |
      | `--x`                         | `sub x, x, 1`             |
      | `x = a * 2`                   | `sll x, a, 1`             |
      | `x = a / 2`                   | `sra x, a, 1`             |

      | TAC Bitwise Equations         | ARM  Instructions         |
      |-------------------------------|---------------------------|
      | `x = ~ a;`                    | `nor x, a, $zero`         |


      | TAC Shift Equations           | ARM  Instructions         |
      |-------------------------------|---------------------------|
   
      | `x = a >>> imm;`              | `srl x, a, #imm`           |
      | `x = a >> imm;`               | `sra x, a, #imm`           |
      | `x = a << imm;`               | `sll x, a, #imm`           |
      | `x = a >>> b;`                | `srlv x, a, b`            |
      | `x = a >> b;`                 | `srav x, a, b`            |
      | `x = a << b;`                 | `sllv x, a, b`            |

      | TAC Mult / Div Equations      | ARM Instruction          |
      |-------------------------------|---------------------------|
      | `x = a * b;`                  | `mult a, b`               |
      |                               | `mflo x`                  |
      |                               |                           |
      | `x = a / b;`                  | `div a, b`                |
      |                               | `mflo x`                  |
      |                               |                           |
      | `x = a % b;`                  | `div a, b`                |
      |                               | `mfhi x`                  |
      |                               |                           |

      | TAC Mult/Div Psuedo Equations | ARM Instruction          |
      |-------------------------------|---------------------------|
      | `x = a * b;`                  | `mul x, a, b`             |
      | `x = a / b;`                  | `div x, a, b`             |
      | `x = a % b;`                  | `rem x, a, b`             |


      | TAC String Equations          | ARM Instruction          |
      |-------------------------------|---------------------------|
      | `p = & A;`                    | `la p, A`                 |
      | `x = (* p);`                  | `lb x, 0(p)`              |
      | `(* p) = x;`                  | `sb x, 0(p)`              |
      |                               |                           |
      | `x = A[imm];`                 | `la p, A`                 |
      |                               | `lb x, imm(p)`            |
      |                               |                           |
      |                               |                           |
      | `x = A[v];`                   | `la p, A`                 |
      |                               | `add p, p, v`             |
      |                               | `lb x, 0(p)`              |
      |                               |                           |
      | `A[imm] = x;`                 | `la p, A`                 |
      |                               | `sb x, imm(p)`            |
      |                               |                           |
      | `A[v] = x;`                   | `la p, A`                 |
      |                               |                           |
      |                               | `add p, p, v`             |
      |                               | `sb x, 0(a)`              |

      | TAC Subroutine                | MIPS Instruction          |
      |-------------------------------|---------------------------|
      | `return a;`                   | `move $v0, a`             |
      |                               | `jr $ra`                  |
      | `return imm;`                 | `li $v0, imm`             |
      |                               | `jr $ra`                  |

    - Control flow labels
      * {cons}: the consequence for an if-then-else statement
      * {alt}:  the alternative for an if-then-else statement
      * {test}: the conditional statement loop statement
      * {body}: the body of a loop
      * {done}: the statement after a control-flow statement

      | TAC Control Flow                  | ARM Instruction            |
      |-----------------------------------|----------------------------|
      | `label: ;`                        | `label: nop`               |
      | `// goto label;`                  | `b label`                  |
      | `continue label;`                 | `b label`                  |
      | `break label;`                    | `b {done}`                 |
      | `{`                               |                            |
      | `}`                               |                            |
      |                                   |                            |
      | `if (a <cond> b) {`               | `b<! cond> a, b, {alt}`    |
      |                                   |                            |        
      | `if (a <cond> b) {`               | `b<cond> a, b, {cons}`     |
      |                                   | `b {alt}`                  |
      |                                   |                            |
      | `if (a <cond> b) break label;`    | `b<cond> a, b, {done}`     |
      | `if (a <cond> b) continue label;` | `b<cond> a, b, label`      |
      |                                   |                            |
      | `} else {`                        |                            |
      | `}`                               |                            |
      |                                   |                            |
      | `for(; a <cond> b ;) {`           | `b<! cond> a, b, {done}`   |
      | `while(a <cond> b) {`             | `b<! cond> a, b, {done}`   |
      |                                   |                            |
      | `for(; a <cond> b ;) {`           | `b<cond> a, b, {body}`     |
      |                                   | `b {done}`                 |
      |                                   |                            |
      * Note: we presume that the original Java code does not include
        any "continue" statements. See appendix for proper treatment.


      | `TAC <cond>` | `ARM <cond>` | `ARM <! cond>` |`TAC <! cond>` |
      |:------------:|:-------------:|:---------------:|:-------------:|
      | `<`          | `lt`          | `ge`            |  `>=`         |
      | `<=`         | `le`          | `gt`            |  `>`          |
      | `!=`         | `ne`          | `eq`            |  `==`         |
      | `==`         | `eq`          | `ne`            |  `!=`         |
      | `>=`         | `ge`          | `lt`            |  `<`          |
      | `>`          | `gt`          | `le`            |  `>=`         |
   


      1. ARM Output Routines

      | Java TAC                      | ARM Macro                |
      |-------------------------------|---------------------------|
      | `ARM.print_d(a);`            | `print_d(a)`              |
      | `ARM.print_di(imm);`         | `print_di(imm)`           |
      |  See print_routines.md        | etc., etc., etc.,         |

      1. ARM Input Routines

      | Java TAC                      | ARM Macro                |
      |-------------------------------|---------------------------|
      | `ARM.read_d();`              | `read_d()`                |
      | `ARM.read(fd, buff, imm);`   | `read(fd, buff, imm)`     |
      | `ARM.sbrk(size);`            | `sbrk(size)`              |
      | `ARM.sbrki(imm);`            | `sbrki(imm)`              |
      | `X = ARM.retval();`          | `move X, $v0`             |

      1. ARM Stack Routines

      | Java TAC                      | ARM Macro                |
      |-------------------------------|---------------------------|
      | `ARM.push(a);`               | `push a`                  |
      | `a = ARM.pop();`             | `pop a`                   |


## Appendix

   1. "Continue" Statement
      If your original Java code contains a "continue" statement, the 
      the simplistic method used to perform the Java -> Java TAC 
      transformation needs to be augmented.

      Consider the following sample Java code
      ```java

      for (i=0; i <=10; i++) {

        if ( a < b ) continue;

        a = pem + das;

        if ( a < b ) break;

      }
      ```

      ```java TAC
      // This is the translation using the simplistic method
      init:  ;
             i = 0; 
      loop:  for (; i <=10 ;) { 
      body:    ;
               if ( a < b ) continue;

               a = pem + das;

               if ( a < b ) break;
      next:    ;
               i++;
               continue loop;
             }
      done:  ;
      ```

      Consider line 189 above.  The `continue` statement results
      in line 187 to be executed next.  But we need to execute line
      194 to keep the semantics of the original code.

      To address this issue, a copy of the 'next' block must be
      copied and placed just prior to the users "continue" statement.
      This transformation is depicted in the following code block.
      ```java TAC
      // This is the more robust translation approach
      init:  {
               ;
               i = 0; 
             }
      loop:  for (; i <=10 ;) { 
      body:    {
               ;
               if ( a < b ) {
                { // copy of the next block
                  ;
                  i++;
                }
                continue loop;
               }
               a = pem + das;

               if ( a < b ) break;
               }
      next:    {
                  ;
                  i++;
               }
               continue loop;
             }
      done:  ;
      ```

      If you could use a "goto" in Java, a "continue" statement could
      be transformed into a "goto {next}".



