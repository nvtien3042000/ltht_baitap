.model small
.stack
.data  
    msg DB 'Nhap ky tu : $'
    msg1 DB 10,13,'Good morning$'  
    msg2 DB 10,13,'Good Afternoon$' 
    msg3 DB 10,13,'Good everning$' 
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,09h
        lea dx,msg
        int 21h
        
        mov ah,01h
        int 21h 
        
        cmp al,'s'
        je g_morning
        cmp al,'S'
        je g_morning
        
        cmp al,'t'
        je g_afternoon
        cmp al,'T'
        je g_afternoon
        
        cmp al,'c'
        je g_everning
        cmp al,'C'
        je g_everning
        
        jmp exit;cmp ko co thi thoat ct
        
        g_morning:
            mov ah,09h
            lea dx,msg1
            int 21h
            jmp exit
        
        g_afternoon:
            mov ah,09h
            lea dx,msg2
            int 21h
            jmp exit 
            
        g_everning:
            mov ah,09h
            lea dx,msg3
            int 21h
            jmp exit
        
        exit:
            mov ah,4ch
            int 21h
    main endp
    end main