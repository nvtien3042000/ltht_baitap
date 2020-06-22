.model small
.stack
.data

    so dw 0    
    so1 dw ? 
    so2 dw ?
    bien16 dw 16 
    nl db 10,13,'$'

.code  
    
    nhap proc
    
        nhapso:
            mov ah,01
            int 21h
            xor ah,ah
            cmp ax,13
            je thoat
            cmp ax,40h
            jg chu
            sub ax,30h
            jmp next
        chu:  
            sub ax,37h;thanh he hex
            
        next:    
            mov bx,ax
            mov ax,so
            mul bien16
            xor bh,bh
            add ax,bx
            mov so,ax
            jmp nhapso
        
        thoat:
            mov bx,so
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
        
        lea dx,nl
        mov ah,09
        int 21h
        
        mov so,0
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
        
        mov ah,4ch
        int 21h
        
        
    main endp
    end main