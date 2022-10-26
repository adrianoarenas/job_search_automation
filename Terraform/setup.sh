#! /bin/bash

echo "Updating packages"
yes | sudo yum update

echo "Cloning Repo for DAGs, etc"
echo "Cloning Repo"
git clone https://github.com/adrianoarenas/job_search_automation.git /home/ubuntu/job_search_automation

echo "Executing /init_file.sh"
/home/ubuntu/job_search_automation/init_file.sh