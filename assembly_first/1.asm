;Hello World程序 
              ASSUME    CS:CODE,DS:DATA 
        DATA  SEGMENT 
              DB        "HELLO WORLD"           ;存储要显示的数据 
        DATA  ENDS 
		
        CODE  SEGMENT 
      START: 
              MOV       AX,0B800H   ;显存的段地址 
              MOV       ES,AX       ;es做显存段地址 
              MOV       AX,DATA     ;把标记data的地址给ax 
              MOV       DS,AX       ;ds存储data的段地址 
              MOV       BX,0        ;bx置零，用作数据段的寻址 
              MOV       DI,0        ;di用于显存的寻址 
              MOV       CX,11       ;循环11次，因为hello world有11个字符 
;以下为显示过程 
          S: 
              MOV       AL,[BX]     ;把bx指向的内存单元中的数据给al 
              MOV       AH,2        ;设置绿色字体 
              MOV       ES:[DI],AX  ;送入显存 
              INC       BX          ;bx+1 
              ADD       DI,2        ;di+2 
              LOOP      S            ;循环执行S  
               
              MOV       AH,1 
              INT       21H         ;调用中断暂停，等待键盘输入一个字节 
              MOV       AX,4C00H 
              INT       21H         ;调用中断退出程序 
        CODE  ENDS 
              END       START 
;去掉空行和独占一行的注释，上述一个