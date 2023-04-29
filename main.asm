include 'emu8086.inc'
.DATA  
;----------------------------------------------------------------------------------------
M1 DB 0AH,0DH,0AH,0DH,  '                   Welcome to Shobra Restaurants$' 
M2 DB 0AH,0DH,0AH,0DH,                ' Please Enter your Choise $'
;---------------------------------------------------------------------------------------  
Menu1  DB 0AH,0DH, '  --                 1.Main Dishes             --$' 
Menu2  DB 0AH,0DH, '  --                 2.Appetizers              --$'
Menu3  DB 0AH,0DH, '  --                 3.Salads                  --$'
Menu4  DB 0AH,0DH, '  --                 4.Desserts                --$'
Menu5  DB 0AH,0DH, '  --                 5.Drinks                  --$'
;---------------------------------------------------------------------------------------          
filename db "project.txt",0
savefile db "save.txt",0
handler dw ? 
hand dw ?
buffer DW ?
totali DW ?
strout db 16 dup(0) 
finalprice db 16 dup(0) 
space DB '       $'           
;---------------------------------------------------------------------------------------------------- 
MSH1 DB 0AH,0DH,0AH,0DH,  '                How to use our System:  $'   
MSH2 DB 0AH,0DH,0AH,0DH,  ' * Resturant Billing System is a system that allows user to make an order    $'  
MSH3 DB 0AH,0DH,0AH,0DH,  '   by choosing a various of items from 5 main menues. $'    
MSH4 DB 0AH,0DH,0AH,0DH,  ' * The user can easily move between the menus and choose what he want. $' 
MSH5 DB 0AH,0DH,0AH,0DH,  ' * After finish his order ,he must choose finish order and then:  $'
MSH6 DB 0AH,0DH,          '   the total recipt will printout.  $'
MSH7 DB 0AH,0DH,0AH,0DH,  ' * You can now use our system easily press any key to start your order,best wishes :) $'    

;---------------------------------------------------------------------------------------------------- 
MSG DB 0AH,0DH,0AH,0DH,       '        Dish                        Price  $'                                                                                        
Dish1 DB 0AH,0DH,             '       1.Grilled Chicken            120LE  $' 
Dish2 DB 0AH,0DH,             '       2.Fried Chicken              120LE  $'
Dish3 DB 0AH,0DH,             '       3.Pasta                      100LE  $'
Dish4 DB 0AH,0DH,             '       4.Beef stack                 160LE  $'
Dish5 DB 0AH,0DH,             '       5.Grilled Shrimps            120LE  $'
Dish6 DB 0AH,0DH,             '       6.Mix Grill                  140LE  $'
Dish7 DB 0AH,0DH,             '       7.Stuffed cabbage            80LE   $'
Dish8 DB 0AH,0DH,             '       8.Kofta                      120LE  $'
B1 DB 0AH,0DH,                '       9.Back to Menu                      $'
;----------------------------------------------------------------------------------------------

MSG3 DB 0AH,0DH,0AH,0DH,      '       Appetizer                    Price  $'  
APP1 DB 0AH,0DH,              '       1.Mozzarella stickes         40LE   $' 
APP2 DB 0AH,0DH,              '       2.French Fries               15LE   $'
APP3 DB 0AH,0DH,              '       3.chips                      10LE   $'
APP4 DB 0AH,0DH,              '       4.Hotdog Sandwich            40LE   $'
APP5 DB 0AH,0DH,              '       5.Onion Rings                15LE   $'
APP6 DB 0AH,0DH,              '       6.Wedge Fries                10LE   $'
B2 DB 0AH,0DH,                '       7.Back to Menu                      $'
;-------------------------------------------------------------------------------
M9 DB 0AH,0DH,0AH,0DH,        '     Choose your Salad from the menu$' 
MSG2 DB 0AH,0DH,0AH,0DH,      '       Salad                        Price  $'
Salad1 DB 0AH,0DH,            '       1.Green salad                20LE   $'   
Salad2 DB 0AH,0DH,            '       2.Chicken caesar salad       30LE   $'
Salad3 DB 0AH,0DH,            '       3.Caesar salad               20LE   $'
Salad4 DB 0AH,0DH,            '       4.Greek salad                20LE   $'
Salad5 DB 0AH,0DH,            '       5.Tuna salad                 25LE   $'
Salad6 DB 0AH,0DH,            '       6.Italian pasta salad        30LE   $' 
B3 DB 0AH,0DH,                '       7.Back to Menu                      $'                       
;--------------------------------------------------------------------------------
MSG5 DB 0AH,0DH,0AH,0DH,      '       Dessert                      Price  $'
Dess1 DB 0AH,0DH,             '       1.Cheesecake                 35LE   $' 
Dess2 DB 0AH,0DH,             '       2.Cobbler                    50LE   $'
Dess3 DB 0AH,0DH,             '       3.Cookies                    60LE   $'
Dess4 DB 0AH,0DH,             '       4.Cakes                      35LE   $'
Dess5 DB 0AH,0DH,             '       5.Apple pie                  60LE   $'
B4 DB 0AH,0DH,                '       6.Back to Menu                      $'    
                                                                                                                          
