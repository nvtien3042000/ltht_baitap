.model small
.stack
.data

    so dw 0 
    tmp dw ?  
    tong dw 0
    bien16 dw 10 
    nl db 10,13,'$' 
    tb1 db 'khong phai la so hoan hao!$'
    tb2 db ' la so hoan hao!$'

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
            mov cx,ax
            
        laptinh:
            sub cx,1 
            mov ax,tmp  
            cmp cx,0
            je thoat_tinh
            xor dx,dx
            div cx
            cmp dx,0
            jne laptinh
            add tong,cx
            jmp laptinh
           
        thoat_tinh:    
            ret
    tinhtong endp

    main proc
        mov ax,@data
        mov ds,ax
        
        call nhap
        mov ax,bx
        mov tmp,ax 
        call tinhtong
        
        lea dx,nl
        mov ah,09
        int 21h
        
        mov ax,tmp
        cmp ax,tong
        je next
        mov ah,09
        lea dx,tb1
        int 21h
        jmp exit
    next:
        call inso
        
        mov ah,09
        lea dx,tb2
        int 21h   
    exit:    
        mov ah,4ch
        int 21h
           
    main endp
    end main