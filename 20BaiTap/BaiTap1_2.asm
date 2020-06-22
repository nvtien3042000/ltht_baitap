.model small
.stack
.data
    msg1 DB 'Hay nhap 1 ky tu : $'  
    msg2 DB 10,13,'Ky tu vua nhap la : $' 
    
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,09h
        lea dx,msg1
        int 21h
        
        mov ah,07h
        int 21h
        
        mov bl,al
        
        mov ah,09h
        lea dx,msg2
        int 21h
        
        mov dl,bl
        
        mov ah,02h
        int 21h
        
        mov ah,4ch
        int 21h
    main endp
    end main