;--------------------------------------------------------------------------------------
M10 DB 0AH,0DH,0AH,0DH,       '    Choose your Drink from the menu$' 
MSG4 DB 0AH,0DH,0AH,0DH,      '       Drink                        Price   $'   
D1 DB 10,13,                  '       1.Shoft Drinks               25LE    $'
D2 DB 10,13,                  '       1.Coffee                     30LE    $'
D3 DB 10,13,                  '       2.Tea                        25LE    $'
D4 DB 10,13,                  '       3.Orange juice               35LE    $'
D5 DB 10,13,                  '       4.Milk                       40LE    $'
D6 DB 10,13,                  '       5.Cocktail                   45LE    $'
D7 DB 10,13,                  '       6.Chocolate                  44LE    $'
B5 DB 10,13,                  '       7.Back to Menu                       $'                                              
;-------------------------------------------------------------------------------------
Q1 DB 0AH,0DH,0AH,0DH,  '  --         1.Make new order                --$ '
Q2 DB 0AH,0DH,0AH,0DH,  '  --         2.Exit                          --$'  
Q3 DB 0AH,0DH,          '  --                 6.Finish Order            --$' 
;--------------------------------------------------------------------------------------    
M8 DB 0AH,0DH,0AH,0DH,       '  Choise your food from the menu$' 
Quantitynum DB 0AH,0DH, '    Enter quantity: $'    
Invalid DB 10,13,10,13,'     &&INVALID ENTRY&&$ '    
New_line DB 0AH,0DH,0AH,0DH,' $'
;---------------------------------------------------------------------------------------------
BR1 DB 0AH,0DH,'  --                                           --$'
BR2 DB 0AH,0DH,'  -----------------------------------------------$'
BR3 DB 0AH,0DH,'  --                                           --$'
BR4 DB 0AH,0DH,'  --                                                               --$' 
BR5 DB 0AH,0DH,'  -------------------------------------------------------------------$'
BR6 DB 0AH,0DH,'  --                                          --$'        
BR7 DB 0AH,0DH,'  ----------------------------------------------$'
;---------------------------------------------------------------------------------------------- 
Recipt DB 0ah,0dh, '            Item                   Price       Quantity    Total     $'
price DB 0ah,0dh, '         Total price is:     $'  
;---------------------------------------------------------------------------------------------
order DB ?
quantity DB ?  
sum DW ?
Dish DB ? 
;------------------------------------------------------------------------------------------
TEXT_GAME_OVER_MAIN_MENU DB 'Press E to exit to main menu','$' 
TEXT_MAIN_MENU_TITLE DB 'MAIN MENU press 1','$' 
TEXT_MAIN_MENU_HELP DB 'HELP press 2','$' 
TEXT_MAIN_MENU_EXIT DB 'EXIT press 3 ','$'
;------------------------------------------------------------------------------------------

.CODE 

;---------------------------------------------------------------------------------------
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    CALL Create
    CALL Opensave
    
    CALL DRAW_MAIN_MENU 
;------------------------------------------------------------------------------------------    
    DRAW_MAIN_MENU PROC NEAR
        CALL CLEAR_SCREEN
    ;       Shows the menu title
    MOV AH,02h                       ;set cursor position
    MOV BH,00h                       ;set page number
    MOV DH,04h                       ;set row
    MOV DL,04h                         ;set column
    INT 10h

    MOV AH,09h                       
    LEA DX,TEXT_MAIN_MENU_TITLE      
    INT 21h                          

;       Shows the help message
    MOV AH,02h                      
    MOV BH,00h                       
    MOV DH,06h                       
    MOV DL,04h                       
    INT 10h

    MOV AH,09h                      
    LEA DX,TEXT_MAIN_MENU_HELP     
    INT 21h                         

;       Shows the exit message
    MOV AH,02h                     
    MOV BH,00h                     
    MOV DH,08h                      
    MOV DL,04h                       
    INT 10h   
    MOV AH,09h                      
    LEA DX,TEXT_MAIN_MENU_EXIT     
    INT 21h 
                        

    MAIN_MENU_WAIT_FOR_KEY:

	MOV AH,01h
    INT 21h
    SUB AL,48
		
       
	CMP AL,1
	JE TOP 
	
	CMP AL,2
	JE HELP    
	
	CMP AL,3
	JE EXIT

	LEA DX,invalid
    MOV AH,9
    INT 21H
			
    JMP MAIN_MENU_WAIT_FOR_KEY	
    RET

    DRAW_MAIN_MENU ENDp
;---------------------------------------------------------------------------------------------------
    CLEAR_SCREEN PROC NEAR               

   xor cx,cx
   mov dh,25
   mov dl,80
   mov bh,10
   mov ax,700h
   INT 10h                           
    RET
    CLEAR_SCREEN ENDP
;----------------------------------------------------------------------------------------------------   
 
  TOP: 
   
   
      CALL CLEAR_SCREEN
  
    LEA DX,M1
    MOV AH,9
    INT 21H
    
    LEA DX,New_line
    MOV AH,9
    INT 21H
   
    LEA DX,BR2
    MOV AH,9
    INT 21H     
    
    LEA DX,BR3
    MOV AH,9
    INT 21H   

    LEA DX,Menu1
    MOV AH,9
    INT 21H                               ;Dispaly Main Menue
    
    LEA DX,Menu2
    MOV AH,9
    INT 21H
    
    LEA DX,Menu3
    MOV AH,9
    INT 21H
    
    LEA DX,Menu4
    MOV AH,9
    INT 21H
    
    LEA DX,Menu5
    MOV AH,9
    INT 21H
    
    LEA DX,Q3
    MOV AH,9
    INT 21H  
 
    LEA DX,BR1
    MOV AH,9
    INT 21H
  
    LEA DX,BR2
    MOV AH,9
    INT 21H
