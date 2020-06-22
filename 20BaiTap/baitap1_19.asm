.model small
.stack
.data

    so dw 0    
    tong db 0
    bien16 dw 10 
    nl db 10,13,'$'

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
    
    tinhtong proc 
            xor cx,cx
        laptinh:   
            cmp ax,0
            je thoat_tinh
            xor dx,dx
            div bien16
            add tong,dl
            jmp laptinh
           
        thoat_tinh:    
            ret
    tinhtong endp

    main proc
        mov ax,@data
        mov ds,ax
        
        call nhap
        mov ax,bx  
        call tinhtong
        
        lea dx,nl
        mov ah,09
        int 21h
        
        mov al,tong     
        xor ah,ah
        call inso
        
        mov ah,4ch
        int 21h
          
    main endp
    end main