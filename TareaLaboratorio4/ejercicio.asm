org	100h

section .data

;code
;Creando arreglo
adata	db	1,2,3,4,5,6,7,8,9,10,0xA
len     equ  $-adata
section .text

; llamando función

call IsitPair


exit:
int	20h

IsitPair:
    xor BX, BX
    xor SI, SI
	xor CX, CX
    mov BL,2d
for: 
	xor AX, AX
	mov	AL, [adata+SI]
	cmp	AL, 0xA
	je	exit
	div	BL
	cmp	AH, 0d
	je	ispair
	jmp	isnotpair
ispair:	
	mov	AL, [adata+SI]
    mov [SI+300h],AL
    inc SI
    jmp for
isnotpair:
	mov	AL, [adata+SI]
    mov [SI+320h],AL
    inc SI
    jmp for