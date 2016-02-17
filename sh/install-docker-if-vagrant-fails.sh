apt-get update && apt-get install -y apt-transport-https ca-certificates
gpg --import docker-public-key.txt
touch /etc/apt/sources.list.d/docker.list
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list
apt-get update && apt-get purge lxc-docker
apt-get update && apt-get install linux-image-extra-$(uname -r) apparmor
apt-get install docker-engine
sudo service docker start
gpasswd -a vagrant docker
echo "logout and log back in"
