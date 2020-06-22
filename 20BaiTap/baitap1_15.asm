.model small
.stack
.data
    so dw 0    
    bien16 dw 10 
    nl db 10,13,'$'

.code

    inso proc 
        xor cx,cx
        lapchia:   
            cmp ax,0
            je lapdoc
            xor dx,dx
            div bien16
            push dx  
            inc cx
            jmp lapchia
            
        lapdoc:
            xor dx,dx
            pop dx
            add dx,30h
            mov ah,02
            int 21h 
            loop lapdoc   
            
            ret  
    inso endp
    
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,01
        int 21h
        xor ah,ah 
        sub al,30h
        mov cx,ax
        mov ax,1
        xor ch,ch
    giaithua:
        mul cx 
        mov so,ax
        loop giaithua
        mov bx,ax  
        
        mov ah,09
        lea dx,nl
        int 21h  
        
        mov ax,bx
        call inso
        
        mov ah,4ch
        int 21h
             
    main endp
    end main