#!/bin/sh

USER_USER="abc"

if [ ! -e /.configured ]; then
   echo "*** Configuring container ***"
   adduser -h /tmp -D "$USER_USER" && touch /.configured
fi

USER_UID="$(id -u $USER_USER)"
USER_GID="$(id -g $USER_USER)"

cat >/app/config.js <<EOF
let config = {
    webhookPort: ${WEBHOOK_PORT:-9867},
    webhookUsername: '${WEBHOOK_USERNAME:-admin}',
    webhookPassword: '${WEBHOOK_PASSWORD:-admin}',
    sirenIpAddress: '${SIREN_IP_ADDRESS}',
    sirenPassword: '${SIREN_PASSWORD}'
};

module.exports = config;
EOF

echo "*** Starting app as user: ${USER_USER} (uid:${USER_UID}/gid:${USER_GID}) ***"
su -l - "$USER_USER" -c '/usr/bin/node /app/index.js'
