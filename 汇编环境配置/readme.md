>由于汇编语言可以直接对硬件进行操控，因此如果我们直接使用汇编语言对寄存器中的数据进行编辑的话是有可能造成系统崩溃的，而且，汇编语言本身也不是计算机硬件能直接理解的语言，汇编语言也需要一个编译器将汇编代码转换成机器代码`01010`所以我们需要配置汇编环境.

## 我们需要两个工具
	DOSBOX
下载地址：[download](http://www.dosbox.com/download.php?main=1)
	
	MASM32
下载地址：[download](http://www.masm32.com/download.htm)

DOSBOX是一个模拟的DOS程序，采用的是[SDL库](https://baike.baidu.com/item/SDL/224181)，可以跨平台运行DOS程序。

MASM32是一个汇编开发工具包。

## 开始环境配置
### 安装配置DOSBOX
双击之后，一路next，最后close

之后需要对DOSBOX进行配置。首先，新建一个文件夹，该文件夹将用于保存汇编工具（如:MASM32）以及汇编程序（以.asm结尾的文件），例如，我们创建一个文件夹assembly_first
   
    E:\assembly_language\assembly_language\assembly_first

之后在系统(64位)中打开：
	C:\Program Files (x86)\DOSBox-0.74
找到：
	DOSBox 0.74 Options.bat
双击之

之后会弹出一个文本文档，在该文档的末尾添加：

	MOUNT C E:\assembly_language\assembly_language\assembly_first
	# 将目录E:\assembly_language\assembly_language\assembly_first挂载为DOSBOX下的C:

	set PATH=$PATH$;E:\assembly_language\assembly_language\assembly_first
	# 将E:\assembly_language\assembly_language\assembly_first写入环境变量PATH中

保存之

### 安装配置MASM32

解压，按默认配置安装即可

安装完成后将`C:\masm32\bin`加入系统的`PATH`环境变量

需要注意的是，安装需要管理员权限，否则可能安装失败

测试是否安装成功：
重新打开cmd
输入：
	ml
	link

如下图所示代表安装成功：
![](http://wx1.sinaimg.cn/mw690/006CBL8rly1ft81btml4yj30ik0bzjrl.jpg)

20180712_01.png



除了使用MASM32也可以使用：

	NASM

[下载地址](https://www.nasm.us/pub/nasm/releasebuilds/2.14rc15/)

NASN编译完成后生成的是.obj文件，使用link命令可以将.obj文件转换成.exe文件。
Link是Visual Studio中VC的连接器，如果安装过VC，那么，link就会放在bin目录下。

无论MASM32还是NASM都是一个工具集，这个工具集里面主要包含了一下程序：

	DEBUG.EXE、EDIT.EXE、LINK.EXE、MASM.EXE

我们以单独拿出来这些程序放到汇编程序所在的目录里，这样也可以进行编译。

如图:
![20180713_01.png](http://wx1.sinaimg.cn/mw690/006CBL8rly1ft81bu6ftsj30vs0d03yp.jpg)
2018713_01.png

之后，打开DOSBOX
输入：

	mount c a:\

我的汇编代码放在A盘，这个命令的含义就是将A盘挂载在一个虚拟的C盘上。
之后，输入：

	c:

回车就可以进入虚拟的C盘

输入:

	dir

可以看到原来在物理磁盘A盘下的文件夹1


由于之前我在DOSBOX的配置文件里将一下路径放入以下路径放入了DOSBOX的配置文件，所以，尽管挂载的时候指定的挂载目录是A盘，但是实际上挂载目录仍然是：

	E:\assembly_language\assembly_language\assembly_first




输入：

	edit

就可以进入编辑界面：
![](http://wx1.sinaimg.cn/mw690/006CBL8rly1ft8221w81lj30hy0bt0so.jpg)
20180713_02.png	

按“Alt”可以选择DOSBOX的菜单

按“Ctrl+fn+f10”可以将鼠标跳出DOSBOX的窗口

下面，我们写一个Hello word程序：

>汇编语言本身是不区分大小写的，但是为了便于识别我们可以使用大写字母，要输入大写字母需要按住“Shift”键输入，大写锁定键无法在DOSBOX中输入大写字母

下面我们编写一个输出“Hello World”的汇编语言程序：

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


除了使用DOSBOX编写汇编程序，我们也可以使用其他文本编辑器编写。

保存

保存完成后退出编辑界面：

	file -> exit

编译.asm文件：

	masm 1.asm

如图：
![](http://wx2.sinaimg.cn/mw690/006CBL8rly1ft88qikkuzj30hy0btaa9.jpg)
20180713_03.png

如果编译没有报错，则会在原来.asm文件的同级目录下新产生三个分别以

	.CRF
	.LST
	.OBJ
结尾的文件，如图：
![](http://wx1.sinaimg.cn/mw690/006CBL8rly1ft88w4ab2wj30m20c0wfe.jpg)
20180713_04.png

之后使用link命令可以生成一个.exe的文件：
命令：

	link 1

之后会在原来.asm所在的目录下生成一个.exe格式的文件。

双击.exe文件，弹出如下窗口：
如图：
![](http://wx2.sinaimg.cn/mw690/006CBL8rly1ft8cjbs5fyj30fg02nq2u.jpg)
20180713_05.png



下面写一个C语言的Hello World程序，查看其汇编代码
