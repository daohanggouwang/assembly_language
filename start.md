����������github�ֿ⣺
����ҳ�ϴ���һ��github�ֿ�
���ذ�װgit
�ڱ����½�һ���ļ�����Ϊ���زֿ�
��Զ�ֿ̲�clone�����أ�git clone [�ֿ�url]
����ssh��Կ������ssh��ssh-keygen -t rsa -C "email"	 ��.pub��β���ļ��е�ssh��Կ��ӽ�github
�����Ƿ����ӳɹ���
$ ssh -T git@github.com
The authenticity of host 'github.com (13.250.177.223)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'github.com,13.250.177.223' (RSA) to the list of know                                                                                                       n hosts.
Hi daohanggouwang! You've successfully authenticated, but GitHub does not provid                                                                                                       e shell access.


�����û��������룺
git config --global user.name "daohanggouwang"
git config --global user.email "gjtxyx@gmail.com"


�ϴ����룺
 git commit -m "first"
 
 ��ʼ�ϴ�����һ���ϴ��ᵯ����ʾҪ����GitHub���û��������룩��
 git push origin master
 
 ֮����ʾ��
 master@master-PC MINGW64 /e/assembly_language/assembly_language (master)
$ git push origin master
Everything up-to-date


��������ҳ�ϲ鿴Զ�ֿ̲⣬���ֲֿ���ʲôҲû�С�ԭ�����£�
�´�����git�ֿ�����ȫ�յģ��������κ�һ����֧(branch),�����Ҫ��push����֮ǰ�ƶ�һ����֧��
����һ����֧origin:
 git branch origin

 
 ����֧�Ƿ񴴽��ɹ���
 master@master-PC MINGW64 /e/assembly_language/assembly_language (master)
$ git branch
* master
  origin
  
֮���ϴ����룺
git add .

git commit -m "6"

git push origin master

���ɹ��ϴ�


  