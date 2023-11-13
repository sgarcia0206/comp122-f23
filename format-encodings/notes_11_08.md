# COMP122 Lecture Notes: November 13, 2023

## Announcements:

   1. Exam #2: Formats & Encodings
      - November 20/21 (the day before Thanksgiving)
      - During Class time
      - Paper-like Deliverable 

   1. Exam #4: Assembly Language
      - Programming Assignment in MIPS
      - Presented on:  November 20/21  (Lab time)
      - Due on: Monday, Dec 11 23:59:59

## Today's Agenda:
   1. Subroutine
      - and associated macros

   1. ???


## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am


   * T/R @ 9:00 am


---
# Today's Lecture Material

   1. Memory Segments
      1. text
         - static, read-only, temporal locality
      1. data
         - static, read/write, spatial locality
      1. stack
         - dynamic, read/write, temporal locality
      1. heap
         - dynamic, read/write, spatial locality

   1. Cache and the "Principal of Locality"
      - browser cache
      - web cache

   1. Call Marco
      - used to transition from one subroutine to another 
      - new subroutine, new focus, new scratch space
      - from 44-nextInt

      | Java TAC                | MIPS Macro                |
      |-------------------------|---------------------------|
      | a = glyph2int(b, c);    | call glyph2int b c        |
      |                         | move a, $v0               |


      ```mips
      .macro call( %sub, %arg0, %arg1)
          save_state()
          push $a0, $a1
          move $a0, %arg0
          move $a1, %arg1
          jal %sub
          pop $a0, $a1
          restore_state()
      .end_macro
      ```

      ```mips
      glyph2int:  nop
                  ...
                  move $v0, %ret_value
                  jr $ra
      ```

   1. Subroutine
      - See Slides: assembly_programming/slide_presentation/
      - Deferred till next week.
 

# Today's Lab Material
  1. Status of Current Lab
  1. Lab Time ?
  1. Base64 Encoding



---
## Resources


---
<!-- This section for student's to place their own notes. -->
<!-- This section will not be updated by the Professor.   -->

## Notes  


