FROM centos:latest
MAINTAINER pawarnikhil1994@gmail.com
RUN yum install -y httpd \
 zip \
 unzip 
 ADD https://www.free-css.com/assets/files/free-css-templates/download/page273/savory.zip /var/www/html/
 WORKDIR /var/www/html
 RUN unzip savory.zip
 RUN cp -rf savory/* .
 RUN rm -rf savory.zip
 CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
 EXPOSE 80
