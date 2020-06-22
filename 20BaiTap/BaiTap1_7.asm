.model small
.stack
.data
    
    mang db 50 dup(?)
    nl db 10,13,'$'  
    tb1 db 'Nhap chuoi : $'
    tb2 db 10,13,'so ki tu trong chuoi la : $'
    count dw ?  
    bien16 dw 10
      
.code
    main proc
        mov ax,@data
        mov ds,ax 
        
        mov bx, offset mang 
        xor cx,cx;xoa thanh ghi  
        
        lea dx,tb1
        mov ah,9
        int 21h
               
    Lap:    
        mov ah,1
        int 21h
        
        mov [bx], al 
        inc cx  
        inc bx
        cmp al,13
        jne Lap  

        lea bx,mang 
         
        mov count,cx
         
        lea dx,nl
        mov ah,9
        int 21h 
        
    Lapdoc_chuoi:    
        
        mov dl,[bx]
        mov ah,2
        int 21h 
        inc bx
        loop Lapdoc_chuoi  
        
        lea dx,tb2
        mov ah,9
        int 21h
        
        mov ax,count        
        sub ax,1 ;ko tinh ky tu enter
        xor cx,cx 
           
    Lapchia:
        xor dx,dx
        div bien16
        push dx
        inc cx
        cmp ax,0          
        jne Lapchia
        
    Inso:
        pop dx
        add dx,30h
        mov ah,2
        int 21h
        loop Inso   

        mov ah,4ch
        int 21h   
     
    main endp
    end main
