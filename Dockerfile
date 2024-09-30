FROM  centos:latest
MAINTAINER eesha2396@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
 zip\
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page2/photobusiness.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photobusiness.zip
RUN cp -rvf photobusiness/* .
RUN rm -rf photobusiness photobusiness.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
 
#FROM nginx:latest
#COPY . /usr/share/nginx/html
