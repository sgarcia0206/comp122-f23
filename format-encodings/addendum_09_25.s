#   1. Practicum on Macros and IF Statements
#      - area of something -- review
#      - min
#      - max
#      - abs
#      - diff (difference)
# 

         .macro min(%min, %a, %b)
         
                 bgt %a, %b, alt   # if ( a <= b ) {
          cons:    nop             #    ;           
                   move %min, %a   #    min = a;
                   b next          #    // goto next;
                                   # } else {
          alt:     nop             #    ;
                   move %min, %b   #    min = b;
                   b next          #    // goto next;
                                   # }
         next:     nop             # ; 
         
         .end_macro
         

         min  $t1, $t2, $t3



# difference  

         .macro diff( %diff, %a, %b )
                 ble %a, %b, sam             # if ( A > B ){
         cons:     nop                       #   ;
                   sub %diff, %a, %b         #   diff = A - B
                   b bob                     #   // goto bob;
                                             # } else {
         sam:      nop                       #   ;
                   sub %diff, %b, %a         #   diff B - A
                   b bob                     #   // goto bob;
                                             # }
         bob:      nop                       # ; 
         .end_macro







# 
#  Area:  area of a box
#   * a =  2(l * h ) +   2(l * w) + 2* ( h * w )
#   * a =  2 ( (l * h ) + (l * w) + ( h * w ) )
# 
  
surface_box:  nop

   # a0: L
   # a1: H
   # a2: W
   # t0: l
   # t1: h
   # t2: w
   # t3: 2
   # t4: s
   # t5: x
   # t6: y
   # t7: z

   move $t0, $a0         # l = L;
   move $t1, $a1         # h = H;
   move $t2, $a2         # w = W;

   mul $t0, $t1          # x = l * h;
   mflo $t5
   
   mul $t0, $t2
   mflo $t6              # y = l * w;

   mul $t1, $t2
   mflo $t7              # z = h * w;

   add $t4, $t5, $t6     # s = x + y;
   add $t4, $t4, $t7     # s = s + z;

   li $t3, 2             # t3 = 2;        # sll $v0, $t4, 1
   mul $t3, $t4          # a =  t3 * s;   #
   mflo $v0                               #

   jr $ra







