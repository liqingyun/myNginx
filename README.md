# myNginx
## 1、nginx 安装
    下载地址：http://nginx.org/download/nginx-1.4.2.tar.gz

    cd /usr/local/src/ # 进入需下载到的目录

    wget http://nginx.org/download/nginx-1.4.2.tar.gz  #wget 下载安装包

    tar zxvf nginx-1.4.2.tar.gz  # 解压安装包

    cd nginx-1.4.2  # 进入解压目录

    安装准备: nginx依赖于pcre库,要先安装pcre

        yum install pcre pcre-devel
      or
        brew install pcre pcre-devel # 安装了brew 的情况下能使用

    ./configure --prefix=/usr/local/nginx  # 配置安装

    make && make install #编译

    
    nginx 目录
    cd /ulsr/local/nginx, 看到如下4个目录
    
     ....conf 配置文件  
     ... html 网页文件
     ...logs  日志文件 
     ...sbin  主要二进制程序
     
     启动 nginx

     进入到 sbin 目录

     ./nginx
     
   #提示：

       # ./sbin/nginx 

       nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Address already in use)
      
       ....

       nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Address already in use)

       nginx: [emerg] still could not bind()

       不能绑定80端口,80端口已经被占用

       (有时是自己装了apache,nginx等,还有更多情况是操作系统自带了apache并作为服务启动)
 
        解决: 把占用80端口的软件或服务关闭即可.或者修改配置文件
        
  ##2、Nginx的信号控制
         
       QUIT  优雅的关闭进程,即等请求结束后再关闭

       HUP 改变配置文件,平滑的重读配置文件

       USR1 重读日志,在日志按月/日分割时有用

       USR2 平滑的升级   

       WINCH 优雅关闭旧的进程(配合USR2来进行升级)
       
   具体的语法：

        Kill -信号选项 nginx的主进程号

        Kill -HUP 4873

        Kill -信号控制 `cat /xxx/path/log/nginx.pid`

        Kil -USR1 `cat /xxx/path/log/nginx.pid`
     
