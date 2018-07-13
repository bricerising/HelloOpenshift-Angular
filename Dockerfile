FROM httpd:alpine
MAINTAINER Brice Rising

ADD dist /usr/local/apache2/htdocs/
RUN adduser -S angular ; \
	mkdir -p /usr/local/apache2/logs ; \
    sed -i 's/Listen\ 80/Listen\ 8080/g' /usr/local/apache2/conf/httpd.conf ; \
    chown -R angular /usr/local/apache2

USER angular
EXPOSE 8080
