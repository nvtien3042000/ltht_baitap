.model small
.stack
.data
    msg1 DB 'Hay nhap 1 ky tu : $'  
    msg2 DB 10,13,'Ky tu ke truoc ky tu vua nhap la : $' 
    msg3 DB 10,13,'Ky tu ke sau ky tu vua nhap la : $' 
    kytu DB ?
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,09h
        lea dx,msg1
        int 21h
        
        mov ah,01h
        int 21h
        mov kytu,al
        ;ky tu truoc
        mov ah,09h
        lea dx,msg2
        int 21h
        
        mov dl,kytu
        sub dl,1
        mov ah,02h
        int 21h        
        ;ky tu sau
        mov ah,09h
        lea dx,msg3
        int 21h
        
        mov dl,kytu
        add dl,1
        mov ah,02h
        int 21h
        
        mov ah,4ch
        int 21h
    main endp
    end main
