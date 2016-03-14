FROM phusion/baseimage

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

RUN apt-get update && apt-get install -y gdebi-core usbutils ca-certificates-mono && apt-get clean -y

ADD homegenie-beta_1.1.r514_all.deb /tmp/

RUN gdebi --non-interactive /tmp/homegenie-beta_1.1.r514_all.deb
                                 
RUN mkdir /etc/service/homegenie

ADD homegenie.runit /etc/service/homegenie/run

RUN chmod +x /etc/service/homegenie/run

# cleanup
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Add Volume
VOLUME /usr/local/bin/homegenie
RUN chmod -R 777 /usr/local/bin/homegenie
