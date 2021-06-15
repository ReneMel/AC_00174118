org 100h

    section .text
    xor AX, AX
    xor SI, SI
    xor BX, BX
    xor CX, CX
    xor DX, DX
    xor DI, DI

    MOV SI, 0d
    MOV DI, 0d
    MOV BL, 1d

    MOV DH, 10
    MOV DL, 20

    ;size of names
    MOV byte [200h],5d
    MOV byte [201h],9d
    ;size of lastnames
    MOV byte[202h],17d
    MOV byte[203h],25d 


    call modotexto

    ITERAR:
    
        call movercursor 
        MOV CL, [cadena+SI] 
        call escribircaracter
        INC SI 
        INC DL
        CMP BL,[200h+DI]
        je saltarfila
        INC BL
        JMP ITERAR 
        

    modotexto: 
        MOV AH, 0h 
        MOV AL, 03h 
        INT 10h
        RET
    movercursor:
        MOV AH, 02h 
        MOV BH, 0h 
        INT 10h
        RET
    escribircaracter:
        MOV AH, 0Ah 
        MOV AL, CL 
        MOV BH, 0h 
        MOV CX, 1h 
        INT 10h
        RET
    
    saltarfila:
        CMP BL, 25d
        je  esperartecla
        INC DH
        INC SI
        INC DI
        INC BL
        MOV DL,20
        jmp ITERAR


    esperartecla:
        MOV AH, 00h
        INT 16h
    exit:
        int 20h



    section .data

    cadena DB 'Diego Rene Melendez Alvarado'
    