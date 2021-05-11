org		100h

section		.data
; limpiando AX, BX y SI
xor AX,AX
xor	SI,SI
xor	BX,BX

; colocando valores de mi carnet
mov byte 	[200h],0d
mov byte 	[201h],0d
mov byte 	[202h],1d
mov byte 	[203h],7d
mov byte 	[204h],4d
mov byte 	[205h],1d
mov byte 	[206h],1d
mov byte 	[207h],8d


jmp 	Sum

; suma de digitos por iteración
Sum: 
cmp     SI,8d
je	    Prom	
add	    AL,[200h + SI]
inc	    SI
jmp	    Sum

;Calculando promedio
Prom: 
mov	    BX,8d
div	    BX
mov	    [20Ah], AX

int     	20h