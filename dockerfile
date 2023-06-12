# Use the Alpine Linux as the base image
FROM alpine:latest

# Set the Tomcat version
ENV TOMCAT_VERSION 9.0.56

# Install required dependencies
RUN apk update \
    && apk add openjdk11-jre-headless \
    && rm -rf /var/cache/apk/*

# Download and extract Tomcat
RUN wget -q https://downloads.apache.org/tomcat/tomcat-10/v10.1.9/bin/apache-tomcat-10.1.9.tar.gz -O /tmp/tomcat.tar.gz \
    && mkdir /opt/tomcat \
    && tar -xzf /tmp/tomcat.tar.gz -C /opt/tomcat --strip-components=1 \
    && rm /tmp/tomcat.tar.gz

# Set environment variables
ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

