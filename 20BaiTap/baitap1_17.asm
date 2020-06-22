.model small
.stack
.data 
    nl db 10,13,'$'
.code
        
    main proc
        mov ax,@data
        mov ds,ax
        
        xor cx,cx
    lapnhap:
        mov ah,01
        int 21h
        xor ah,ah
        cmp ax,13
        je next
        push ax 
        inc cx
        jmp lapnhap
    next:    
        mov ah,09
        lea dx,nl
        int 21h
    doc:
        xor dx,dx
        pop dx
        mov ah,02
        int 21h
        loop doc            
                
        mov ah,4ch
        int 21h
                
    main endp
    end main