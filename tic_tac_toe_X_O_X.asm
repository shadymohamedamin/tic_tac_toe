;Shady Mohamed
include 'emu8086.inc'
org 100h
start:
mov ax,3
int 10h

.data 
score_X db 0
score_O db 0
f db ?
s db ?
first db 0
second db 0
temp db 0
arr db '-','-','-','-','-','-','-','-','-' 
id1 db 0
id2 db 0
id3 db 0
fla db 0  
count_O db 0
count_X db 0
who_win db ?
fair_count db 0
is_fair db 0
 
is_win db 0
.code
startt: 

mov fair_count,0
mov is_fair,0
mov temp,0
mov fla,0
mov count_O,0
mov count_X,0
mov is_win,0
mov id1,0
mov id2,0
mov id3,0


mov ax,3
int 10h

gotoxy 30,0
printn 'Tic Tac Toe'
print 'Do you want to play ? [Y/N]...'
mov dx,2
call get_string

mov bx,[di]
cmp bx,'N'
je exi
printn ''
print 'Choise X - O :... ';The first player will play with X '  
mov dx,2      ;size 
call get_string   ;distantion stored in di   
mov bx,[di]
;mov bx,[di]
;mov [si],bx
;printn '' 
;call print_string                                   
cmp bx,'X'
jne O1
mov f,'X'
mov s,'O'
jmp X1

O1: 
mov f,'O'
mov s,'X'
X1:


 

re:


mov ax, 3
int 10h


call prin


printn ''

  
cmp fla,0
jne sec 
mov bl,f
mov fla,1
jmp co

sec:
mov bl,s
mov fla,0
co:




print 'enter position '
;mov bl,f
;mov [si],bl
;call print_string  
mov dl,bl
mov ah,2
int 21h
print ' '



call scan_num
dec cx
mov si,cx 




cmp arr[si],'-'
jne exist
mov arr[si],bl
printn '' 
jmp com 
 
exist:
printn 'this position is existed !..... try new position'
jmp co



com:  

call fair 
cmp is_fair,1
jne contin
printn 'Game if fair and no one is win'
jmp startt

contin:

call win
cmp is_win,1
jne re

printn ''
print 'player with '
mov dl,who_win
mov ah,2h
int 21h
print ' is win '
 

mov arr[0],'-'
mov arr[1],'-'
mov arr[2],'-'
mov arr[3],'-'
mov arr[4],'-'
mov arr[5],'-'
mov arr[6],'-'
mov arr[7],'-'
mov arr[8],'-'

 
jmp startt 





ret
exi:



prin proc
   
mov id1,0
mov id2,0   
mov cx,3
l1:
   mov temp,cl
   mov cx,3
   mov id2,0
   l2:
      mov bl,id1
      mov al,3
      mul bl
      add al,id2
      mov si,0
      mov bx,0
      mov si,ax
      ;call print_num
      
      
      mov dl,arr[si]
      mov ah,2
      int 21h
      
      ;mov bl,arr[si]
      ;mov [si],bl
       
     ; mov bl,arr[0] 
      ;mov [si],bl 
      
      ;call print_string
      
     ; call print_string
      
      cmp id2,2
      je e1:
      print '|'
      
      e1:
      inc id2                
      
   loop l2
   
   printn ''
   mov cl,temp
   inc id1
loop l1
    
ret
prin endp    



win proc
mov cx,3
mov si,0
mov count_X,0
mov count_O,0

l7:
   cmp arr[si],'X'
   jne enl1
   inc count_X
   enl1:
   
   cmp arr[si],'O'
   jne enl2
   inc count_O
   enl2:
   
   
   inc si
loop l7

cmp count_X,3
jne com1
mov is_win,1
mov who_win,'X'
jmp exittt
com1:

cmp count_O,3
jne com2
mov is_win,1
mov who_win,'O'
jmp exittt
com2:




mov cx,3
mov si,3
mov count_X,0
mov count_O,0

