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

echo "Making necessary folders"
sudo mkdir -m777 scripts
sudo mkdir -m777 airflow-logs

echo "Making entrypoint executable"
echo -e '#!/usr/bin/env bash
airflow upgradedb
airflow webserver
' > scripts/airflow-entrypoint.sh


echo "Setting Env variables"
echo "AIRFLOW__CORE__LOAD_DEFAULT_CONNECTIONS=False
AIRFLOW__CORE__SQL_ALCHEMY_CONN=postgres+psycopg2://airflow:airflow@postgres:5432/airflow
AIRFLOW_CONN_METADATA_DB=postgres+psycopg2://airflow:airflow@postgres:5432/airflow
AIRFLOW_VAR__METADATA_DB_SCHEMA=airflow
AIRFLOW__SCHEDULER__SCHEDULER_HEARTBEAT_SEC=10
" > .env