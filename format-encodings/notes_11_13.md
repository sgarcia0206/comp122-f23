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
   1. Associated Macros


## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am

   * T/R @ 9:00 am


---
# Today's Lecture Material

   1. Call Marco
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

 

# Today's Lab Material
  1. Review of nextInt()  ?



---
## Resources


---
<!-- This section for student's to place their own notes. -->
<!-- This section will not be updated by the Professor.   -->

## Notes  


