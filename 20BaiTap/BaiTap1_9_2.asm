.model small
.stack
.data
                                
    mangchuoi1 db 30,?,31 dup('$')
    mangchuoi2 db 30,?,31 dup('$')
    mangketqua db 30,?,31 dup('$')
     
    so1 dw ?                     
    nl db 10,13,'$'
    bien16 dw 10                         
.code            
    
    nhapmang proc        
        xor cx,cx
      lapnhap:  
        mov ah,01
        int 21h
        cmp al,13
        je thoatnhap
        mov [di+2],al
        inc di
        inc cx      
        jmp lapnhap
      
      thoatnhap:
        ret
    nhapmang endp
    
    doichuoiso proc 
      lapdoi:
        sub [di+2],30h
        inc di
        loop lapdoi 
        
        ret
    doichuoiso endp
    
    doiso proc
        xor ax,ax
        mov al,[di+2]
      lapnhan:
        mul bien16
        add al,[di+3]
        inc di
        loop lapnhan
        
      ret
      
    doiso endp      
        
    
    main proc
        mov ax,@data
        mov ds,ax  
        
        lea di,mangchuoi1
        call nhapmang 
        lea di,mangchuoi1
        mov [di+1],cl
        
        mov ah,09
        lea dx,nl
        int 21h
        
        lea di,mangchuoi2
        call nhapmang 
        lea di,mangchuoi2
        mov [di+1],cl
        
        lea di,mangchuoi1
        xor ch,ch
        mov cl,[di+1]
        call doichuoiso
        
        lea di,mangchuoi2
        xor ch,ch
        mov cl,[di+1]
        call doichuoiso 
        
        lea di,mangchuoi1
        xor ch,ch
        mov cl,[di+1]
        sub cl,1
        call doiso
        mov so1,ax 
        
        lea di,mangchuoi2
        xor ch,ch
        mov cl,[di+1]
        sub cl,1
        call doiso
        add ax,so1
  
        
        xor cx,cx
     day_push:      
        xor dx,dx
        div bien16
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
        
        mov ah,09
        lea dx,nl
        int 21h
               
     lapdoc:
        mov dl,[di+2]
        mov ah,02
        int 21h
        inc di
        loop lapdoc 
        
        mov ah,4ch
        int 21h

    main endp
    end main