;--------------------------------------------------------------------      
    select_choice:
    LEA DX,M2
    MOV AH,9
    INT 21H

    MOV AH,1
    INT 21H
    MOV BH,AL
    SUB BH,48
    
    CMP BH,1
    JE Main_Dishes
    
    CMP BH,2
    JE Appetizers
    
    CMP BH,3
    JE Salads
    
    CMP BH,4
    JE Desserts 
    
    CMP BH,5
    JE Drinks
    
    CMP BH,6
    JE Finish_order
    
    LEA DX,invalid
    MOV AH,9
    INT 21H
    jmp select_choice
 ;--------------------------------------------------------------------   
   
     Finish_order:
     
    LEA DX,BR5
    MOV AH,9
    INT 21H 
    
    LEA DX,Recipt
    MOV AH,9
    INT 21H
    
    LEA DX,BR5
    MOV AH,9
    INT 21H  
 
    
    call writeprice
       
;--------------------------------------------------------------------
  
   Main_Dishes: 
   CALL CLEAR_SCREEN
    
    LEA DX,M8    
    MOV AH,9
    INT 21H
    
    LEA DX,New_line
    MOV AH,9
    INT 21H
    
    LEA DX,BR5
    MOV AH,9
    INT 21H
    
    LEA DX,BR4
    MOV AH,9
    INT 21H   
    
    LEA DX,MSG   
    MOV AH,9
    INT 21H 
    
    LEA DX,Dish1    
    MOV AH,9
    INT 21H 
    
    LEA DX,Dish2  
    MOV AH,9
    INT 21H
    
    LEA DX,Dish3
    MOV AH,9          
    INT 21H 
    
    LEA DX,Dish4
    MOV AH,9           
    INT 21H
    
    LEA DX,Dish5         
    MOV AH,9
    INT 21H                                ;Display main dishes
    
    LEA DX,Dish6     
    MOV AH,9
    INT 21H
            
    LEA DX,Dish7
    MOV AH,9           
    INT 21H
            
    LEA DX,Dish8      
    MOV AH,9
    INT 21H
    
    LEA DX,B1      
    MOV AH,9
    INT 21H
    
    LEA DX,BR4
    MOV AH,9
    INT 21H
    
    LEA DX,BR5
    MOV AH,9
    INT 21H
 ;-------------------------------------------------------------------------------
    select_order1:
                    
                    
    printn ' '               
    print '    Enter your order: '           
    
    MOV AH,01h
    INT 21H
    SUB AL,48    
    mov order,AL
    
    CMP order,1 
    JE calcDish1
    
    CMP order,2 
    JE calcDish2
    
    CMP order,3  
    JE calcDish3
    
    CMP order,4
    JE calcDish4                              ;store selected item
    
    CMP order,5
    JE calcDish5
    
    CMP order,6                                                        
    JE calcDish6
    
    CMP order,7 
    JE calcDish7  
    
    CMP order,8
    JE calcDish8
    
    CMP order,9
    jE TOP 
    
          
    LEA DX,invalid
    MOV AH,9
    INT 21H
    jmp select_order1
    
;---------------------------------------------------------------------------------------------------------
    Movestring PROC
        
    CLD                           ; Clear the contents of Direction Flag
    MOV CH,00H                    ; Since CX should be 00xx
    MOV CL,50
    REP MOVSB
    
    ret
    ENDP
 ;-------------------------------------------------------------------------------------------------    
    calcDish1:
    
    call QuantityNumber 

    mov al,120
    MUL quantity
    
    ADD sum, ax
    mov totali,ax 
    
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,Dish1               
    LEA DI,Dish                                                         

    call Movestring  
    call convert
    call conv
    call WriteFile
                  
    jmp Main_Dishes 
;------------------------------------------------------------------------------------------               
               
    calcDish2:
    
   call Quantitynumber
    
    mov al,120
    MUL quantity
    
    ADD sum, ax
    mov totali,ax 
    
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,Dish2                  
    LEA DI,Dish 
                                                            
    call Movestring   
    call convert
     call conv    
    call WriteFile                  
    jmp Main_Dishes    
 ;------------------------------------------------------------------------------
            
    calcDish3:
    
    call Quantitynumber
   
    mov al,100
    MUL quantity
    
    ADD sum, ax
    mov totali,ax  
    
    MOV AX, @DATA
    MOV DS,AX
    MOV ES,AX
    LEA SI,Dish3                 
    LEA DI,Dish 
                                                            
    call Movestring 
    call convert
     call conv
    call WriteFile    
    
    jmp Main_Dishes 
;---------------------------------------------------------------------------------- 
    calcDish4:
    
    call Quantitynumber
  
    mov al,160
    MUL quantity
 
    ADD sum, ax
    mov totali,ax   
    
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,Dish4                 
    LEA DI,Dish 
                                                            
    call Movestring
    call convert
    call conv  
    call WriteFile
    
    jmp Main_Dishes 
