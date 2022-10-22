#! /bin/bash

#Install Docker
echo "Installing Docker + Docker Compose"
yes | sudo apt install docker.io

#Docker compose
echo "Docker Compose download + Setup"
yes "" | sudo add-apt-repository universe
Y | sudo apt install docker-compose
echo "Docker compose setup finished"
echo " "

#setup for AirFlow
echo "Creating plugins + logs folders"
mkdir /home/ubuntu/plugins /home/ubuntu/logs
echo " "

echo "Setting up env variables"
export AIRFLOW_UID=$(id -u)
export AIRFLOW_GID=0
echo " "


echo "Changing directory to use docker compose file"
cd /home/ubuntu/job_search_automation/Docker/
docker compose up airflow-init
docker compose up -d