l8:
   cmp arr[si],'X'
   jne enl3
   inc count_X
   enl3:
   
   cmp arr[si],'O'
   jne enl4
   inc count_O
   enl4:
   
   
   inc si
loop l8

cmp count_X,3
jne com3
mov is_win,1
mov who_win,'X'
jmp exittt
com3:

cmp count_O,3
jne com4
mov is_win,1
mov who_win,'O'
jmp exittt
com4:






mov cx,3
mov si,6
mov count_X,0
mov count_O,0

l9:
   cmp arr[si],'X'
   jne enl5
   inc count_X
   enl5:
   
   cmp arr[si],'O'
   jne enl6
   inc count_O
   enl6:
   
   
   inc si
loop l9

cmp count_X,3
jne com5
mov is_win,1
mov who_win,'X'
jmp exittt
com5:

cmp count_O,3
jne com6
mov is_win,1
mov who_win,'O'
jmp exittt
com6:





mov cx,3
mov si,0
mov count_X,0
mov count_O,0

l11:
   cmp arr[si],'X'
   jne enl7
   inc count_X
   enl7:
   
   cmp arr[si],'O'
   jne enl8
   inc count_O
   enl8:
   
   
   inc si
   inc si
   inc si
loop l11

cmp count_X,3
jne com7
mov is_win,1
mov who_win,'X'
jmp exittt
com7:

cmp count_O,3
jne com8
mov is_win,1
mov who_win,'O'
jmp exittt
com8:





mov cx,3
mov si,1
mov count_X,0
mov count_O,0

l12:
   cmp arr[si],'X'
   jne enl9
   inc count_X
   enl9:
   
   cmp arr[si],'O'
   jne enl10
   inc count_O
   enl10:
   
   
   inc si
   inc si
   inc si
loop l12

cmp count_X,3
jne com9
mov is_win,1
mov who_win,'X'
jmp exittt
com9:

cmp count_O,3
jne com10
mov is_win,1
mov who_win,'O'
jmp exittt
com10:




mov cx,3
mov si,2
mov count_X,0
mov count_O,0

l13:
   cmp arr[si],'X'
   jne enl11
   inc count_X
   enl11:
   
   cmp arr[si],'O'
   jne enl12
   inc count_O
   enl12:
   
   
   inc si
   inc si
   inc si
loop l13

cmp count_X,3
jne com11
mov is_win,1
mov who_win,'X'
jmp exittt
com11:

cmp count_O,3
jne com12
mov is_win,1
mov who_win,'O'
jmp exittt
com12:





mov cx,3
mov si,0
mov count_X,0
mov count_O,0

l14:
   cmp arr[si],'X'
   jne enl13
   inc count_X
   enl13:
   
   cmp arr[si],'O'
   jne enl14
   inc count_O
   enl14:
   
   
   inc si
   inc si
   inc si
   inc si
loop l14

cmp count_X,3
jne com13
mov is_win,1
mov who_win,'X'
jmp exittt
com13:

cmp count_O,3
jne com14
mov is_win,1
mov who_win,'O'
jmp exittt
com14:





mov cx,3
mov si,2
mov count_X,0
mov count_O,0

l15:
   cmp arr[si],'X'
   jne enl15
   inc count_X
   enl15:
   
   cmp arr[si],'O'
   jne enl16
   inc count_O
   enl16:
   
   
   inc si
   inc si
   ;inc si
   ;inc si
loop l15

cmp count_X,3
jne com15
mov is_win,1
mov who_win,'X'
jmp exittt
com15:

cmp count_O,3
jne com16
mov is_win,1
mov who_win,'O'
jmp exittt
com16:




exittt:        
ret
win endp


fair proc 
mov fair_count,0
mov is_fair,0    
mov cx,9
mov si,0
l30:
    cmp arr[si],'-'
    je endd
    inc fair_count 
    
    endd: 
    inc si
loop l30    
cmp fair_count,9
jne rett  
mov is_fair,1


rett:    
ret
fair endp        

define_scan_num
define_print_num
define_print_num_uns
define_get_string
define_print_string