;-------------------------------------------------------------------------------
    
    calcDish5: 
   
    call Quantitynumber
 
    mov al,120
    MUL quantity
 
    ADD sum, ax
    mov totali,ax  
    
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,Dish5                 
    LEA DI,Dish                                                         

    call Movestring 
    call convert
     call conv
    call WriteFile
   
    jmp Main_Dishes
 ;-----------------------------------------------------------------------------------  
       
    calcDish6:
    
    call Quantitynumber

    mov al,140
    MUL quantity

    ADD sum, ax
    mov totali,ax  
    
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,Dish6                 
    LEA DI,Dish 
                                                            
    call Movestring
    call convert
     call conv 
    call WriteFile   
   
    jmp Main_Dishes 
;----------------------------------------------------------------------------------------

    calcDish7:    
    
    call Quantitynumber
   
    mov al,80
    MUL quantity

    ADD sum, ax
    mov totali,ax  
    
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,Dish7               
    LEA DI,Dish                                                         

    call Movestring    
    call convert
     call conv 
    call WriteFile   
   
    jmp Main_Dishes 
 ;-----------------------------------------------------------------------------------------      
                 
    calcDish8:    
    
    call Quantitynumber
  
    mov al,120
    MUL quantity

    ADD sum, ax
    mov totali,ax  
    
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,Dish8                 
    LEA DI,Dish 
                                                            
    call Movestring
    call convert
     call conv 
    call WriteFile
      
    jmp Main_Dishes
;-----------------------------------------------------------------------------------------
                            
    Appetizers:
    
    CALL CLEAR_SCREEN
    
    LEA DX,M8
    MOV AH,9 
    INT 21H
            
    LEA DX,New_line
    MOV AH,9
    INT 21H
    
    LEA DX,BR5
    MOV AH,9
    INT 21H
    
    LEA DX,BR4
    MOV AH,9
    INT 21H   
    
    LEA DX,MSG3   
    MOV AH,9
    INT 21H  
    
    LEA DX,APP1    
    MOV AH,9
    INT 21H 
    
    LEA DX,APP2  
    MOV AH,9
    INT 21H
                                             ;Dispaly appetiser menue
    LEA DX,APP3
    MOV AH,9          
    INT 21H 
    
    LEA DX,APP4
    MOV AH,9           
    INT 21H 
    
    LEA DX,APP5         
    MOV AH,9
    INT 21H
    
    LEA DX,APP6     
    MOV AH,9
    INT 21H
    
    LEA DX,B2     
    MOV AH,9
    INT 21H
                      
    LEA DX,BR4
    MOV AH,9
    INT 21H
    
    LEA DX,BR5
    MOV AH,9
    INT 21H
;-----------------------------------------------------------------------------------------
    select_order2:
    printn ' '
    print '    Enter your order: '             
    
    MOV AH,1
    INT 21H
    SUB AL,48  
   
    MOV order,AL
   
    CMP order,1
    JE calcAPP1 
    
    CMP order,2
    JE calcAPP2
   
    CMP order,3
    JE calcAPP3
                                             ;store selected item
    CMP order,4
    JE calcAPP4
    
    CMP order,5
    JE calcAPP5
    
    CMP order,6
    JE calcAPP6
    
    CMP order,7
    JE TOP
          
    LEA DX,invalid
    MOV AH,9
    INT 21H
    jmp select_order2
;------------------------------------------------------------------------------------------    
   calcAPP1: 

   call Quantitynumber
  
    mov AL,40 
    MUL quantity
    
    ADD sum, ax
    mov totali,ax 
    
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,APP1                  
    LEA DI,Dish  
                                                           
    call Movestring 
    call conv
    call convert 
    call WriteFile
 
    jmp  Appetizers  
;------------------------------------------------------------------------------------------------ 
   
    calcAPP2:
    
    call Quantitynumber
 
    mov al,15
    MUL quantity

    ADD sum, ax
    mov totali,ax
     
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,APP2                
    LEA DI,Dish  
                                                           
    call Movestring
    call convert
     call conv 
    call WriteFile
    
    jmp  Appetizers
;-----------------------------------------------------------------------------------------------------   
    
    calcAPP3:
    
    call Quantitynumber
  
    mov al,10
    MUL quantity
    
    ADD sum, ax
    mov totali,ax
     
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,APP3               
    LEA DI,Dish 
                                                            
    call Movestring
    call convert
     call conv 
    call WriteFile
 
    jmp  Appetizers
;---------------------------------------------------------------------------------------------------------
    calcAPP4:
    
    call Quantitynumber 

    mov al,40
    MUL quantity
    
    ADD sum, ax
    mov totali,ax
     
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,APP4                 
    LEA DI,Dish   
                                                          
    call Movestring
    call convert
     call conv   
    call WriteFile
 
    jmp  Appetizers
;------------------------------------------------------------------------------------------------------------
    calcAPP5:
    call Quantitynumber

    mov al,15
    MUL quantity
    
    ADD sum, ax
    mov totali,ax
     
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,APP5                 
    LEA DI,Dish
                                                             
    call Movestring
    call convert
     call conv 
    call WriteFile
 
    jmp  Appetizers 
