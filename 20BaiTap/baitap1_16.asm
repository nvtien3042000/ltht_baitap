.model small
.stack
.data
    so dw 0 
    so1 dw ?  
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
        mov ax,so1
        
    UC:
        cmp ax,bx
        je next
        cmp ax,bx
        jl tru
        sub ax,bx
        jmp UC
    tru:
        sub bx,ax      
        jmp UC
        
    next:
        mov so,ax 
        mov ah,09
        lea dx,nl
        int 21h
        
        mov ax,so
        call inso    
                
        mov ah,4ch
        int 21h
                
    main endp
    end main