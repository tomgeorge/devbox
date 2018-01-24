#!/bin/bash

USER_ID=${LOCAL_USER_ID:-9001}
USER_NAME=${LOCAL_USER_NAME:-dev}

echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u "${USER_ID}" -o -c "" -G docker -m dev

find . -type d -exec chmod 775 {} \;
chown -R "${USER_NAME}":"$USER_NAME" /home/"${USER_NAME}"
chsh dev -s "$(which zsh)"

exec gosu dev "$@"
