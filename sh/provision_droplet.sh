#!/bin/bash
apt-get update && \
apt-get install make zsh vim wget

#gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
#\curl -sSL https://get.rvm.io | bash -s stable
USER_ID=${LOCAL_USER_ID:-1000}
USER_NAME=${LOCAL_USER_NAME:-dev}

echo "creating with UID : $USER_ID"
useradd --shell /bin/bash -u "${USER_ID}" -o -c "" -m dev
echo "dev:dev" | chpasswd
usermod -aG sudo,docker dev
echo 'dev	ALL=(ALL:ALL) ALL' >> /etc/sudoers
mkdir -p ~dev/.ssh 
chown -R dev:dev ~dev/.ssh
cp ~/.ssh/authorized_keys ~dev/.ssh/authorized_keys
cp ~/.ssh/id_rsa* ~dev/.ssh/
chown -R dev:dev ~dev/.ssh/*

cd sh && ./make_ssh_keys_image.sh && cd -

echo "set -o vi >> ~dev/.bashrc"
