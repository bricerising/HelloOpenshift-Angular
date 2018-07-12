FROM httpd:alpine
MAINTAINER Brice Rising

ADD dist /usr/local/apache2/htdocs/
RUN adduser -S angular ; \
    sed -i 's/Listen\ 80/Listen\ 8080/g' /usr/local/apache2/conf/httpd.conf ; \
    mkdir /usr/local/apache2/logs ; \
    chown -R angular /usr/local

USER angular
EXPOSE 8080
