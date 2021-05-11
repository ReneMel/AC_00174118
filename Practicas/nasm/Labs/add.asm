; r: registro   m: memoria      i: inmediato

        org     100h

        section .text


; add op1, op2
; op1(r, m) y op2(r, m, i)      excepto add m, m
; op1 <- op1 + op2

; suma usando registros
        mov     AL, 2d
        mov     BL, 6d
        add     AL, BL

; suma usando celda de memoria
        ;mov     byte[200h], AL
        ;add     byte[200h], BL


; adc op1, op2
; op1(r, m) y op2(r, m, i)      excepto adc m, m
; op1 <- op1 + op2 + carry

; suma con carry
        ; creamos un overflow de memoria
        ;mov     AL, 90h
        ;mov     BL, 90h
        ;add     AL, BL
        ; desde esta parte de la ejeccución tenemos un carry = 1
        ;mov     AX, 90h
        ;mov     BX, 90h
        ;adc     AX, BX


        int     20h