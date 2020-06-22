
.model small
.stack
.data
    so dw 0    
    bien dw 0
    bien16 dw 10
    count dw 0 
    nl db 10,13,'$'
.code
    
    nhap proc
            mov so,0
        nhapso:
            mov ah,01
            int 21h
            xor ah,ah
            cmp ax,32
            je thoat
            cmp ax,13
            je tinh  
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

    main proc
        mov ax,@data
        mov ds,ax
        
        xor cx,cx
    lapnhap:
        call nhap
        add bien,bx
        inc count
        jmp lapnhap
    tinh:
        add bien,bx
        inc count
        xor dx,dx
        mov ax,bien
        div count
        
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