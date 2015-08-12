# Lastest visono/debian_serf_jre
FROM visono/debian_serf_jre:latest

MAINTAINER Patrik Hagedorn <p.hagedorn@visono.com>

USER root

# Install Jetty 9
WORKDIR /opt
# Downloading latest jetty distribution

RUN wget -O jetty.tar.gz "http://download.eclipse.org/jetty/stable-9/dist/jetty-distribution-9.3.2.v20150730.tar.gz" \
&& mkdir jetty \
&& tar -xvf jetty.tar.gz -C jetty --strip-components 1 \
&& rm /opt/jetty.tar.gz \
&& useradd jetty -U -s /bin/false \
&& chown -R jetty:jetty /opt/jetty

# Adding Jetty configuration
COPY start.ini /opt/jetty/start.ini
COPY http.ini /opt/jetty/start.d/http.ini

CMD ["/bin/bash"]