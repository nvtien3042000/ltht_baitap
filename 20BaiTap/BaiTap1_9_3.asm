.model small
.stack
.data

    so dw 0    
    so1 dw ?
    bien16 dw 10 
    nl db 10,13,'$'
    mangketqua db 30,?,31 dup('$') 

.code  
    
    nhap proc
    
        nhapso:
            mov ah,01
            int 21h
            xor ah,ah
            cmp ax,13
            je thoat  
            sub ax,30h
            mov bx,ax
            mov ax,so
            mul bien16
            add ax,bx
            mov so,ax
            jmp nhapso
        
        thoat:
            mov bx,so
            ret
    nhap endp
    
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
        
        add bx,so1
        
        mov ax,bx
        xor cx,cx
     day_push:      
        xor dx,dx
        div bien16
        push dx 
        inc cx
        cmp ax,0
        jne day_push
            
        lea di,mangketqua 
        mov [di+1],cl
     lay_pop:
        pop dx
        add dx,30h
        mov [di+2],dl
        inc di 
        loop lay_pop
        
        lea di,mangketqua
        mov cl,[di+1]
        xor ch,ch
        
        mov ah,09
        lea dx,nl
        int 21h
        
        mov ah,09
        lea dx,[mangketqua+2]
        int 21h 
        
        mov ah,4ch
        int 21h
        
    main endp
    end main