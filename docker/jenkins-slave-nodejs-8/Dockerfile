FROM openshift/jenkins-slave-base-centos7
MAINTAINER Brice Rising

RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - ; \
	yum -y install nodejs ; \
	yum -y groupinstall 'Development Tools'
