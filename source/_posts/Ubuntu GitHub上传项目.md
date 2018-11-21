---
title: 在Ubuntu上向Github上传项目
date: 2018-11-19 10:00:00
categories: github
tag:[Ubuntu, github]
---





一.安装Git-LFS

当向github上传一些项目时会有一些提示

```bash
$ remote: warning: Large files detected.
$ remote: error: File giant_file is 123.00 MB; this exceeds GitHub's file size limit of 100 MB
```

这时候就需要检查一下自己的github版本

```bash
$ git --version
```

如下图所示： 
![在这里插入图片描述](https://img-blog.csdnimg.cn/2018111922111368.png)
之后安装Git-LFS打开终端

 1.添加apt-get源

```bash
$ curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
```

2.安装Git-LFS

```bash
$ sudo apt-get install git-lfs
```

3.初始化Git-LFS

```bash
$ git lfs install
```

Git-LFS就安装完成了

 二.github官网进行账号注册

点击个人信息里的Settings

![在这里插入图片描述](https://img-blog.csdnimg.cn/2018111922113814.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0phY2tSYXlfUg==,size_16,color_FFFFFF,t_70)


然后点击SSH and GPS keys          

![在这里插入图片描述](https://img-blog.csdnimg.cn/20181119221402570.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0phY2tSYXlfUg==,size_16,color_FFFFFF,t_70)

 里面会有title 和 key

三.生成SSH秘钥

1.检查秘钥

```bash
$ ls ~/.ssh/
```

如果有秘钥进行备份

```bash
$ mkdir key_backup
```

```bash
$ cp ~/.ssh/id_* key_backup
```


 2.生成ssh秘钥

```bash
$ ssh-keygen -t rsa -C "your_email@example.com" 
#将your_email@example.com替换成你自己的邮箱
```

之后会有提示直接回车就行了

3.复制公钥

```bash
$ cat ~/.ssh/id_rsa.pub
```

复制打开的内容到之前网站中的 key，title 可以随便填写 

4.验证测试

```bash
$ ssh -T git@github.com
```

执行后提示：

```bash
Hi github! You’ve successfully authenticated, but GitHub does not provide shell access. 
此时设置用户名和邮箱为注册Github时的名字

$ git config --global user.name “xxx”
$ git config --global user.email xxx@gmail.com
```

name就是你github的名字, email是你github的邮箱

四.创建远程仓库在github上

![在这里插入图片描述](https://img-blog.csdnimg.cn/20181119221429291.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0phY2tSYXlfUg==,size_16,color_FFFFFF,t_70)

在此我创建一个名叫example的仓库，在repository name中输入example然后点击create repository



点击复制地址

五.建立本地仓库

```bash
$ mkdir example
  #向文件夹中添加文件，加入仓库
$ cd example
$ git init 初始化仓库
$ touch example.txt 创建一个txt文件
$ git add . //.表示全添加 或者指定文件名
  #提交到仓库，这个版本名字叫
$ git commit -m "first commit" #"first commit"为备注可自行修改
```

六.提交本地代码到远程（同步）

```bash
$ git remote add origin git@github.com:yourgithubname/yourrepositoryname 
#此时用之前复制的仓库url 替换“git@github.com:yourgithubname/yourrepositoryname”
$ git push -u origin master
```

然后需要输入 name  和你账号的password

此时就上传成功

![在这里插入图片描述](https://img-blog.csdnimg.cn/20181119221530283.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0phY2tSYXlfUg==,size_16,color_FFFFFF,t_70)

之后我们就可以检查远程仓库


![在这里插入图片描述](https://img-blog.csdnimg.cn/20181119221547851.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0phY2tSYXlfUg==,size_16,color_FFFFFF,t_70)
我们上传文件成功

