#! /bin/bash

#Install Docker
echo "Installing Docker"
yes | sudo yum install docker
sudo service docker start
sudo usermod -a -G docker ec2-user

#Docker compose
echo "Installing Docker Compose"
sudo curl -L https://github.com/docker/compose/releases/download/1.20.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
