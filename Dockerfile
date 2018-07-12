FROM httpd:alpine
MAINTAINER Brice Rising

RUN adduser -S angular ; \
    sed -i 's/Listen\ 80/Listen\ 8080/g' /usr/local/apache2/conf/httpd.conf ; \
    chown -R angular /usr/local/apache2 ; \
    chown -R angular /usr/local/apache2/logs/
ADD dist /usr/local/apache2/htdocs/

USER angular
EXPOSE 8080
