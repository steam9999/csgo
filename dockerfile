############################################################
# Dockerfile that contains SteamCMD
############################################################
FROM centos
LABEL maintainer="steam12345@gmail.com"

RUN        yum update -y \
	&& yum install wget glibc.i686 libstdc++.i686 -y \
	&& useradd -m steam \
	&& su - steam \
	&& mkdir -p /home/steam/steamcmd \
	&& cd /home/steam/steamcmd \
	&& wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
        && tar -zxvf steamcmd_linux.tar.gz \
        && rm steamcmd_linux.tar.gz
# Switch to user steam
USER steam

VOLUME /home/steam/steamcmd
