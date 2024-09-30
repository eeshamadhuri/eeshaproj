FROM  centos:latest
MAINTAINER eesha2396@gmail.com
RUN cd /etc/yum.repos.d/
#RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
#RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
 zip\
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/browny.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip browny.zip
RUN cp -rvf browny/* .
RUN rm -rf browny browny.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
 #https://www.free-css.com/free-css-templates/page296/browny
#FROM nginx:latest
#COPY . /usr/share/nginx/html
