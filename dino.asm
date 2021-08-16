.model small
.stack
.data

BUFFER DB 512 DUP('$')
fname db "FILE.txt",0
msg db " WELCOME! DINO BOT GAME! PLAY AND BE HAPPY!",'$'
score db " SCORE: $"

mclick db 0
boxcordx db ?
boxcordy db ?
.code
main proc

mov ax,@data
mov ds,ax
;background

mov ah,6h
mov bh,0000000b
mov ch,0
mov cl,0
mov dh,30
mov dl,100
int 10h

mov ah,6h
mov al,3
mov bh,27h
mov ch,6
mov cl,32
mov dh,8
mov dl,42
int 10h


mov ah,2
mov bh,0
mov dh,7
mov dl,35
int 10h


mov ah,2
mov dl,'P'
int 21h
 
mov ah,2
mov dl,'l'
int 21h

mov ah,2
mov dl,'a'
int 21h

mov ah,2
mov dl,'y'
int 21h


mov ah,6h
mov al,3
mov bh,27h
mov ch,10
mov cl,28
mov dh,12
mov dl,45
int 10h


mov ah,2
mov bh,0
mov dh,11
mov dl,32
int 10h


mov ah,2
mov dl,'I'
int 21h
 
mov ah,2
mov dl,'n'
int 21h

mov ah,2
mov dl,'s'
int 21h

mov ah,2
mov dl,'t'
int 21h

mov ah,2
mov dl,'r'
int 21h

mov ah,2
mov dl,'u'
int 21h

mov ah,2
mov dl,'c'
int 21h

mov ah,2
mov dl,'t'
int 21h

mov ah,2
mov dl,'i'
int 21h

mov ah,2
mov dl,'o'
int 21h

mov ah,2
mov dl,'n'
int 21h


mov ah,6h
mov al,3
mov bh,27h
mov ch,14
mov cl,32
mov dh,16
mov dl,42
int 10h


mov ah,2
mov bh,0
mov dh,15
mov dl,35
int 10h


mov ah,2
mov dl,'E'
int 21h
 
mov ah,2
mov dl,'x'
int 21h

mov ah,2
mov dl,'i'
int 21h

mov ah,2
mov dl,'t'
int 21h

l5:

mov ax,1
int 33h
mov ax,2
int 33h
mov ax,3h
int 33h
mov mclick,bl
cmp mclick,1
jne l5

mov boxcordx,cl
mov boxcordy,dl

cmp boxcordx,1
ja L1
jmp C2
L1:
cmp boxcordx,83
jb L2
jmp C2
L2:
cmp boxcordy,48
ja L3
jmp C2
L3:
cmp boxcordy,71
jb L4
jmp C2
L4:
jmp Play

C2:
cmp boxcordx,0
ja C21
jmp C3
C21:
cmp boxcordx,110
jb C22
jmp C3
C22:
cmp boxcordy,80
ja C23
jmp C3
C23:
cmp boxcordy,103
jb C24
jmp C3
C24:
jmp Instructions

C3:
cmp boxcordx,1
ja C31
jmp L5
C31:
cmp boxcordx,83
jb C32
jmp L5
C32:
cmp boxcordy,112
ja C33
jmp L5
C33:
cmp boxcordy,135
jb C34
jmp L5
C34:
jmp Exit

mov ah,4ch
int 21h

Play:
    MOV AX,0600H    ;06 TO SCROLL & 00 FOR FULLJ SCREEN
    MOV BH,07H    ;ATTRIBUTE 7 FOR BACKGROUND AND 1 FOR FOREGROUND
    MOV CX,0000H    ;STARTING COORDINATES
    MOV DX,184FH    ;ENDING COORDINATES
    INT 10H



call dino
       
mov ah,4ch
int 21h


Instructions:

;;; CALLING FUN OF INSTRUCTIONS ;;;

call fun


Exit:
    MOV AX,0600H    ;06 TO SCROLL & 00 FOR FULLJ SCREEN
    MOV BH,07H    ;ATTRIBUTE 7 FOR BACKGROUND AND 1 FOR FOREGROUND
    MOV CX,0000H    ;STARTING COORDINATES
    MOV DX,184FH    ;ENDING COORDINATES
    INT 10H

mov ah,2
mov bh,0
mov dh,17
mov dl,0
int 10h

mov ah,2h
mov dl,'e'
int 21h
       
mov ah,4ch
int 21h

main endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   INSTRUCTIONS PROC ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

fun proc





mov ah, 3dh ; Load File Handler and store in ax
mov dx, offset fname ; Load address of String “file”
mov al, 0 ; Open file (read-only)
int 21h
; Reading file:
; mov cx,lengthof BUFFER
mov bx,ax ; Move file Handler to bx
mov dx, offset BUFFER
mov ah, 3fh ; Interrupt to read file
int 21h
;background
mov ah,6h
mov al,00h
mov bh,0110000b
mov ch,0
mov cl,0
mov dh,100
mov dl,100
int 10h




mov dl,5
mov dh,5
mov bh,0
mov ah,02h
int 10h