;-----------------------------------------------------------------------------------------------------------   
    calcAPP6:
    
   call Quantitynumber
  
    mov al,10
    MUL quantity
    
    ADD sum, ax
    mov totali,ax
     
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,APP6                 
    LEA DI,Dish 
                                                            
    call Movestring
    call convert
     call conv 
    call WriteFile
 
    jmp  Appetizers   
 ;-------------------------------------------------------------------------------------------------------- 
   
    Salads:
    
   CALL CLEAR_SCREEN
    
    LEA DX,M9    
    MOV AH,9
    INT 21H
    
    LEA DX,New_line
    MOV AH,9
    INT 21H
    
    LEA DX,BR5
    MOV AH,9
    INT 21H
    
    LEA DX,BR4
    MOV AH,9
    INT 21H   
    
    LEA DX,MSG2   
    MOV AH,9
    INT 21H 
    
    LEA DX,Salad1    
    MOV AH,9
    INT 21H 
    
    LEA DX,Salad2                               ;Display salad menue
    MOV AH,9
    INT 21H
    
    LEA DX,Salad3 
    MOV AH,9          
    INT 21H 
    
    LEA DX,Salad4 
    MOV AH,9           
    INT 21H
    
    LEA DX,Salad5          
    MOV AH,9
    INT 21H
    
    LEA DX,Salad6      
    MOV AH,9
    INT 21H
    
    LEA DX,B3      
    MOV AH,9
    INT 21H
            
    LEA DX,BR4
    MOV AH,9
    INT 21H
    
    LEA DX,BR5
    MOV AH,9
    INT 21H
;---------------------------------------------------------------------------------------------   
    select_order3:
    printn ' '
    print '    Enter your order: '            
    
    MOV AH,1
    INT 21H
    SUB AL,48  
    
    MOV order,AL
   
    CMP order,1
    JE calcSalad1
     
    CMP order,2
    JE calcSalad2
    
    CMP order,3
    JE calcSalad3
    
    CMP order,4                             ;store selected item
    JE calcSalad4
    
    CMP order,5
    JE calcSalad5
    
    CMP order,6
    JE calcSalad6
    
    CMP order,7
    JE TOP
          
    LEA DX,invalid
    MOV AH,9
    INT 21H
    jmp select_order3
;------------------------------------------------------------------------------------------------
    calcSalad1:
    
    call Quantitynumber
  
    mov al,20
    MUL quantity
    
    ADD sum, ax
    mov totali,ax
    
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,Salad1                
    LEA DI,Dish  
                                                           
    call Movestring
    call convert
     call conv 
    call WriteFile 
 
    jmp Salads
 ;-------------------------------------------------------------------------------------------------   
   
    calcSalad2:
    
    call Quantitynumber
  
    mov al,30
    MUL quantity
     
    mov sum, ax
    mov totali,ax
    
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,Salad2               
    LEA DI,Dish  
                                                           
    call Movestring
    call convert
    call conv     
    call WriteFile      

    jmp Salads 
;-------------------------------------------------------------------------------------------------- 
    calcSalad3:
    
    call Quantitynumber
  
    mov al,20
    MUL quantity
    
    ADD sum, ax
    mov totali,ax
    
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,Salad3                
    LEA DI,Dish   
                                                          
    call Movestring
    call convert
     call conv   
    call WriteFile      
   
    jmp Salads
;------------------------------------------------------------------------------------------------------
    
    calcSalad4:
    
    call Quantitynumber
  
    mov al,20
    MUL quantity
    
    ADD sum, ax
    mov totali,ax
    
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,Salad4                
    LEA DI,Dish     
                                                        
    call Movestring 
    call convert 
     call conv  
    call WriteFile      
   
    jmp Salads
;-----------------------------------------------------------------------------------------------------------
    
    calcSalad5:
    
    call Quantitynumber
   
    mov al,25
    MUL quantity
    
    ADD sum, ax
    mov totali,ax
    
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,Salad5                 
    LEA DI,Dish 
                                                            
    call Movestring
    call convert
     call conv 
    call WriteFile      
   
    jmp Salads 
;-----------------------------------------------------------------------------------------------------------
    
    calcSalad6:
    
    call Quantitynumber
  
    mov al,30
    MUL quantity
    
    ADD sum, ax
    mov totali,ax
    
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,Salad6                 
    LEA DI,Dish   
                                                          
    call Movestring
    call convert
     call conv 
    call WriteFile      
   
    jmp Salads   
;------------------------------------------------------------------------------------------------------------
    Desserts:
    
    CALL CLEAR_SCREEN
    
    LEA DX,M8    
    MOV AH,9
    INT 21H
    
    LEA DX,New_line
    MOV AH,9
    INT 21H
    
    LEA DX,BR5
    MOV AH,9
    INT 21H
    
    LEA DX,BR4
    MOV AH,9
    INT 21H 
    
    LEA DX,MSG5  
    MOV AH,9
    INT 21H 
    
    LEA DX,Dess1                  ;Display Dessert menue
    MOV AH,9
    INT 21H 
      
    LEA DX,Dess2  
    MOV AH,9
    INT 21H
    
    LEA DX,Dess3
    MOV AH,9          
    INT 21H 
    
    LEA DX,Dess4
    MOV AH,9           
    INT 21H
    
    LEA DX,Dess5         
    MOV AH,9
    INT 21H
    
    LEA DX,B4         
    MOV AH,9
    INT 21H
       
    LEA DX,BR4
    MOV AH,9
    INT 21H
    
    LEA DX,BR5
    MOV AH,9
    INT 21H
 ;------------------------------------------------------------------------   
    select_order4:
    printn ' '
    print '    Enter your order: '       
    
    MOV AH,1
    INT 21H
    SUB AL,48 
    
    MOV order,AL
    
    CMP order,1
    JE calcDess1 
    
    CMP order,2
    JE calcDess2
    
    CMP order,3
    JE calcDess3
    
    CMP order,4
    JE calcDess4
                                       ;store selected item
    CMP order,5
    JE calcDess5
    
    CMP order,6
    JE TOP
         
    LEA DX,invalid
    MOV AH,9
    INT 21H
    jmp select_order4
