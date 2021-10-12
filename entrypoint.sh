#!/bin/sh

USER_USER="abc"

if [ ! -e /.configured ];
then
   echo "*** Configuring container ***"
   adduser -h /tmp -D "$USER_USER" && touch /.configured
fi

USER_UID="$(id -u $USER_USER)"
USER_GID="$(id -g $USER_USER)"
echo "*** Starting app as user: ${USER_USER} (uid:${USER_UID}/gid:${USER_GID}) ***"
su -l - "$USER_USER" -c '/usr/bin/node /app/index.js'
