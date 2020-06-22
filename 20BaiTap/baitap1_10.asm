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
            mov so,0
        lapnhap:
            mov ah,01
            int 21h 
            xor ah,ah
            cmp al,13
            je thoatnhap
            sub ax,30h
            mov bx,ax
            mov ax,so
            mul bien16
            add ax,bx
            mov so,ax
            jmp lapnhap
        thoatnhap:
            mov bx,so
            ret        
    nhap endp
    
    inso proc      
            xor cx,cx
        lap_push:  
            cmp ax,0
            je lap_pop
            xor dx,dx
            div bien16
            push dx
            inc cx
            jmp lap_push
        lap_pop:
            xor dx,dx
            pop dx
            add dx,30h
            mov ah,02
            int 21h
            loop lap_pop
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
        
        xor bx,bx
        call nhap
        mov so2,bx 
        
        mov ah,09
        lea dx,nl
        int 21h
        
        mov bx,so1    
        xor cx,cx
    chia:
        cmp bx,so2
        jl tieptuc
        sub bx,so2
        inc cx
        jmp chia
    tieptuc:    
        mov ax,cx
        call inso 
             
        mov cx,so2
        xor bx,bx
    nhan:
        add bx,so1
        loop nhan 
        
        mov ah,09
        lea dx,nl
        int 21h
        
        mov ax,bx
        call inso
        
        mov ah,4Ch
        int 21h
    main endp
    end main