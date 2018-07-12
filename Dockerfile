FROM httpd:alpine
MAINTAINER Brice Rising

RUN adduser -S angular ; \
    chown -R angular /usr/local/apache2 ; \
    sed -i 's/Listen\ 80/Listen\ 8080/g' /usr/local/apache2/conf/httpd.conf
ADD dist /usr/local/apache2/htdocs/

USER angular
EXPOSE 8080
