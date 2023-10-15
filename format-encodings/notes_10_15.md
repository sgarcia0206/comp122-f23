# COMP122 Lecture Notes: October 15, 2023

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

       Answer:             (read glyph from top to bottom)

     - Example: 0x2F

       |   v   | = |    v  | * 16 + | digit_10 | glyph |
       |------:|:-:|------:|:------:|---------:|:-----:|
       |     2 | = |     0 | * 16 + |     2    |   2   |
       |    47 | = |     2 | * 16 + |    15    |   F   |

       Answer: 0x 2F      (read glyph from top to bottom)

  1. Base 10 to Base N
     
     - Pattern

      |  number | / N -> | quotient | remainder | glyph |
      |---------|:------:|---------:|----------:|:-----:|
      |         | / N -> |          |           |       |         

       Answer:     (read glyph from top to bottom)

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
       answer:   111010110    
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


