#!/bin/sh

# Enable debugging
#set -x

# set variables for the server?
SAVEDIR="/root/.local/share/7DaysToDie/"
mkdir -p "$SAVEDIR"
chown -R ${USERID}:${GROUPID} $SAVEDIR

start_server_7dtd(){
    config_exist
    ln -s $CMDDIR/linux64/steamclient.so /lib/x86_64-linux-gnu
    $GAMEDIR/7DaysToDieServer.x86_64 -logfile 7DaysToDieServer_Data/output_log__`date +%Y-%m-%d__%H-%M-%S`.txt -configfile=$SAVEDIR/serverconfig.xml -quit -batchmode -nographics -dedicated
}
config_exist(){
    if [ ! -f "$SAVEDIR/serverconfig.xml" ]
    then
        echo "config file not found, copying now"
        cp $GAMEDIR/serverconfig.xml $SAVEDIR
    fi
}

start_server_7dtd
