#!/bin/bash -e

[ "$(id -u)" == "0" ] || (echo "Must be root" && exit 1)

echo "I am confortable, and you ?"
echo "Installing docker..."

apt-get update
apt-get install apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
cat >> /etc/apt/sources.list.d/docker.list << EOF 
deb https://apt.dockerproject.org/repo ubuntu-trusty main 
EOF
apt-get update
apt-get purge lxc-docker
apt-cache policy docker-engine
apt-get install -y docker-engine
groupadd docker || true
gpasswd -a $(logname) docker

echo "Installing docker-compose..."
curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s-uname -m` > /usr/local/bin/docker-compose
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose
chmod +x /usr/local/bin/docker-compose /etc/bash_completion.d/docker-compose

