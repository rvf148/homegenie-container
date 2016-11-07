FROM mono:latest
MAINTAINER Raf Van Hoof <raf.vanhoof@gmail.com>

RUN apt-get update && apt-get install -y \
	sudo \
	gdebi-core \
	libusb-1.0-0 \
	libusb-1.0-0-dev \
	usbutils \
	alsa-utils \
	lame \
	lirc --no-install-recommends \
	libv4l-0 \
	apt-utils \
	mc

#Install SSH deamon 
ENV NOTVISIBLE "in users profile"
RUN apt-get install -y openssh-server \
 && mkdir /var/run/sshd \
 && echo 'root:Okidoki%148' | chpasswd \
 && sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \
 && echo "export VISIBLE=now" >> /etc/profile
	
#Add HomeGenie
ADD https://github.com/genielabs/HomeGenie/releases/download/v1.1-beta.525/homegenie-beta_1.1.r525_all.deb /tmp/
RUN gdebi --non-interactive /tmp/homegenie-beta_1.1.r525_all.deb

# cleanup
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN chmod -R 777 /usr/local/bin/homegenie

ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh
CMD ["/usr/local/bin/run.sh"]

#CMD ["/usr/bin/mono" , "/usr/local/bin/homegenie/HomeGenie.exe"]
#ENTRYPOINT ["/bin/bash"]

EXPOSE 80 22
