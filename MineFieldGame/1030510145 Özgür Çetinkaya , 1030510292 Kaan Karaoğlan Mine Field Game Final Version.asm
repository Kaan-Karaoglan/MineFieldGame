;PROJECT DEVELOPERS:
;
;OZGUR CETINKAYA
;KAAN KARAOGLAN                           
;
;BOMB LOCATIONS:           
;
;bomb1 loc : fifth row , first column 
;bomb2 loc : second row , first column
;bomb3 loc : third row , third column
;bomb4 loc : fourth row , fifth column
;bomb5 loc : first row , sixth column
;
.data

    entertxt db "-----Mine Field-----$"
    entertxt1 db "------- Game -------$"
    row db "Pls Enter Row Number $"
    column db "Pls Enter Column Number $"
    gameover db "--- Game Over ---$"
    winnerwinnerChickenDinner db "Winner Winner Chicken Dinner $"
    
    bomb1row  db 35h
    bomb2row  db 32h
    bomb3row  db 33h
    bomb4row  db 34h
    bomb5row  db 31h
    
    bomb1col db 31h
    bomb2col db 31h
    bomb3col db 33h
    bomb4col db 35h
    bomb5col db 36h 
    
    
.code
    
    main proc       
        mov ax, @data
        mov ds, ax  
        
        lea bx, entertxt    ;
        mov ah, 09h         ; Mine Field message 
        int 21h             ;
        
         mov ah, 2    ;
        mov dl, 0ah  ;
        int 21h      ;  \n icin      
        mov dl, 0dh  ;
        int 21h      ;
        
        lea dx, entertxt1
        mov ah, 09h        ; Game message  
        int 21h            

        mov ah, 2    ;
        mov dl, 0ah  ;
        int 21h      ;  \n icin      
        mov dl, 0dh  ;
        int 21h      ;
        
        mov ah, 2    ;
        mov dl, 0ah  ;
        int 21h      ;  \n icin
        mov dl, 0dh  ;
        int 21h      ;
        
        mov bh, 1    ; loop start variable
        mov ah, 2    ;
        
        
               
        loop1:
            cmp bh, 5
            jg loop1_exit
            mov bl,1
            
            loop2:
                mov dl, '_'
                cmp bl,6
                jg loop2_exit
                int 21h
                inc bl
                jmp loop2
                
                 
        loop2_exit:
            mov ah, 2
            mov dl, 0ah
            int 21h
            mov dl, 0dh
            int 21h   
            
            inc bh
            jmp loop1
        
                             
        loop1_exit:
        
            
            mov cx,24           ;  input start
            
        kullaniciVeri:
            
            cmp cx,0
            jl oyunuKazandiniz
            
            mov dl,1
            mov dh,9
            mov bh,0
            mov ah,2
            int 10h 
             
            mov ah, 2    ;
            mov dl, 0ah  ;
            int 21h      ;  \n icin      
            mov dl, 0dh  ;
            int 21h
            
            
            lea dx,row              
            mov ah,09h
            int 21h
            mov ah,01
            int 21h
            mov bl,al
            
            mov ah, 2    ;
            mov dl, 0ah  ;
            int 21h      ;  \n icin      
            mov dl, 0dh  ;
            int 21h      ;
            
            lea dx, column
            mov ah,09h
            int 21h
            mov ah,01
            int 21h
            mov bh,al
             
            
            
            
         bombaKontrolSatir:     ;  bomb row control
             
             cmp bl,bomb1row
             je bombaKontrolSutun1
             cmp bl,bomb2row
             je bombaKontrolSutun2
             cmp bl,bomb3row
             je bombaKontrolSutun3
             cmp bl,bomb4row
             je bombaKontrolSutun4
             cmp bl,bomb5row
             je bombaKontrolSutun5 
             
             sub bh,31h        ;
             add bl,3          ;   setting up the cursor
             sub bl,31h        ;
                                  
             mov dl, bh        ;
             mov dh, bl        ;
             mov bh,0          ;   relocate the cursor position by input
             mov ah,2h         ;
             int 10h           ;
                               
             add bl,31h        ;
             sub bl,3          ;   
             add bh,31h        ;                    
             
             mov dl,'0'        ;
             mov ah,2          ;   printing the non-bomb location
             int 21h           ;
             
             dec cx
             jmp kullaniciVeri 
             
             
         bombaKontrolSutun1:   ;
             cmp bh,bomb1col   ;   bomb1 control
             je gameOver1      ;
 
             sub bh,31h        ;
             add bl,3          ;   setting up the cursor
             sub bl,31h        ;   
             
             mov dl, bh        ;
             mov dh, bl        ;
             mov bh,0          ;   relocate the cursor position by input  
             mov ah,2h         ;
             int 10h           ;
             
             add bl,31h        ;
             sub bl,3          ;   
             add bh,31h        ;          
                     
             mov dl,'0'        ;
             mov ah,2          ;   printing the non-bomb location
             int 21h           ;
             
             dec cx
             jmp kullaniciVeri
             
         bombaKontrolSutun2:   ;
             cmp bh,bomb2col   ;   bomb2 control
             je gameOver1      ;
              
             sub bh,31h        ;
             add bl,3          ;   setting up the cursor
             sub bl,31h        ;
              
             mov dl, bh        ;
             mov dh, bl        ;
             mov bh,0          ;   relocate the cursor position by input
             mov ah,2h         ;
             int 10h           ;
              
             add bl,31h        ;
             sub bl,3          ;   
             add bh,31h        ;   
             
             mov dl,'0'        ;
             mov ah,2          ;   printing the non-bomb location
             int 21h           ;
             
             dec cx
             jmp kullaniciVeri
             
         bombaKontrolSutun3:   ;
             cmp bh,bomb3col   ;   bomb3 control
             je gameOver1      ;
             
             sub bh,31h        ;
             add bl,3          ;   setting up the cursor
             sub bl,31h        ;
                               
             mov dl, bh        ;
             mov dh, bl        ;   relocate the cursor position by input
             mov bh,0          ;
             mov ah,2h         ;
             int 10h           ;
             
             add bl,31h        ;
             sub bl,3          ;   
             add bh,31h        ;  
             
             mov dl,'0'        ;
             mov ah,2          ;   printing the non-bomb location
             int 21h           ;
             
             dec cx
             jmp kullaniciVeri
             
         bombaKontrolSutun4:
             cmp bh,bomb4col   ;
             je gameOver1      ;   bomb4 control
                         ;
             
             sub bh,31h        ;
             add bl,3          ;   setting up the cursor
             sub bl,31h        ;
                  
             mov dl, bh        ;
             mov dh, bl        ;
             mov bh,0          ;   relocate the cursor position by input
             mov ah,2h         ;
             int 10h           ;
              
             add bl,31h        ;
             sub bl,3          ;   
             add bh,31h        ;   
             
             mov dl,'0'        ;
             mov ah,2          ;   printing the non-bomb location
             int 21h           ;
             
            
             dec cx
             jmp kullaniciVeri
             
         bombaKontrolSutun5:   ;
             cmp bh,bomb5col   ;   bomb5 control
             je gameOver1      ;
             dec cx
             
             sub bh,31h        ;
             add bl,3          ;   setting up the cursor
             sub bl,31h        ;
             
             mov dl, bh        ;
             mov dh, bl        ;
             mov bh,0          ;   relocate the cursor position by input
             mov ah,2h         ;
             int 10h           ;
             
             add bl,31h        ;
             sub bl,3          ;   
             add bh,31h        ;

             
             mov dl,'0'        ;
             mov ah,2          ;   printing the non-bomb location
             int 21h           ;
             
             
             jmp kullaniciVeri       
            
                      
             
         gameOver1:

            mov ah, 2    ;
            mov dl, 0ah  ;
            int 21h      ;  \n icin      
            mov dl, 0dh  ;
            int 21h      ;
            
            
            lea dx, gameover   ;           
            mov ah, 09h        ;    Game Over
            int 21h            ;            
            
            
            sub bh,31h        ;
            add bl,3          ;   setting up the cursor
            sub bl,31h        ;
             
            mov dl, bh        ;
            mov dh, bl        ;
            mov bh,0          ;   relocate the cursor position by input
            mov ah,2h         ;
            int 10h           ;
             
            add bl,31h        ;
            sub bl,3          ;   
            add bh,31h        ;
            
             
            mov dl,'X'        ;
            mov ah,2          ;   printing the non-bomb location
            int 21h           ;
            
            ret
 
            
         oyunuKazandiniz:
            
            mov dl, 1
            mov dh, 12
            mov bh,0
            mov ah,2
            int 10h
         
            mov ah, 2    ;
            mov dl, 0ah  ;
            int 21h      ;  \n icin      
            mov dl, 0dh  ;
            int 21h      ;
            
            lea dx, winnerwinnerChickenDinner
            mov ah,09h
            int 21h   
        
    main endp
end main   

             