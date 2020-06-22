.model small
.stack
.data
    mangHOA db 30,?,30 DUP('$')     
    mangTHUONG db 30,?,30 DUP('$')
    mang db 30,?,30 DUP('$')  
    nl db 10,13,'$'
    
.code
    main proc
        mov ax,@data
        mov ds,ax
         
        lea di,mangHOA
        lea si,mangTHUONG
        lea bx,mang
        xor cx,cx
    lap:    
        
        mov ah,01h
        int 21h
        mov [bx],al 
        cmp al,13
        je thoat 
        
        cmp al,'A'
        jl binhthuong
        
        cmp al,'z'
        jg binhthuong
        
        cmp al,'a'
        jge HOA   
        
        cmp al,'Z'
        jle THUONG 
        
        
        jmp lap 
        
     binhthuong:
        mov [si],al
        inc si
        
        mov [di],al
        inc di
        
        inc cx
        jmp lap  
        
     HOA:  
        mov [si],al
        inc si
        
        sub al,32
        mov [di],al
        inc di
        inc cx
        jmp lap
        
     THUONG: 
        mov [di],al
        inc di
     
        add al,32
        mov [si],al
        inc si
        inc cx
        jmp lap    
        
     thoat:
        mov ah,09
        lea dx,nl
        int 21h
        
        mov ah,09
        lea dx,mangHOA
        int 21h 
         
        mov ah,09
        lea dx,nl
        int 21h
        
        mov ah,09
        lea dx,mangTHUONG
        int 21h
        
        mov ah,4ch
        int 21h
    main endp
    end main