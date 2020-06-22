.model small
.stack
.data
    nl db 10,13,'$' 
    so dw 0 
    so1 dw ?    
    so2 dw ?
    bien16 dw 10
.code 
    nhap proc
        
        xor bx,bx
        mov cx,16
        lapghi:
            mov ah,01
            int 21h
            sub al,30h
            shl bx,1
            add bl,al
            loop lapghi
            ret    
        
    nhap endp       
    
    inso proc        
            mov cx,16
        lapin:
            mov dl,30h
            shl bx,1
            adc dl,0
            mov ah,02
            int 21h
            loop lapin 
            ret
        
    inso endp    

    main proc
        mov ax,@data
        mov ds,ax
        
        call nhap
        mov so1,bx
        
        mov ah,09
        lea dx,nl
        int 21h
        
        call nhap
        mov so2,bx
        
        mov ah,09
        lea dx,nl
        int 21h
        
        mov bx,so1 ;add
        add bx,so2
        mov dl,30h
        adc dl,0
        mov ah,02
        int 21h
        call inso 
        
        mov ah,09
        lea dx,nl
        int 21h
        
        mov bx,so1 ;sub
        sub bx,so2
        mov dl,30h
        adc dl,0
        mov ah,02
        int 21h
        call inso 
        
        mov ah,09
        lea dx,nl
        int 21h
        
        mov bx,so1 ;and
        and bx,so2
        mov dl,30h
        adc dl,0
        mov ah,02
        int 21h
        call inso
        
        mov ah,09
        lea dx,nl
        int 21h
        
        mov bx,so1 ;or
        or bx,so2
        mov dl,30h
        adc dl,0
        mov ah,02
        int 21h
        call inso

        mov ah,4Ch
        int 21h
    main endp
    end main