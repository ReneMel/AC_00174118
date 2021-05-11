        org     100h
    
        section .text
        
        ;mov     AL, 2d
        ;mov     BL, 6d
        ;add     AL, BL

        ;mov     byte[200h],AL
        ;add     byte[200h],BL


        mov     AL, 90h
        mov     BL, 90h
        adc     AL,BL



        int     20h