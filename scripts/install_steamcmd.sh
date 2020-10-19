#!/bin/sh

# Enable debugging
#set -x

install_steamcmd(){
    echo "Steamcmd not found installing steamcmd..."
    wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz -P $CMDDIR
    tar -xf $CMDDIR/steamcmd_linux.tar.gz -C $CMDDIR
    rm $CMDDIR/steamcmd_linux.tar.gz
}
if [ ! -f "$CMDDIR/steamcmd.sh" ]
then
    install_steamcmd
fi