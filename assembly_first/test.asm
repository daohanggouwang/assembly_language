;Hello World���� 
              ASSUME    CS:CODE,DS:DATA 
        DATA  SEGMENT 
              DB        "HELLO WORLD"           ;�洢Ҫ��ʾ������ 
        DATA  ENDS 

        CODE  SEGMENT 
      START: 
              MOV       AX,0B800H   ;�Դ�Ķε�ַ 
              MOV       ES,AX       ;es���Դ�ε�ַ 
              MOV       AX,DATA     ;�ѱ��data�ĵ�ַ��ax 
              MOV       DS,AX       ;ds�洢data�Ķε�ַ 
              MOV       BX,0        ;bx���㣬�������ݶε�Ѱַ 
              MOV       DI,0        ;di�����Դ��Ѱַ 
              MOV       CX,11       ;ѭ��11�Σ���Ϊhello world��11���ַ� 
;����Ϊ��ʾ���� 
          S: 
              MOV       AL,[BX]     ;��bxָ����ڴ浥Ԫ�е����ݸ�al 
              MOV       AH,2        ;������ɫ���� 
              MOV       ES:[DI],AX  ;�����Դ� 
              INC       BX          ;bx+1 
              ADD       DI,2        ;di+2 
              LOOP      S            ;ѭ��ִ��S  
               
              MOV       AH,1 
              INT       21H         ;�����ж���ͣ���ȴ���������һ���ֽ� 
              MOV       AX,4C00H 
              INT       21H         ;�����ж��˳����� 
        CODE  ENDS 
              END       START 