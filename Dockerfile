# see http://phusion.github.io/baseimage-docker/
FROM phusion/baseimage:0.9.17
MAINTAINER Manuel Bogner <docker@mbo.pm>
CMD ["/sbin/my_init"]

# update system and install packages
RUN 	apt-get update && \
	apt-get dist-upgrade -y && \
	apt-get install -y wget software-properties-common python-software-properties && \
	add-apt-repository -y ppa:webupd8team/java && \
	apt-get update && \
	apt-get dist-upgrade -y && \
	echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
	echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
	apt-get install -y oracle-java8-installer oracle-java8-unlimited-jce-policy && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# install rundeck
RUN	wget -O /opt/rundeck.deb http://dl.bintray.com/rundeck/rundeck-deb/rundeck-2.6.1-1-GA.deb && \
	dpkg -i /opt/rundeck.deb && \
	rm -rf /opt/rundeck.deb /var/lib/apt/lists/* /tmp/* /var/tmp/*

# change base configuration
RUN	mkdir /etc/service/rundeck && \
	mkdir /var/lib/rundeck/.ssh && \
	chown -R rundeck:rundeck /var/lib/rundeck

# add init and startup scripts
ADD assets/run/rundeck.sh /etc/service/rundeck/run
ADD assets/startup/* /etc/my_init.d/

# http, https
EXPOSE 4440 4443

# project files
# configs
# ssh-keys
# logs
VOLUME [ "/var/rundeck", "/etc/rundeck", "/var/lib/rundeck/.ssh", "/var/log/rundeck" ]
