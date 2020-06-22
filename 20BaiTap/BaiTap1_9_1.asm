.model small
.stack
.data
                                
    mangchuoi1 db 30,?,31 dup('$')
    mangchuoi2 db 30,?,31 dup('$')
    mangketqua db 30,?,31 dup('$')  
    so1 dw ?                     
    nl db 10,13,'$'
    bien10 dw 10                         
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,0Ah
        lea dx,mangchuoi1
        int 21h
        
        mov ah,09
        lea dx,nl
        int 21h

        lea di,mangchuoi1        
        xor ch,ch 
        mov cl,[di+1]       
    lapchuoiso1:    
        sub [di+2],30h
        inc di
        loop lapchuoiso1  
        
        mov ah,0Ah
        lea dx,mangchuoi2
        int 21h
        
        mov ah,09
        lea dx,nl
        int 21h

        lea di,mangchuoi2        
        xor ch,ch 
        mov cl,[di+1]       
    lapchuoiso2:    
        sub [di+2],30h
        inc di
        loop lapchuoiso2
                
        xor ax,ax
        lea di,mangchuoi1        
        mov al,[di+2]
        mov cl,[di+1]
        sub cl,1
        xor ch,ch
        
    lapso1:
        mul bien10
        add al,[di+3]
        inc di
        loop lapso1          
        mov so1,ax
                
        xor ax,ax
        lea di,mangchuoi2        
        mov al,[di+2]
        mov cl,[di+1]
        sub cl,1
        xor ch,ch
    lapso2:
        mul bien10
        add al,[di+3]
        inc di
        loop lapso2  
        
        add ax,so1
        xor cx,cx
     day_push:      
        xor dx,dx
        div bien10
        push dx 
        inc cx
        cmp ax,0
        jne day_push
            
        lea di,mangketqua 
        mov [di+1],cl
     lay_pop:
        pop dx
        add dx,30h
        mov [di+2],dl
        inc di 
        loop lay_pop
        
        lea di,mangketqua
        mov cl,[di+1]
        xor ch,ch
               
     lapdoc:
        mov dl,[di+2]
        mov ah,02
        int 21h
        inc di
        loop lapdoc
        
        mov ah,4Ch
        int 21h   
       
    main endp
    end main