# Java TAC to MIPS Transliteration

Once you have rewritten your JAVA method into the JAVA TAC style, you can use the information in this document to transliterate your method into a MIPS subroutine.

Note that sometimes there is not a 100% direct correlation between your JAVA TAC instruction and a set of MIPS instruction. Hence, some thinking is necessary when performing the transliteration.

## Other Resources

  - MIPS Cheat-sheet: ~/classes/comp122/reference/MIPS-cheatsheet.pdf
  - Java to Java TAC transformation: (under development)

## Notation:
  - Scalar values:                lower case letters, e.g. `a, b, c, ..x`
  - Arrays and Memory locations:  upper case letters, e.g., `A, B, C, ..X`
  - Literals and Immediate values:  `imm`
  - Registers:  a word prefix with a dollar, e.g., $zero
  - Metasymbol: a word enclosed in braces, e.g., {loop}


### Equations and the Null Statement

  | TAC Equations                 | MIPS Native Instructions  |
  |-------------------------------|---------------------------|
  | `;`                           | `nop`                     |
  | `x = imm;`                    | `li x, imm`               |
  | `x = - imm;`                  | `subi x, $zero, imm`      |
  | `x = - a;`                    | `sub  x, $zero, a`        |
  | `x = a;`                      | `move x, a`               |
  | `x = a + b;`                  | `add  x, a, b`            |
  | `x = a - b;`                  | `subi x, a, b`            |
  | `x = a + imm; `               | `addi x, a, imm`          |
  | `x = a - imm; `               | `subi, a, imm`            |
  | `x = imm - a; `               | `li x, imm`               |
  |                               | `sub x, x, a`             |


  | TAC Mathematical Shortcuts    | MIPS Native Instructions  |
  |-------------------------------|---------------------------|
  | `x++;`                        | `addi x, x, 1`            |
  | `x--;`                        | `subi x, x, 1`            |
  | `++x;`                        | `addi x, x, 1`            |
  | `--x;`                        | `subi x, x, 1`            |
  | `x = a * 2;`                  | `sll x, a, 1`             |
  | `x = a / 2;`                  | `sra x, a, 1`             |


  | TAC Bitwise Equations         | MIPS Native Instructions  |
  |-------------------------------|---------------------------|
  | `x = ~ a;`                    | `nor x, a, $zero`         |
  | `x = a | b;`                  | `or x, a, b`              |
  | `x = a & b;`                  | `and x, a, b`             |
  | `x = a ^ b;`                  | `xor x, a, b`             |
  | `x = a & imm;`                | `andi x, a, imm`          |
  | `x = a | imm;`                | `ori x, a, imm`           |
  | `x = a ^ imm;`                | `xori x, a, imm`          |

  | `x = a & ~b`                  | `xor x, a, b`             | BIC x, a, b
  |                               | `and x, x, a`             |
  | `x = a & ~imm`                |                           |


  | TAC Shift Equations           | ARM Native Instructions   |
  |-------------------------------|---------------------------|
  | `x = a >>> imm;`              | `srl x, a, imm`           |
  | `x = a >> imm;`               | `sra x, a, imm`           |
  | `x = a << imm;`               | `sll x, a, imm`           |
  | `x = a >>> b;`                | `srlv x, a, b`            |
  | `x = a >> b;`                 | `srav x, a, b`            |
  | `x = a << b;`                 | `sllv x, a, b`            |


  | TAC Mult / Div Equations      | MIPS Native Instructions  |
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

  | TAC Mult / Div Equations      | MIPS Psuedo Instructions  |
  |-------------------------------|---------------------------|
  | `x = a * b;`                  | `mul x, a, b`             |
  | `x = a / b;`                  | `div x, a, b`             |
  | `x = a % b;`                  | `rem x, a, b`             |


  | TAC Array Equations           | MIPS Native Instructions  |
  |-------------------------------|---------------------------|
  | `p = & A;`                    | `la p, A`                 |
  | `x = (* p);`                  | `lb x, 0(p)`              |
  | `(* p) = x;`                  | `sb x, 0(p)`              |
  |                               |                           |
  |                               |                           |
  | `x = A[v];`                   | `la p, A`                 |
  |                               | `add p, p, v`             |
  |                               | `lb x, 0(p)`              |

  |                               |                           |
  | `A[v] = x;`                   | `la p, A`                 |
  |                               | `add p, p, v`             |
  |                               | `sb x, 0(a)`              |
  |                               |                           |
  | `x = A[imm];`                 | `la p, A`                 |
  |                               | `lb x, imm(p)`            |
  |                               |                           |
  | `A[imm] = x;`                 | `la p, A`                 |
  |                               | `sb x, imm(p)`            |


  | TAC Auto Indexing Equations   | MIPS Native Instructions  |
  |-------------------------------|---------------------------|
  | `x = A[v++];`                 | `la p, A`                 |
  |                               | `add p, p, v`             |
  |                               | `addi v, v, 1`            |
  |                               | `lb x, 0(p)`              |
  |                               |                           |
  |                               |                           |
  | `x = A[++v];`                 | `addi v, v, 1`            |
  |                               | `la p, A`                 |
  |                               | `add p, p, v`             |
  |                               | `lb x, 0(p)`              |
  |                               |                           |
  |                               |                           |
  | `x = (* p++)`                 | `lb x, 0(p)`              |
  |                               | `addi p, p, 1`            |
  |                               |                           |
  | `x = (* ++p)`                 | `addi p, p, 1`            |
  |                               | `lb x, 0(p)`              |


