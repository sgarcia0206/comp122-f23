# COMP122 Lecture Notes: September 4, 2023

## Announcements:
   1. No class on Monday September 4, 2023


## Today's Agenda:
   1. Review / Questions
      - List of CLI Commands
   1. Models of Computation and Communication


## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am

   * T/R @ 9:00 am


## Review from Last-time:

   1. List of CLI commands
     ```bash
     cd
     chsh
     cp, mv    # cp A /tmp/B
     echo
     git
     git add
     git clone
     git commit
     git config --global --list
     git config --list
     git log
     git push
     git status
     git branch
     git checkout
     ls
     mars
     mips_subroutine
     mkdir, rmdir, rm -r
     open                   # start
     pbcopy                 # clip
     pwd
     source
     ssh
     ssh-keygen
     subl
     touch, rm
     ```

---
# Today's Lecture Material
  1. Updates to support Ubuntu within Windows/WSL
     - see revised setup.md file
  1. Made sure everyone is up-to-speed
     - The command line
     - Your comp122 environment
     - Walking through the logistics of git & assignments


# Today's Lab Material
  1. Install MIPS syntax package into sublime
    - "Install Package Control"
       * cmd+shift+p  or Windows+shift+p or Ctrl+shift+p
       * Install Package Control
     - Install mips syntax
       * cmd+shift+p or Windows+shift+p
       * Package Control: Install Package 
       * mips-syntax


  1. PEMDAS and Three Address code
  1. Assignment:
     1. Given equation
        ```
        4 * a + b^2  - 4 * a * b / a
        ----------------------------
            2 * b
        ```
     1. Rewrite into a single linear expression
     1. Rewrite into a single linear equation that contains the operators: () * / + -
     1. Define a linear equation of the form $v0 = linear expression
     1. Rewrite into a linear equation into a series of equations 
        - Each equation must for of one of the following forms:
          *  temp = constant;
          *  temp = variable;
          *  temp = variable + variable;
          *  temp = variable - variable;
          *  $v0 = temp;

       - you are given a set of local variabes:  $t1, $t2, $t3, .. $t9, $v0
       - each variable can can be defined once
       - place the final value into $v0

     1. Write a java subroutine using the following template to compute the value of $v0

     ```java

     public static int equation(int a, int b) {
        int $v0;
        int $t0;
        int $t1;
        int $t2;
        int $t3;
        int $t4;
        int $t5;
        int $t6;
        int $t7;

        // Insert your series of equations that define $v0 after this line

        // 
        return $v0;
     }
     ```

       * Requirements
         - delete all unnecessary lines
         - ensure proper formating
         - ensure your code complies with `j-subroutine`

    1. Use `java_subroutine to fill in the following table`

       | a     | b    |  $v0 |
       |-------|------|------|
       |   0   |  0   |      |   `j_subroutine equation 0 0`
       |   0   |  1   |      |   `j_subroutine equation 0 1`
       |   0   |  2   |      |   `j_subroutine equation 0 2`
       |   1   |  0   |      |   `j_subroutine equation 1 0`
       |   1   |  1   |      |   `j_subroutine equation 1 1`
       |   1   |  2   |      |   `j_subroutine equation 1 2`
       |   2   |  0   |      |   `j_subroutine equation 2 0`
       |   2   |  1   |      |   `j_subroutine equation 2 1`
       |   2   |  2   |      |   `j_subroutine equation 2 2`
      

---
## Resources
   * bin/j_subroutine: a tool used to perform unit testing on a "j" subroutine

---
## Notes
<!-- This section is for students to place their notes -->


