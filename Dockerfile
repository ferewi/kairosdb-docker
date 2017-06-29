FROM ngty/archlinux-jdk7
MAINTAINER Ferdinand Rewicki <ferdi@glasspod.de>

# Install KairosDB
WORKDIR /opt
RUN curl -L https://github.com/kairosdb/kairosdb/releases/download/v1.1.3/kairosdb-1.1.3-1.tar.gz | \
  tar zxfp -

ADD files/kairosdb.properties /opt/kairosdb/conf/kairosdb.properties

# Set Kairos config vars
#ENV KAIROS_JETTY_PORT 8083
ENV CASSANDRA_HOST_LIST 10.1.2.3:9160

# Copy scripts into container to set kairos config params
ADD files/config-kairos.sh /usr/bin/config-kairos.sh

# Run kairosdb in foreground on boot
CMD ["/usr/bin/config-kairos.sh"]

# Kairos API telnet and jetty ports
EXPOSE 4242 8083
