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

echo "changing directory to docker dir"
cd /home/ec2-user/job_search_automation/Docker/

echo "creating folders"
sudo mkdir -p ./dags ./logs ./plugins

echo "creating env var"
sudo echo -e "AIRFLOW_UID=$(id -u)" > .env

docker-compose up -d