#!/bin/sh

# Enable debugging
#set -x

if [ ${USERID:-0} -ne 0 ] && [ ${GROUPID:-0} -ne 0 ]
then
    echo "Changing userid to ${USERID} and groupid to ${GROUPID}"
    usermod -u ${USERID} steam
    groupmod -g ${GROUPID} steam
    mkdir -p "${CMDDIR}"
    mkdir -p "${GAMEDIR}"
    chown -R ${USERID}:${GROUPID} ${HOMEDIR}
fi
# change after this line
