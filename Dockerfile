FROM teracy/angular-cli:1.5.0 as compiler

ADD . HelloOpenshift-angular

RUN cd HelloOpenshift-angular ; \
    npm install ; \
    ng build --base-href src

FROM httpd:alpine
MAINTAINER Brice Rising

RUN adduser -S angular ; \
    chown -R angular /usr/local/apache2/logs ; \
    sed -i 's/Listen\ 80/Listen\ 8080/g' /usr/local/apache2/conf/httpd.conf
COPY --from=compiler HelloOpenshift-angular/dist /usr/local/apache2/htdocs/

USER angular
EXPOSE 8080
