#!/bin/sh

# Enable debugging
#set -x

# set variables for the server?
SAVEDIR="/root/Zomboid"
mkdir -p "$SAVEDIR"
chown -R ${USERID}:${GROUPID} $SAVEDIR

start_project_zomboid(){
    $GAMEDIR/start-server.sh -servername skinkerne -adminpassword 2264552
}

start_project_zomboid
