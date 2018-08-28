#!/bin/sh

# Docker

apt-get update
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install docker-ce

# Docker-compose 
curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Firewall 
apt-get install ufw
ufw default allow outgoing
ufw default deny incoming
ufw allow ssh/tcp
ufw limit ssh/tcp
ufw allow 24157/tcp
ufw allow 24156/tcp
ufw allow sftp/tcp
ufw logging on
ufw enable

#FailToBan
apt -y install fail2ban
systemctl enable fail2ban
systemctl start fail2ban

#Anti Rootkit
apt -y install rkhunter