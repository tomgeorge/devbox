#!/bin/bash

USER_ID=${LOCAL_USER_ID:-1000}
USER_NAME=${LOCAL_USER_NAME:-dev}

echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u "${USER_ID}" -o -c "" -m dev
echo "dev:dev" | chpasswd
usermod -aG docker dev
usermod -aG sudo dev
find . -type d -exec chmod 775 {} \;
chown -R "${USER_NAME}":"$USER_NAME" /home/"${USER_NAME}"
chsh dev -s "$(which zsh)"

exec gosu dev "$@"
