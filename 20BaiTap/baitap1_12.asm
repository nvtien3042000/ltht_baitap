.model small
.stack
.data

    char db ?  
    nl db 10,13,'$' 
    bien16 dw 10
    bien_hex dw 16 
    tmp dw ?

.code

    inso_bin proc 
            mov cx,8
        inso:
            mov dl,30h   
            shl bl,1
        
            adc dl,0 
        
            mov ah,2
            int 21h
            loop inso  
            ret
    inso_bin endp
    
    inso_dec proc
        
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
    inso_dec endp  
    
    inso_hex proc
        
            mov ax,tmp 
            xor dx,dx 
            xor ah,ah
            div bien_hex
             
            mov tmp,dx
            cmp ax,9
            jg inChu
            
            mov dx,ax 
            add dl,30h
            mov ah,02   
            int 21h
            inc bx        

        insau:
            mov dx,tmp
            mov ax,tmp
            cmp dl,9
            jg inChu 
            add dl,30h
            mov ah,02   
            int 21h
            jmp thoat_hex
            
        inChu:
            xor dx,dx
            div bien16
            add dl,41h
            mov ah,02
            int 21h 
            inc bx
            cmp bx,2
            je thoat_hex
            jmp insau 
            
        thoat_hex:            
           ret    
    inso_hex endp    
 
    main proc

        mov ax,@data
        mov ds,ax 
        mov cx,16
        
        mov ah,01
        int 21h
        mov char,al  
        
        mov ah,09
        lea dx,nl
        int 21h        
        
        mov bl,char 
        call inso_bin
        
        mov ah,09
        lea dx,nl
        int 21h
        
        mov al,char
        xor ah,ah
        call inso_dec 
        
        mov ah,09
        lea dx,nl
        int 21h
        
        mov al,char
        xor ah,ah
        mov tmp,ax
        call inso_hex

        mov ah,4ch
        int 21h
             
    main endp         
end main   