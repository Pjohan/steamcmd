#!/bin/sh

# Enable debugging
#set -x

#set user
set_user.sh
#update / install steamcmd
install_steamcmd.sh
#start server
#7dtd
if [ "$APPID" = "294420" ]; then
    echo "Choosen 7 days to die"
    if [ ! -f "$GAMEDIR/7DaysToDieServer.x86_64" ]
    then
        install_game_anon.sh
    fi
    start_server_7dtd.sh
fi;
#project zomboid
if [ "$APPID" = "380870" ]; then
    echo "Choosen project zomboid"
    if [ ! -f "$GAMEDIR/start-server.sh" ]
    then
        install_game_anon.sh
    fi
    start_project_zomboid.sh
fi;
#update server?