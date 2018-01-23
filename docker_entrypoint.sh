#!/bin/bash

USER_ID=${LOCAL_USER_ID:-9001}
USER_NAME=${LOCAL_USER_NAME:-dev}

echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u "${USER_ID}" -o -c "" -m dev

chmod 755 -R /home/"${USER_NAME}" /home
chown -R "${USER_NAME}":"$USER_NAME" /home/"${USER_NAME}"
chsh dev -s "$(which zsh)"

exec gosu dev "$@"
