## 汇编语言简介
汇编语言和机器语言是一一对应的，而机器语言是由CPU得架构决定的，因此有什么样的CPU架构就有什么汇编语言。不过，这些“不同种类的汇编语言”只是不同的称呼，虽然新一代的CPU一般都会推出一些新的指令集，但是都会向下兼容，所以，新版的CPU也是可以运行旧版CPU上可以运行的汇编程序的。
### 从CPU的架构上对于汇编语言有以下称呼：
X86架构的CPU : X86汇编
ARM架构的CPU : ARM汇编
MIPS架构的CPU : ARM汇编

### 从CPU位数上对汇编语言有以下称呼：
8位CPU ： 8位汇编
16位CPU : 16位汇编
64位CPU : 64位汇编
... : ...

### 从指令集上对汇编语言有以下称呼：
8086指令集 ： 8086汇编
80386指令集 ： 80386汇编

---

## 上面提到了指令集，那么什么是“指令集”？
指令集，不准确的说就是CPU可以做的动作的集合，这里的动作包括CPU内部的电路状态和与CPU相连的其他设备的电路的工作状态。在计算机运行的过程中会产生各种复杂的操作，这些操作在CPU那里都是由一些预先设置好的动作组合起来实现的。一般来说，指令集越大，CPU可以做的动作就越多，CPU的运算速度就越快。

世界上第一个CPU指令集是Intel的X86指令集，这是Intel为其16位CPU i8086设计的。

除了X86指令集，还有一些其他的指令集：

[https://baike.baidu.com/item/%E6%8C%87%E4%BB%A4%E9%9B%86](https://baike.baidu.com/item/%E6%8C%87%E4%BB%A4%E9%9B%86 "指令集")

### 汇编语言有以下特点
1.面向CPU编程。汇编语言可以直接控制CPU。
2.汇编语言的操作对象不是具体的数据，而是寄存器。直接操作寄存器使得汇编语言的执行速度很快，但是也增加了编程的复杂性，因为汇编语言不直接操作数据不是不操作数据，而是操作寄存器里的数据，这就面临着一个数据寻址方式的问题。编写汇编语言的时候需要人来指定程序的寻址方式，而在高级语言中，寻址这部分工作是由编译系统完成的。
3.汇编语言的通用性和可移植性不强。正如第一条中所述，汇编语言直接面向CPU编程，而CPU的动作和CPU内部的，写在硬件电路上的指令集有关，由此可以推导出，汇编语言和CPU的型号关联性很高。不同的CPU有不同的汇编语言语法和对应的编译器。

## 汇编语言环境配置

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


### 接下来用一个比较简单的汇编程序说明一下汇编语言的工作过程：
首先新建一个`2.asm`文件

之后在DOSBOX中编辑该文件

	edit 2.asm

输入以下代码：

![](http://wx1.sinaimg.cn/mw690/006CBL8rly1ft97pnkv0vj30hy0bt3yj.jpg)
20180714_02.png

图片里的代码就是下面这些代码：

	assume cs:codesg
	codesg segment
        mov ax,0123H
        mov bx,0456H
        add ax,bx
        add ax,ax

        mov ax,4c00H
        int 21H
	codesg ends
	end

### 下面分析一下这些代码




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

输入：

	exit

可以退出DOSBOX

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

由于运行这个程序的OS是64位版本的，因此我们需要右键属性更改一下兼容性。由于这个时候我这个程序是放在虚拟机的共享文件夹中的，映射在Windows系统中就是一个“网络驱动器”，在网络驱动器里面无法永久设置兼容模式，兼容模式设置界面的选项都是灰色的，无法点击：
![](http://wx2.sinaimg.cn/mw690/006CBL8rly1ft96gzu6y3j30a70czq32.jpg)
20180714_01.png


之后，我们把该.exe程序放在系统的本地磁盘上设置兼容性：

20180714_02.png

下面写一个C语言的Hello World程序，查看其汇编代码
