#!/bin/bash
sudo apt-get update
sudo apt-get install unzip
echo "Installing Terraform"
sleep 5
wget https://releases.hashicorp.com/terraform/1.8.2/terraform_1.8.2_linux_amd64.zip
unzip terraform_1.8.2_linux_amd64.zip
sudo mv terraform /usr/local/bin/

echo "Installing ansible (2.10.8)"
sleep 5
sudo apt-get install ansible -y

echo "Installing boto3"
sudo apt-get install python3-boto3 -y

cd /home/ubuntu/Project_CollegeWebsite
chmod +x main.sh
chmod +x cleanup.sh
sudo chmod 400 /home/ubuntu/Project_CollegeWebsite/Infrastructure/ansible/secrets/sshkey.pem
