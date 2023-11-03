# COMP122 Lecture Notes: November 06, 2023

## Announcements:
   1. Update on {java, mips}\_subroutine
      - Recall: -S option  (String)
        - Program uses the "duck" real of input
          * If it looks like a duck, sounds like a duck, walks like a duck -- its a duck.
          * The following all look like numbers:  1456234, "1456234", "1 456 234"
          * The following all look like strings:  string, "a string", 14_item
        - To force your input to be strings even if it looks like a number, use the -S option   

        ```bash
        java_subroutine hello  "This is my string"
        java_subroutine -S hello  "2# 1001 1111 1001 0001"     # treated as string
        java_subroutine hello  "2# 1001 1111 1001 0001"        # The number: 40849
        ```
      - New:  -L option  (Load/Link)
        - Program presumes your method is in a file call {method}.j
        - Prevents unit-testing of other methods within the same file
        - To define the name of the file to be loaded, use the -L option
        ```bash
        echo 0 | java_subroutine -L bits2int.j get_bit 
        ```

  1. Validating your paperlike submission
     - recall you must craft your submission so:
       1. the rendering of your  submission.md file is correct ({open,start} submission.md)
       1. the text formating of your submission.md file is correct (subl submission.md)
       1. you have correctly associated your responses with response tags/blocks

     - recall you should be using `make` to review your submission 
       ```bash
       make
       "submission.md" is missing
       make: *** [validate_submission] Error 1
       ```
     - A make target of 'response_key:' has been created 
       ```bash
       make response_key
       ---------------------------------
       The following are your responses:
     
       /bin/bash: submission.md: No such file or directory
       make: *** [response_key] Error 1
       ```

     - The output following "The following are your responses:"  is what I compare to the answer key for grading.


## Today's Agenda:
   1. Syscalls for reading aggreate data

   1. Multiplication



## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am

   * T/R @ 9:00 am


---
# Today's Lecture Material

   1. Syscalls for reading aggreate data
      -  bytes_read = read_s(buffer, bytes_requested)
      -  bytes_read = read(fd, buffer, bytes_requested)

  1. Multiplication
     - Issues:
       1. Overflow: 
          - Consider: 127 * 127 = 16,129 
            ```java java/mult_size.j
            public static int mult_size() {
               byte a = 127;
               byte b = 127;
               
               byte c = a * b;
               return c;
            }   
            ``` 
          - java_subroutine mult_size
            ```
            mult_size.j:5: error: incompatible types: possible lossy conversion from int to byte
            ```
      
          - Recall: 
            - `byte`  valid range:    -128 to    127  | max 2^7-1
            - `short` valid range: -32,768 to 32,767  | max 2^15 -1

       1. Execution Time:
          - Successive Additions
            - java_subroutine mult_loop a b



            ```java java/mult_loop.j
            public static int mult_loop(int a, int b) {
            
                 int $v0 = 0;
                 for(int i = 1 ; i <= b; i++){
            add:       $v0 = $v0 + a;
                 }
                 return $v0;
            }
            ```
          - Notice line: `add` above
            - It is executed `b` times.

  1. Long Multiplication: Base 10
     - View the number as an array of digits;
     
     ```java java/long_mult.j
     public static int long_mult(int a, int b){
       int[] B = digits(b);

       int sum = 0;
       for (int d = 0 ; d < B.length ; d ++ ) {
         sum += a * B[d];
         a = a * 10 ;
       }
       return sum;
     }
     ```

     ```bash
     cd java
     java_subroutine long_mult 23 10
     ```

  1. Long Multiplication: Base 2
     - Leverage:
       - x * 0 == 0
       - x << 1 ==  x * 2
       - x >>> 1 == x / 2

     ```java java/long_mult_bin
     public static int long_mult_bin(int a, int b){
       int[] B = binary_digits(b);
     
       int sum = 0;
       for (int d = 0 ; d < 32 ; d ++ ) {
         if (B[d] == 1) {
           sum += a;
         }
         a = a << 1;
       }
       return sum;
     }
     ```
     ```bash
     cd java
     java_subroutine long_mult_bin 23 10
     ```

  1. Long Multiplication: Base 2
     - View the register as a stack

     ```java java/multiplication.j
     public static int multiplication(int a, int b){
       // Algorithmic Complexity: O(word_size)

       int sum = 0;
       int bit = 0;

       for (; b != 0 ; ) {
         // pop off a bit from b
         bit = b & 0x01;  
         b = b >>> 1;

         if ( bit == 1 ) {
           sum += a;
         }
         a = a << 1;
       }
       return sum;
     }
     ```

     ```bash
     cd java
     java_subroutine multiplication 23 10
     ```


  1. Specialized Hardware (Mult/Add unit)
     - native instructions 
       - mul $t0, $t1
       - div $t0, $t1
       - madd $t0, $t1
         *  `a*x + b*x + c*x` 
     - pseudo instructions
       - mult, div, rem, etc.

# Today's Lab Material

  1. Makefile for 44-nextInt
  1. Branches




---
## Resources


---
<!-- This section for student's to place their own notes. -->
<!-- This section will not be updated by the Professor.   -->

## Notes  


