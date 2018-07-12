FROM httpd:alpine
MAINTAINER Brice Rising

ADD dist /usr/local/apache2/htdocs/
RUN adduser -S angular ; \
    sed -i 's/Listen\ 80/Listen\ 8080/g' /usr/local/apache2/conf/httpd.conf ; \
    sed -i -r 's@Errorlog .*@Errorlog /dev/stderr@i' /etc/apache2/httpd.conf ; \
    echo "Transferlog /dev/stdout" >> /etc/apache2/httpd.conf ; \
    chown -R angular /usr/local/apache2

USER angular
EXPOSE 8080
