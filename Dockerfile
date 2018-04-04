FROM openjdk:8-jre-alpine

MAINTAINER lulichn

ENV VERSION 4.0

RUN set -ex \
	&& apk --no-cache add openssl \
	&& mkdir -p /jmeter \
	&& cd /jmeter \
	&& wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${VERSION}.tgz \
	&& wget -O - https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${VERSION}.tgz.sha512 | sha512sum -c \
	&& tar xfz apache-jmeter-${VERSION}.tgz \
	&& rm apache-jmeter-${VERSION}.tgz

ENV JMETER_HOME /jmeter/apache-jmeter-${VERSION}
ENV PATH $JMETER_HOME/bin:$PATH

