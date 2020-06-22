;ho va ten :Nguyen Van Tien
;Lop hoc phan :LTHT 18N10
;Lop SH :18T2
;Bai 4

.model small
.stack
.data   
    msg1 DB 'Nhap ten : $' 
    msg2 DB 10,13,'Xin chao $'
    
    str DB 40, ?, 41 DUP("$") 
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,09h
        lea dx,msg1
        int 21h 
        
        mov ah,0Ah
        lea dx,str
        int 21h 
        
        mov ah,09h
        lea dx,msg2
        int 21h 
         
        mov ah,09h 
        lea dx,[str+2]
        int 21h
          
        mov ah,4ch
        int 21h
    main endp
    end main








