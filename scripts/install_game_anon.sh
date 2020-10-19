#!/bin/sh

# Enable debugging
#set -x

install_game_anon(){
    echo "installing game now.. this could take a while be patient!"
    $CMDDIR/steamcmd.sh \
    +login anonymous \
    +force_install_dir $GAMEDIR \
    +app_update $APPID \
    +quit
}
# if steam doenst exist
if [ ! -f "$CMDDIR/steamcmd.sh" ]
then
    install_steamcmd
fi

install_game_anon