;-------------------------------------------------------------------------
   calcDess1: 

    call Quantitynumber
  
    mov AL,35 
    MUL quantity
    
    ADD sum, ax
    mov totali,ax 
    
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,Dess1                
    LEA DI,Dish 
                                                            
    call Movestring
    call convert
     call conv 
    call WriteFile
 
    jmp  Desserts 
;--------------------------------------------------------------------------
    
    calcDess2:  
    call Quantitynumber
  
    mov AL,50 
    MUL quantity
    
    ADD sum, ax
    mov totali,ax 
    
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,Dess2                 
    LEA DI,Dish    
                                                         
    call Movestring
    call convert
     call conv 
    call WriteFile
   
 
    jmp  Desserts 
;------------------------------------------------------------------------
   
   calcDess3: 

    call Quantitynumber  
   
    mov AL,60 
    MUL quantity
    
    ADD sum, ax
    mov totali,ax 
    
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,Dess3                  
    LEA DI,Dish  
                                                           
    call Movestring
    call convert
     call conv 
    call WriteFile
   
 
    jmp  Desserts  
;----------------------------------------------------------------------- 
    calcDess4: 

    call Quantitynumber
  
    mov AL,35 
    MUL quantity
    
    ADD sum, ax
    mov totali,ax 
    
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,Dess4                
    LEA DI,Dish  
                                                           
    call Movestring
    call convert
     call conv 
    call WriteFile
   
 
    jmp  Desserts  
;-------------------------------------------------------------------   
    
    calcDess5: 

    call Quantitynumber

    mov AL,60
    MUL quantity
    
    ADD sum, ax
    mov totali,ax 
    
    MOV Ax,Ds
    MOV ES,AX
    LEA SI,Dess5                  
    LEA DI,Dish  
                                                           
    call Movestring
    call convert
     call conv 
    call WriteFile

 
    jmp  Desserts
;------------------------------------------------------------------- 
        
    Drinks:
    
    CALL CLEAR_SCREEN
    
    LEA DX,M10   
    MOV AH,9
    INT 21H
    
    LEA DX,New_line
    MOV AH,9
    INT 21H
    
    LEA DX,BR5
    MOV AH,9
    INT 21H
    
    LEA DX,BR4
    MOV AH,9
    INT 21H 
    
    LEA DX,MSG4   
    MOV AH,9
    INT 21H 


    
    LEA DX,D2  
    MOV AH,9
    INT 21H
                                               ;Display Drinks menue
    LEA DX,D3
    MOV AH,9          
    INT 21H 
    
    LEA DX,D4
    MOV AH,9           
    INT 21H
  
    LEA DX,D5         
    MOV AH,9
    INT 21H  
    
    LEA DX,D6         
    MOV AH,9
    INT 21H  
    
    LEA DX,D7         
    MOV AH,9
    INT 21H
    
    LEA DX,B5         
    MOV AH,9
    INT 21H 
    
    LEA DX,BR4
    MOV AH,9
    INT 21H
    
    LEA DX,BR5
    MOV AH,9
    INT 21H
;----------------------------------------------------------------------------  
    
    select_order5:  
    

    printn ' '
    print '    Enter your order: '             
    
    
    MOV AH,1
    INT 21H
    SUB AL,48 
    
    MOV order,AL
   
    CMP order,1
    JE calcDrink1 
    
    CMP order,2
    JE calcDrink2 
    
    CMP order,3
    JE calcDrink3
    
    CMP order,4
    JE calcDrink4                                  ;store selected item
    
    CMP order,5
    JE calcDrink5 
    
    CMP order,6
    JE calcDrink6
    
 
    
    CMP order,7
    JE TOP
      
    LEA DX,invalid
    MOV AH,9
    INT 21H
       
    jmp select_order5
;------------------------------------------------------------------------------

   calcDrink1:
    
   call Quantitynumber
   
    mov al,30
    MUL quantity
    
    ADD sum, ax
    mov totali,ax 
        
    MOV AX,Ds
    MOV ES,AX
    LEA SI,D2                  
    LEA DI,Dish      
                                                       
    call Movestring
    call convert
    call conv 
    call WriteFile 
    
    jmp Drinks  
 ;----------------------------------------------------------------------------   
  
   calcDrink2: 
    
    call Quantitynumber
   

    mov al,25
    MUL quantity
    
    ADD sum, ax
    mov totali,ax   
        
    MOV AX,Ds
    MOV ES,AX
    LEA SI,D3                  
    LEA DI,Dish   
                                                          
    call Movestring 
    call convert
    call conv 
    call WriteFile
    jmp Drinks 
;--------------------------------------------------------------------------          
         
   calcDrink3:
    
    call Quantitynumber
  
    mov al,35
    MUL quantity
    
    ADD sum, ax
    mov totali,ax
    
    MOV AX,Ds
    MOV ES,AX
    LEA SI,D4                  
    LEA DI,Dish  
                                                           
    call Movestring
    call convert 
    call conv
    call WriteFile      
    
    jmp Drinks 
