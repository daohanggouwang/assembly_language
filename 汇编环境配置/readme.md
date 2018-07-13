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
20180713_01.png

test


