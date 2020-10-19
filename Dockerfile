############################################################
# Dockerfile that contains SteamCMD and GAME
############################################################
FROM debian:stretch-slim

LABEL maintainer="pjoeecontact@gmail.com"
# update and install req packages
# Clean packages
RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		lib32gcc1 \
		lib32stdc++6 \
		libstdc++6 \
		libc6-dev \
		wget \
        ca-certificates \
	&& rm -rf /var/lib/apt/lists/*
# create a user
ENV UNAME steam
RUN groupadd steam \
    && useradd -m ${UNAME} -g steam
# set enviroment
ENV USERID=1000 \
    GROUPID=1000 \ 
    SCRIPTSDIR=/usr/local/bin \
    HOMEDIR=/home/${UNAME} \
    CMDDIR=/home/${UNAME}/steamcmd \
    GAMEDIR=/home/${UNAME}/game \
    APPID=0 \
    UPDATEGAME=0

# Copy the entrypoint script
ADD scripts/ ${SCRIPTSDIR}
# make the scripts executeable
RUN find ${SCRIPTSDIR} -type f -iname "*.sh" -exec chmod +x {} \;
# change to user
# Set Entrypoint:
ENTRYPOINT ${SCRIPTSDIR}/docker_entrypoint.sh