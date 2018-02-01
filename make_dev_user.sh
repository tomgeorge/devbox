#!/bin/sh
USER_ID=${LOCAL_USER_ID:-1000}
USER_NAME=${LOCAL_USER_NAME:-dev}

echo "creating with UID : $USER_ID"
useradd --shell /bin/bash -u "${USER_ID}" -o -c "" -m dev
echo "dev:dev" | chpasswd
usermod -aG sudo dev
