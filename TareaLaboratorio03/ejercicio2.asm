org 	100h

section 	.data

;limpiando AX, BX
xor	    AX,AX
xor	    BX,BX

;colocando valores
mov	    AX,5d
mov 	BX,1d

;factorial
Fact: 
cmp     BX,5d
je      Exit
mul     BX
inc     BX
jmp     Fact

Exit:
mov     [20Bh],AL

int	20h