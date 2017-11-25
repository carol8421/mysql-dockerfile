FROM centos:6.7
MAINTAINER chenyufeng "yufengcode@gmail.com"  
   
RUN yum install -y mysql-server mysql  

ADD my.cnf /etc/
   
RUN /etc/init.d/mysqld start &&\  
    mysql -e "grant all privileges on *.* to 'root'@'%' identified by '123456' WITH GRANT OPTION ;"&&\  
    mysql -e "grant all privileges on *.* to 'root'@'localhost' identified by '123456' WITH GRANT OPTION ;"&&\ 
    mysql -u root -p123456 -e "show databases;"  
   
EXPOSE 3306
   
CMD ["/usr/bin/mysqld_safe"]

