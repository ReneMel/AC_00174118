
    org     100h

	section	.text
    call ModoTexto
    call MostrarMensajeInicial
    call LeerCadena
    
    call RevisarContra

    int 20h
; codigo. 

ModoTexto:
    mov     AH, 00h         
    mov     AL, 03h         
    int     10h 
    ret

MoverCursor:
    MOV AH, 01h 
    MOV BH, 0h 
    INT 10h
    RET

MostrarMensajeInicial:
    mov DX, initialmmesage
    call MostrarCadena
    ret

MostrarCadena:
    mov     AH, 09
    int     21h
    ret

LeerCadena:
    xor     SI,SI
    while: 
    call    EsperarTecla
    cmp     AL, 0X0D
    je      Exit
    mov     [300h+SI], AL ; se guarda de 300 en adelante
    inc     SI
    jmp     while

    Exit:  
    ret 



EsperarTecla: 
    mov     AH, 00h         
    int     16h 
    ret

ContraCorrecta:
    mov     DX, login
    call    MoverCursor
    call    MostrarCadena
    ret

ContraIncorrecta:
    mov     DX, loginfallido
    call    MoverCursor
    call    MostrarCadena
    ret

RevisarContra:
    xor     SI,SI
    ; revisar char por char para que la contra sea igual
    for:
    cmp     SI, 5d
    je      ContraCorrecta
    mov     BL, [password+SI]
    cmp     BL, [300h+SI]
    je      iterar
    jmp     ContraIncorrecta

iterar:
    inc     SI
    jmp     for

section .data
password        db  'NATSU'
login           db  'BIENVENIDO', "$"
loginfallido     db  'INCORRECTO', "$"
initialmmesage  db  'Ingrese Contra pls: ', "$"
