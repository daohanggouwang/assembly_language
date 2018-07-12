### Windows7连接GitHub仓库
创建并连接github仓库：
在网页上创建一个github仓库
下载安装git
在本地新建一个文件夹作为本地仓库
将远程仓库clone到本地：
    git clone [仓库url]
配置ssh秘钥：
生成ssh：
    ssh-keygen -t rsa -C "email"
将.pub结尾的文件中的ssh公钥添加进github
测试是否连接成功：
    $ ssh -T git@github.com
    The authenticity of host 'github.com (13.250.177.223)' can't be established.
    RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added 'github.com,13.250.177.223' (RSA) to the list of know   n hosts.
    Hi daohanggouwang! You've successfully authenticated, but GitHub does not provid   e shell access.
    

配置用户名和密码：
git config --global user.name "daohanggouwang"
git config --global user.email "gjtxyx@gmail.com"


上传代码：
 git commit -m "first"
 
 开始上传（第一次上传会弹出提示要输入GitHub的用户名和密码）：
 git push origin master
 
 之后提示：
 master@master-PC MINGW64 /e/assembly_language/assembly_language (master)
$ git push origin master
Everything up-to-date


可是在网页上查看远程仓库，发现仓库里什么也没有。原因如下：
新创建的git仓库是完全空的，不包含任何一个分支(branch),因此需要在push代码之前制定一个分支：
创建一个分支origin:
 git branch origin

 
 检查分支是否创建成功：
 master@master-PC MINGW64 /e/assembly_language/assembly_language (master)
$ git branch
* master
  origin
  
之后上传代码：
git add .

git commit -m "6"

git push origin master

最后成功上传


之后关机重启，出现了再次push代码就需要我输入github仓库用户名和密码的情况，解决办法就是：
git config --global credential.helper store

参考：https://www.jianshu.com/p/81ae6e77ff47

之后再push代码会要求输入一次用户名和密码，之后用户名和密码就会被记住而不要再次输入。