mov si,offset BUFFER
mov cx,300
l1:
mov ah,2
mov dl,[si]
int 21h
inc si
loop l1




mov ah,4ch
int 21h

ret


fun endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  PLAY FUNCTION ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

dino proc
 
    mov ah,06h
    mov bh,0000000b
    mov ch,0
    mov cl,0
    mov dh,100
    mov dl,100
    int 10h
    
    ;white box
    mov ah,06h
    mov al,15
    mov bh,01110000b
    mov ch,6
    mov cl,0
    mov dh,19
    mov dl,80
    int 10h


;border
    mov ah,06h
    mov al,1
    mov bh,70
    mov ch,20
    mov cl,0
    mov dh,20
    mov dl,80
    int 10h
;end border
     mov ah,06h
    mov al,3
    mov bh,10111111b
    mov ch,21
    mov cl,0
    mov dh,23
    mov dl,80
    int 10h

    ;Score
    mov ah,06h
    mov al,3
    mov bh,00100000b
    mov ch,2
    mov cl,60
    mov dh,4
    mov dl,75
    int 10h

    mov dl,61
     mov  dh, 3  ;Row
    mov  bh, 0    ;Display page
    mov  ah, 02h  ;SetCursorPosition
    int  10h
    mov dx,offset score
    mov ah,9
    int 21h
    


;msg
    mov dl,17
     mov  dh, 22   ;Row
    mov  bh, 0    ;Display page
    mov  ah, 02h  ;SetCursorPosition
    int  10h
   mov dx,offset msg
    mov ah,9
    int 21h

   mov  dh, 25   ;Row
    mov  bh, 0    ;Display page
    mov  ah, 02h  ;SetCursorPosition
    int  10h


;head
    mov al,2
    mov bh,01100000b
    mov ch,13
    mov cl,4
    mov dh,17
    mov dl,9
    mov ah,06h
    int 10h

    ;neck
    mov al,1
    mov bh,10100000b
    mov ch,17
    mov cl,8
    mov dh,18
    mov dl,8
    mov ah,06h
    int 10h

    mov al,1
    mov bh,10100000b
    mov ch,17
    mov cl,5
    mov dh,18
    mov dl,5
    mov ah,06h
    int 10h

    ;left red
    mov al,1
    mov bh,70
    mov ch,14
    mov cl,2
    mov dh,17
    mov dl,3
    mov ah,06h
    int 10h

    ;right red
    mov al,1
    mov bh,70
    mov ch,14
    mov cl,10
    mov dh,17
    mov dl,11
    mov ah,06h
    int 10h


;body
    mov al,2
    mov bh,01100000b
    mov ch,12
    mov cl,4
    mov dh,18
    mov dl,9
    mov ah,06h
    int 10h

    ;legs 
    mov al,0
    mov bh,10100000b
    mov ch,19
    mov cl,4
    mov dh,19
    mov dl,5
    mov ah,06h
    int 10h

    mov bh,10100000b
    mov ch,19
    mov cl,8
    mov dh,19
    mov dl,9
    mov ah,06h
    int 10h

    ;hurdles

    ;1
    mov al,3
    mov bh,70
    mov ch,17
    mov cl,25
    mov dh,19
    mov dl,25
    mov ah,06h
    int 10h

    mov al,0
    mov bh,70
    mov ch,18
    mov cl,22
    mov dh,18
    mov dl,24
    mov ah,06h
    int 10h

    mov al,3
    mov bh,70
    mov ch,16
    mov cl,22
    mov dh,18
    mov dl,22
    mov ah,06h
    int 10h

    mov al,0
    mov bh,70
    mov ch,18
    mov cl,25
    mov dh,18
    mov dl,27
    mov ah,06h
    int 10h

    mov al,3
    mov bh,70
    mov ch,16
    mov cl,27
    mov dh,18
    mov dl,27
    mov ah,06h
    int 10h

    ;2
    
    mov al,3
    mov bh,70
    mov ch,17
    mov cl,70
    mov dh,19
    mov dl,70
    mov ah,06h
    int 10h

    mov al,0
    mov bh,70
    mov ch,18
    mov cl,67
    mov dh,18
    mov dl,69
    mov ah,06h
    int 10h

    mov al,2
    mov bh,20
    mov ch,16
    mov cl,66
    mov dh,18
    mov dl,66
    mov ah,06h
    int 10h

    mov al,0
    mov bh,70
    mov ch,18
    mov cl,70
    mov dh,18
    mov dl,71
    mov ah,06h
    int 10h

    mov al,3
    mov bh,20
    mov ch,16
    mov cl,72
    mov dh,18
    mov dl,72
    mov ah,06h
    int 10h

    ;3

     mov al,0
    mov bh,70
    mov ch,7
    mov cl,45
    mov dh,8
    mov dl,48
    mov ah,06h
    int 10h

    mov al,0
    mov bh,40
    mov ch,7
    mov cl,48
    mov dh,7
    mov dl,50
    mov ah,06h
    int 10h

     mov al,0
    mov bh,60
    mov ch,8
    mov cl,48
    mov dh,8
    mov dl,50
    mov ah,06h
    int 10h

    


ret 
dino endp

end 
