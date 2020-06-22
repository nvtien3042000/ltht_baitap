
.model small
.stack
.data
    msg1 DB 'Hay nhap 1 ky tu thuong : $' 
    msg2 DB 10,13,'Cac ky tu den <z> : $' 
    space DB ' ' 
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
        
        mov ah,09h
        lea dx,msg2
        int 21h 
        
        in_kytu: 
            mov dl,kytu
            mov ah,02h
            int 21h 
            
            mov dl,space
            mov ah,02h
            int 21h
            
            inc kytu
            
            cmp kytu,'z'
            jg exit
            
            jmp in_kytu
                    
        exit:
            mov ah,4ch
            int 21h
    main endp
    end main