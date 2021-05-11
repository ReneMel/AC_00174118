org	100h

section		.data

;Diego René Meléndez Alvarado DRMA
mov byte	[200h], 13h 
mov byte	[201h], 72h 
mov byte	[202h], 6dh 
mov byte	[203h], 61h 

;absoluto

mov	AX, [200h]

;inderecto 

mov	BX, 201h
mov	CX, [BX]

;indirecto base mas indice

mov	SI, 1h
mov	DX, [BX+SI]

;relativo

mov	DI, [BX+2h]

int	20h