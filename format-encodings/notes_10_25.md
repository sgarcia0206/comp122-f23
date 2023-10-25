# COMP122 Lecture Notes: October 25, 2023

## Announcements:

 
## Today's Agenda:

   1. Mathematic Review 
      - Base10
      - Reframed into Base2

   1. Practicum on UTF-8
      - decode_utf8.md



## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am
     

   * T/R @ 9:00 am


---
# Today's Lecture Material
  1. base10-mathematical-review.pdf
  1. base2-encoding-and-mathematical-operations.pdf

  1. Java's Integer Represenations:
     * `unsigned int X;` -- Nope does not have it
       - use the next size up!
     * But if it did!
       * unsigned char  | 1 byte  | 0 .. 2^8-1   | 0 to 255
       * unsigned short | 2 bytes | 0 .. 2^16 -1 | 0 .. 64K
       * unsigned int   | 4 bytes | 0 .. 2^32 -1 | 0 .. 4GB 


     * `int X;`
     * byte  | 1 byte  | -  2^7 ..  2^7 -1 | -128 to 127
     * short | 2 bytes | - 2^15 .. 2^15 -1 | -32,768 to 32,767
     * int   | 4 bytes | - 2^31 .. 2^31 -1 | -2,147,483,648 to 2,147,483,647
     * long  | 8 bytes | - 2^63 .. 2^63 -1 | 


  1. Encodings:
     1. One's complement:   ~X
     1. Two's complement:   ~X + 1

     1. 4-bit:

     | number |  unsigned  | 1's comp  | 2's comp  |
     |-------:|:----------:|:---------:|:---------:|
     |      0 |       0000 |      0000 |      0000 | 
     |        |            |           |           | 

     1. 8-bit:

     | number |  unsigned  | 1's comp  | 2's comp  |
     |-------:|:----------:|:---------:|:---------:|
     |      0 |  0000 0000 | 0000 0000 | 0000 0000 | 
     |        |            |           |           |      



    1. Binary Addition
       * 

         ```response
         x xxxx  xxxx              <!-- response: carries -->
           xxxx  xxxx              <!-- response: op1 encoding -->
         + xxxx  xxxx              <!-- response: op2 encoding -->
         ------  ----          
         y yyyy  yyyy              <!-- response: sum encoding -->

         C: ?; V: ?; S: ?; Z: ?
         ```

    1. Binary Subtraction
       * 

         ```response
         x xxxx  xxxx              <!-- response: carries -->
           xxxx  xxxx              <!-- response: op1 encoding -->
         + xxxx  xxxx              <!-- response: op2 encoding -->
         ------  ----          
         y yyyy  yyyy              <!-- response: sum encoding -->

         C: ?; V: ?; S: ?; Z: ?
         ```

# Today's Lab Material

  1. Exercise:  UTF-8 decoding
  1. Practicum: UTF-8 decoding
     - read first byte  ( read_x();)
     - read additional bytes
     - validate additional bytes
     - strip framing bits
     - merge data bits
     - output unicode index



---
## Resources

   1. Encodings: unsigned, 1's complement, 2's complement

   | #  | unsigned |   1's  |   2's  |  binary number |
   |---:|----------|--------|--------|----------------|
   | -8 |     --   |   --   |  1000  |   2# - 1000    |
   | -7 |     --   |  1000  |  1001  |   2# - 0111    |
   | -6 |     --   |  1001  |  1010  |   2# - 0110    |
   | -5 |     --   |  1010  |  1011  |   2# - 0101    |
   | -4 |     --   |  1011  |  1100  |   2# - 0100    |
   | -3 |     --   |  1100  |  1101  |   2# - 0011    |
   | -2 |     --   |  1101  |  1110  |   2# - 0010    |
   | -1 |     --   |  1110  |  1111  |   2# - 0001    |
   | -0 |     --   |  1111  |   --   |      --        |
   |  0 |    0000  |  0000  |  0000  |   2#   0000    |
   |  1 |    0001  |  0001  |  0001  |   2# + 0001    |
   |  2 |    0010  |  0010  |  0010  |   2# + 0010    |
   |  3 |    0011  |  0011  |  0011  |   2# + 0011    |
   |  4 |    0100  |  0100  |  0100  |   2# + 0000    |
   |  5 |    0101  |  0101  |  0101  |   2# + 0001    |
   |  6 |    0110  |  0110  |  0110  |   2# + 0010    |
   |  7 |    0111  |  0111  |  0111  |   2# + 0011    |
   |  8 |    1000  |   --   |   --   |   2# + 1000    |
   |  9 |    1001  |   --   |   --   |   2# + 1001    |
   | 10 |    1010  |   --   |   --   |   2# + 1010    |
   | 11 |    1011  |   --   |   --   |   2# + 1111    |
   | 12 |    1100  |   --   |   --   |   2# + 1100    |
   | 13 |    1101  |   --   |   --   |   2# + 1101    |
   | 14 |    1110  |   --   |   --   |   2# + 1100    |
   | 15 |    1111  |   --   |   --   |   2# + 1101    |



---
<!-- This section for student's to place their own notes. -->
<!-- This section will not be updated by the Professor.   -->

## Notes  