;--------------------------------------------------------------------------
    
     calcDrink4:
     call Quantitynumber

    mov al,40
    MUL quantity
    
    ADD sum, ax
    mov totali,ax 
        
    MOV AX,Ds
    MOV ES,AX
    LEA SI,D5                 
    LEA DI,Dish 
                                                            
    call Movestring  
    call convert
    call conv 
    call WriteFile
    
    jmp Drinks
;----------------------------------------------------------------------- 
    calcDrink5: 
    
    call Quantitynumber
   
    mov al,45
    MUL quantity
    
    ADD sum, ax
    mov totali,ax 
    
    MOV AX,Ds
    MOV ES,AX
    LEA SI,D6                  
    LEA DI,Dish  
                                                           
    call Movestring
    call convert
    call conv 
    call WriteFile      
    
    jmp Drinks 
;---------------------------------------------------------------------  
    
 calcDrink6: 
    
    call Quantitynumber
   
    mov al,45
    MUL quantity    
    
    ADD sum, ax
    mov totali,ax
    
    MOV AX,Ds
    MOV ES,AX
    LEA SI,D6                  
    LEA DI,Dish  
                                                           
    call Movestring
    call convert
    call conv 
    call WriteFile  
    
    jmp Drinks     
;----------------------------------------------------------------------------------------- 
           
 
  
     DISPLAY_NUM PROC NEAR
        XOR CX, CX ;To count the digits
        MOV BX, 10 ;Fixed divider
        
        DIGITS:
        XOR DX, DX ;Zero DX for word division
        DIV BX
        PUSH DX ;Remainder (0,9)
        INC CX
        TEST AX, AX
        JNZ DIGITS ;Continue until AX is empty              ;Display multiple digits of number
        
        NEXT:
        POP DX
        ADD DL, 30H
        MOV AH, 02H
        INT 21H
        LOOP NEXT
        
        RET  
    
     
        DISPLAY_NUM ENDP  
 ;---------------------------------------------------------------------------------------
     
   WriteFile PROC NEAR   
   mov bx,handler
   mov ah, 42h  ; "lseek"
   mov al, 2    ; position relative to end of file
   mov cx, 0    ; offset MSW
   mov dx, 0    ; offset LSW
   int 21h
                                                                   
   
   mov dx, offset Dish
   mov cx, 45
   mov ah, 40h
   int 21h ; write to file...
   
   
   mov dx, offset space
   mov cx, 7
   mov ah, 40h
   int 21h ; write to file...
      
   
   
   mov dx, offset quantity
   mov cx, 1
   mov ah, 40h
   int 21h ; write to file...                          ;Write at files
   
   
   mov dx, offset space
   mov cx, 7
   mov ah, 40h
   int 21h ; write to file... 
     
   
   
   mov dx, offset strout
   mov cx, 5
   mov ah, 40h
   int 21h ; write to file...
  
    mov bx,hand
   mov ah, 42h  ; "lseek"
   mov al, 2    ; position relative to end of file
   mov cx, 0    ; offset MSW
   mov dx, 0    ; offset LSW
   int 21h                       
  
   mov dx, offset Dish
   mov cx, 45
   mov ah, 40h
   int 21h ; write to file...
   
   
   
   mov dx, offset space
   mov cx, 7
   mov ah, 40h
   int 21h ; write to file...   
   
   
   mov dx, offset quantity
   mov cx, 1
   mov ah, 40h
   int 21h ; write to file...  
   
   
   mov dx, offset space
   mov cx, 7
   mov ah, 40h
   int 21h ; write to file... 
     
   
   
   mov dx, offset strout
   mov cx, 5
   mov ah, 40h
   int 21h ; write to file...
   
  RET    
                                 
  WriteFile ENDP 
  
;------------------------------------------------------------------------------     

     Create PROC NEAR 
        mov al,00h
        mov ah,3ch
        LEA DX,filename
        mov cx,00H
        int 21h   
        
        ;Display part
        JC EXIT    ; If carry Flag is Set, It means File is not Created
        
        mov handler,ax
        RET
        Create ENDP
     
        Createsave PROC NEAR 
        mov al,00h                                      ;create files
        mov ah,3ch
        LEA DX,savefile
        mov cx,00H
        int 21h   
        
        mov handler,ax
        RET
        Createsave ENDP  
;-------------------------------------------------------------------------------------  

     Close PROC NEAR 
        mov ah,3eh
        mov bx,handler
        int 21h
        RET                                       
     
        Close ENDP                                   ;close files
     Closesave PROC NEAR 
        mov ah,3eh
        mov bx,hand
        int 21h
        RET
        Closesave ENDP
;---------------------------------------------------------------------------------------

     Open PROC NEAR
        mov ah,3dh
        lea dx,filename
        mov al,2
        int 21h
        mov handler,ax 
        RET
        Open ENDP
                                                    ;open files
     Opensave PROC NEAR
        mov ah,3dh 
        lea dx,savefile
        mov al,2
        int 21h 
       
        mov hand,ax 
        RET
        Opensave ENDP
;--------------------------------------------------------------------------------------------                 
     
      convert proc
        
        
    
        mov si, offset quantity 
        mov ax, [si]
    
                                                         ;Convert quantity into string
       divide:
       
        mov ah, 0
        mov cl, 10
        div cl         ; div number(in ax) by 10
        dec bx
        add ah, 48     ;Make into a character
        mov quantity, ah  
        cmp al, 0
        jne divide
        ret
        
        convert endp
