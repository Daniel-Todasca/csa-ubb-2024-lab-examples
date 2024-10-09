bits 32
global start        
extern exit 
import exit msvcrt.dll

; EXAMPLE TASK:
; compute (x+y)^2
; use variables for declaring the values of a x and y
; 0 <= x <= 255 and 0 <= y <= 255

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    var_hello db 'Hello World!'
    
    x db 1
    y db 3
    
; our code starts here
segment code use32 class=code
    start:
        ; always clean your registers!
        mov EAX, 0
        mov ECX, 0
        
        ; AL = x
        mov AL, [x]
        ; AL = x+y
        add AL, [y]

        ; CL = AL = x+y
        mov CL, AL
        ; AX = CL*AL = (x+y)*(x+y)
        mul CL
        
        ; questions:
            ; can we simplify this code?
            ; will this code work for negative input < 0?
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
