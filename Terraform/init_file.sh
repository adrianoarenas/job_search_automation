#! /bin/bash

#Update to latest
echo "Updating packages"
sudo apt-get update

#Cloning Repo for DAGs, etc
echo "Cloning Repo"
git clone https://github.com/adrianoarenas/job_search_automation.git /home/ubuntu/job_search_automation

#chmod +x job_search_automation/init_file.sh
#./job_search_automation/init_file.sh

#Install Docker
echo "Installing Docker + Docker Compose"
yes | sudo apt install docker.io

#Docker compose
echo "Docker Compose download + Setup"
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.12.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
echo "Docker compose setup finished"
echo "\n"

#setup for AirFlow
echo "Creating plugins + logs folders"
mkdir /home/ubuntu/plugins /home/ubuntu/logs
echo "\n"

echo "Setting up env variables"
export AIRFLOW_UID=$(id -u)
export AIRFLOW_GID=0
echo "\n"

#Executing Docker Compose for Airflow et al
echo "Adding docker to user group + allowing to use it"
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
echo "\n"

echo "Changing directory to use docker compose file"
cd /home/ubuntu/job_search_automation/Docker/
docker compose up airflow-init
docker compose up -d