;-----------------------------------------------------------------------------------------------      
      conv proc 
        mov ax,totali
        mov cx,10
        xor bx,bx
        divv:
        xor dx,dx
        div cx
        push dx
        inc bx
        test ax,ax
        jnz divv
        mov cx,bx                         ;function to convert total price for each item into string
        lea si,strout
        get_digit:
        pop ax
        add al,'0'
        mov [si],al
        inc si
        loop get_digit
        mov al,' '
        mov [si],al
        RET
        conv ENDP   
      
;--------------------------------------------------------------------------------------------------     
      convprice proc 
        mov ax,sum
        mov cx,10
        xor bx,bx
        divv1:
        xor dx,dx
        div cx
        push dx
        inc bx
        test ax,ax
        jnz divv1
        mov cx,bx                             ;Function to convert Total price into string
        lea si,finalprice
        get_digit1:
        pop ax
        add al,'0'
        mov [si],al
        inc si
        loop get_digit1
        mov al,' '
        mov [si],al
        RET
        convprice ENDP
      
;---------------------------------------------------------------------------------------------

   proc readfile 
    
         	mov ah,3Dh   
    		mov al,0 
    		mov dx,offset filename  
    		int 21h   
    		mov handler,ax  
    
    		mov ah,3Fh
    		mov cx,10000   
    		mov dx,offset buffer 
    		mov bx,handler    
    		int 21h   
    
    		add dx,ax ; ax has actual number of bytes   
    		
    		mov bx,dx
    		mov byte [bx],'$'   
                
            mov cl,9
            mov bl,1
            lea si,buffer
                
        
           label:  
           mov al,[si] 
           mov dl,al
           mov ah,2h                                         ;Function to read the content of the file
           int 21h
           call moving1      
    
          inc si 
          dec cl
   
   
          jnz label
           jz Print
  
           
	    Print:

		mov dx,offset buffer  ; put the pointer back in DX.
		mov ah,9
		int 21h      
		
		call Displayprice
		
		 
		  
        moving1: 
        cmp al,' '
    
      je increment
       ret
     
     
      increment:
      mov bl,1  

       ret   
     ENDP 
;--------------------------------------------------------------------------------------- 
     
    PROC DisplayPrice 
        
    LEA DX,BR5
    MOV AH,9
    INT 21H 
    
    mov ax,sum 
                 
    LEA DX,price
    MOV AH,9                        ;Function to Display Price at Recipt
    INT 21H
    mov ax,sum 
   
    call DISPLAY_NUM 
    
    LEA DX,BR5
    MOV AH,9
    INT 21H
    mov ah,08h
    int 21h  
    jmp EXIT
    
       
    ENDP  
;-----------------------------------------------------------------------------------------   
   
    Writeprice proc
        
   mov bx,hand
   mov ah, 42h  ; "lseek"
   mov al, 2    ; position relative to end of file
   mov cx, 0    ; offset MSW
   mov dx, 0    ; offset LSW
   int 21h
                                                                   
   mov bx, [hand]
   mov dx, offset BR5
   mov cx, 60
   mov ah, 40h
   int 21h ; write to file...   
   
   mov bx,hand
   mov ah, 42h  ; "lseek"
   mov al, 2    ; position relative to end of file
   mov cx, 0    ; offset MSW
   mov dx, 0    ; offset LSW
   int 21h
   
   mov bx, [hand]
   mov dx, offset price
   mov cx, 30
   mov ah, 40h
   int 21h ; write to file...  
   call convprice                                           ;Function to write total price at save file
   
   mov bx, [hand]
   mov dx, offset finalprice
   mov cx, 5
   mov ah, 40h
   int 21h ; write to file...  
    
   mov bx,hand
   mov ah, 42h  ; "lseek"
   mov al, 2    ; position relative to end of file
   mov cx, 0    ; offset MSW
   mov dx, 0    ; offset LSW
   int 21h 
   
   mov bx, [hand]
   mov dx, offset BR5
   mov cx, 60
   mov ah, 40h
   int 21h ; write to file...   
        
   call readfile 
        
     ENDP
 ;-------------------------------------------------------------------------      

     EXIT:
     CALL Close
     CALL Closesave
    MOV AH,4CH
    INT 21H
  
;------------------------------------------------------------------------------
     HELP: 
     
     LEA DX,New_line
     MOV AH,9
     INT 21H 
     
     LEA DX,BR1
     MOV AH,9
     INT 21H 
     
     LEA DX,MSH1
     MOV AH,9
     INT 21H  
     
     LEA DX,BR2
     MOV AH,9
     INT 21H
     
     LEA DX,MSH2
     MOV AH,9
     INT 21H 
     
     LEA DX,MSH3
     MOV AH,9
     INT 21H 
     
     LEA DX,MSH4
     MOV AH,9
     INT 21H
     
     LEA DX,MSH5
     MOV AH,9
     INT 21H  
     
     LEA DX,MSH6
     MOV AH,9
     INT 21H
     
     LEA DX,MSH7
     MOV AH,9
     INT 21H 
     
     
     mov ah,08h
     int 21h
     jmp TOP 
     
;-----------------------------------------------------------------------------   
     Quantitynumber proc 
        
    LEA DX,Quantitynum              
    MOV AH,9
    INT 21H 
 
    MOV AH,1
    INT 21H
    SUB AL,48

    mov quantity,al
    
    ret
    ENDP
   
    
    
END MAIN
