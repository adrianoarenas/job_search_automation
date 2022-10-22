#! /bin/bash

#Install Docker
echo "Installing Docker + Docker Compose"
yes | sudo apt install docker.io

#Docker compose
echo "Docker Compose download + Setup"
yes "" | sudo add-apt-repository universe
yes | sudo apt install docker-compose
echo "Docker compose setup finished"
echo " "

#setup for AirFlow
echo "Creating plugins + logs folders"
mkdir /home/ubuntu/plugins /home/ubuntu/logs
echo " "

echo "Setting up env variables"
sudo chmod 777 /home/ubuntu/job_search_automation/Docker/
echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" > .env
echo " "

echo "Changing directory to use docker compose file"
cd /home/ubuntu/job_search_automation/Docker/
sudo docker-compose up airflow-init
sudo docker-compose up -d
