# COMP122 Lecture Notes: October 16, 2023

## Announcements:

1. Assignment: binary32 
   - Status: Pre-released
   - Deliverable ID: 43-
   - Invitation URL: https://classroom.github.com/a/61ujMp63
   - Due Date: To Be Determined

      
## Today's Agenda:
   1. Conversion Between Bases
      - Wednesday: Review and then Fractional Values

   1. Binary32 Assignment
      - Review the specification: README.md
      - Makefile review
      - Time to work on the assignment


## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am
     - no question
       ```quote
       No news is bad news,
         bad news is good news,
            good news is no news.
       ```
       ```sed
         s/news/information/g
       ```
     - do a "pull request"
     - git repo-state
     - exponponent part
       - example:  + 1.00101100101  x 2^  - 1011 (11)
         1. sign: +
         1. coefficient: 1.00101100101
            1. whole:  1
            1. mantissa: 00101100101
         1. sign expon: -
         1. exponenet 1011 (11)
       - exponent encoding
         1.  - 1011 (11)
         1. add bias    ( -11 + 15 = 4)
         1. 0 0100  (4)

     - bitwise example from the homework

   * T/R @ 9:00 am


---
# Today's Lecture Material
  1. Conversion Between Bases
     - See slides: conversion-between-bases.pdf

  1. Base N to Base 10

     - Pattern:

       |   v   | = |   v   | * base + | digit_10 | glyph |
       |------:|:-:|------:|:--------:|---------:|:-----:|
       |       | = |       | * base + |          |       |

       Answer:            

     - Example: 0x2F

       |   v   | = |    v  | * 16 + | digit_10 | glyph |
       |------:|:-:|------:|:------:|---------:|:-----:|
       |     2 | = |     0 | * 16 + |     2    |   2   |
       |    47 | = |     2 | * 16 + |    15    |   F   |

       Answer: 47

     - Example:  15# 2E3
     
       |   v   | = |   v   | * 15 +   | digit_10 | glyph |
       |------:|:-:|------:|:--------:|---------:|:-----:|
       |   2   | = |   0   | * 15 +   |     2    |   2   |
       |  44   | = |   2   | * 15 +   |    14    |   E   |
       | 663   | = |  44   | * 15 +   |     3    |   3   |

       Answer: 663

     - Example: 2# 10 1011

       |   v   | = |   v   | * 2 + | digit_10 | glyph |
       |------:|:-:|------:|:-----:|---------:|:-----:|
       |    1  | = |    0  | * 2 + |    1     |   1   |
       |    2  | = |    1  | * 2 + |    0     |   0   |
       |    5  | = |    2  | * 2 + |    1     |   1   |
       |   10  | = |    5  | * 2 + |    0     |   0   |
       |   21  | = |   10  | * 2 + |    1     |   1   |
       |   43  | = |   21  | * 2 + |    1     |   1   |

       Answer: 43        

  1. Base 10 to Base N
     
     - Pattern

      |  number | / N -> | quotient | remainder | glyph |
      |---------|:------:|---------:|----------:|:-----:|
      |         | / N -> |          |           |       |         

       Answer:     (read glyph from bottom to the top)

     - Example: 470 to Base 16

      |  number | / 16 -> | quotient | remainder | glyph |
      |---------|:-------:|---------:|----------:|:-----:|
      |   470   | / 16 -> |    29    |     6     |   6   |  
      |   29    | / 16 -> |     1    |    13     |   D   |
      |   1     | / 16 -> |     0    |     1     |   1   |   
      
      Answer: 0x 1D6   

     - Example 470 to Base 2  

       ```response
       number = 470    
         470 / 2 = 235, 0
         235 / 2 = 117, 1
         117 / 2 =  58, 1
          58 / 2 =  29, 0
          29 / 2 =  14, 1
          14 / 2 =   7, 0
           7 / 2 =   3, 1
           3 / 2 =   1, 1
           1 / 2 =   0, 1
           0 / 2 =   0, -
       answer:   1 1101 0110    
       ```

    - Example 497 to Base 2  

       ```response
       number = 497    
         497 / 2 = 248, 1
         248 / 2 = 124, 0
         124 / 2 =  62, 0
          62 / 2 =  31, 0

          31 / 2 =  15, 1
          15 / 2 =   7, 1
           7 / 2 =   3, 1
           3 / 2 =   1, 1

           1 / 2 =   0, 1
           0 / 2 =   0, 0
 
       answer:   01 1111 0001  
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