test and set  // TEQ & TST

### Subroutine 

  | TAC Subroutine                | MIPS Native Instructions  |
  |-------------------------------|---------------------------|
  | `return a;`                   | `move $v0, a`             |
  |                               | `jr $ra`                  |
  | `return imm;`                 | `li $v0, imm`             |
  |                               | `jr $ra`                  |


### Control Flow
  - Standarized Labels
    * {cons}: the consequence block for an if-then-else statement
    * {alt}:  the alternative block for an if-then-else statement
    * {test}: the conditional expressions associated with a statement
    * {body}: the body of a control-flow statement
    * {next}: the last original body of a control flow statement
    * {done}: the statement after a control-flow statement


    | TAC Control Flow                  | MIPS Instructions          |
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

    1. Single Conditional Statements

    | TAC Control Flow                  | MIPS Instructions          |
    |-----------------------------------|----------------------------|
    | `if (a <cond> b) break label;`    | `b<cond> a, b, {done}`     |
    | `if (a <cond> b) continue label;` | `b<cond> a, b, {next}`     |


    * Note: we presume that the original Java code does not include
      any "continue" statements. See appendix for proper treatment.


    | `TAC <cond>` | `MIPS <cond>` | `MIPS <! cond>` |`TAC <! cond>` |
    |:------------:|:-------------:|:---------------:|:-------------:|
    | `<`          | `lt`          | `ge`            |  `>=`         |
    | `<=`         | `le`          | `gt`            |  `>`          |
    | `!=`         | `ne`          | `eq`            |  `==`         |
    | `==`         | `eq`          | `ne`            |  `!=`         |
    | `>=`         | `ge`          | `lt`            |  `<`          |
    | `>`          | `gt`          | `le`            |  `>=`         |
   

### MIPS Memory and Stack Operations

  1. MIPS Stack Routines

    | Java TAC                      | MIPS Macro                |
    |-------------------------------|---------------------------|
    | `mips.push(a);`               | `push a`                  |
    | `a = mips.pop();`             | `pop a`                   |

 

### MIPS OS Interface
  1. Java Usage
     - Standard Approach
       ```
       X = method(...);
       ```
     - Revised Approach to Map to MIPS
       ```
        mips.method();
        X = mips.retval();
        ```

    | Java TAC                      | MIPS Instruction          |
    |-------------------------------|---------------------------|
    | `X = mips.retval();`          | `move X, $v0`             |


  1. MIPS Output Routines
     - See print_routines.md for a full list

    | Java TAC                      | MIPS Macros               |
    |-------------------------------|---------------------------|
    | `mips.print_d(a);`            | `print_d(a)`              |
    | `mips.print_di(imm);`         | `print_di(imm)`           |


  1. MIPS Input Routines

    | Java TAC                      | MIPS Macros               |
    |-------------------------------|---------------------------|
    | `mips.read_d();`              | `read_d()`                |
    | `mips.read(fd, buff, imm);`   | `read(fd, buff, imm)`     |


  1. MIPS Supplemental Routines
    | `mips.sbrk(size);`            | `sbrk(size)`              |
    | `mips.sbrki(imm);`            | `sbrki(imm)`              |

    | `A = mips.sbrk(size);`        | `sbrk(size)`              |
    |                               | `move A, $v0`             |

    | `A = mips.sbrki(imm);`        | `sbrki(imm)`              |
    |                               | `move A, $v0`             |


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



