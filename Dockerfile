FROM centos:latest
MAINTAINER pawarnikhil1994@gmail.com
RUN sed -i -e "s|mirrorlist=|#mirrorlist=|g" /etc/yum.repos.d/CentOS-*
RUN sed -i -e "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
 zip \
 unzip 
 ADD https://www.free-css.com/assets/files/free-css-templates/download/page273/corso.zip /var/www/html/
 WORKDIR /var/www/html
 RUN unzip corso.zip
 RUN cp -rf documentation/* .
 RUN rm -rf corso.zip documentation
 CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
 EXPOSE 80
