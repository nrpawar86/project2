FROM centos:latest
MAINTAINER pawarnikhil1994@gmail.com
RUN sed -i -e "s|mirrorlist=|#mirrorlist=|g" /etc/yum.repos.d/CentOS-*
RUN sed -i -e "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
 zip \
 unzip 
 ADD https://www.free-css.com/assets/files/free-css-templates/download/page275/wedding-v1.0.zip /var/www/html/
 WORKDIR /var/www/html
 RUN unzip wedding-v1.0.zip
 RUN cp -rf wedding-site-template-1.0/* .
 RUN rm -rf wedding-v1.0.zip wedding-site-template-1.0
 CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
 EXPOSE 80
