#! /bin/bash

echo "Updating packages"
yes | sudo yum update

echo "Installing git"
yes | sudo yum install git

echo "Cloning Repo for DAGs, etc"
echo "Cloning Repo"
sudo git clone https://github.com/adrianoarenas/job_search_automation.git /home/ec2-user/job_search_automation

echo "Executing /init_file.sh"
sudo chmod 777 /home/ec2-user/job_search_automation/init_file.sh
/home/ec2-user/job_search_automation/init_file.sh