FROM phusion/baseimage

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && apt-get install -y gdebi-core usbutils && apt-get clean -y

ADD homegenie-beta_1.1.r514_all.deb /tmp/

RUN gdebi --non-interactive /tmp/homegenie-beta_1.1.r514_all.deb
                                 
RUN mkdir /etc/service/homegenie

ADD homegenie.runit /etc/service/homegenie/run

RUN chmod +x /etc/service/homegenie/run

# cleanup
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /usr/local/bin/homegenie