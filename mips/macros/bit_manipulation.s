
.macro bic(%rd, %rs, %mask)   # Bit Clear -- Native in ARM
                li $at, %mask
                nor $at, $at, $zero
                and %rd, %rs, $at
.end_macro  


.macro pos_msb(%counter, %value)
                                                #        s1 === number
                li %counter, 0                  #        counter = 0;
                move $s1, %value                #        number = %value;
        loop:   beq $s1, $zero, done            # loop:  for(; number != zero ;) {
                  addi %counter, %counter, 1    #           counter ++
                  srl $s1, $s1, 1               #           number = number >> 1;
                b loop                          #           break loop;
                                                #        }
        done:   nop                             # done:  nop
                move $v0, %counter              #        $v0 = counter;
.end_macro

