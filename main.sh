#!/bin/bash
cd /home/ubuntu/Project_CollegeWebsite/Infrastructure/terraform/vpc
terraform init
terraform apply -auto-approve
cd /home/ubuntu/Project_CollegeWebsite/Infrastructure/terraform/rds
terraform init
terraform apply -auto-approve
chmod +x setvars.sh
bash setvars.sh
cd /home/ubuntu/Project_CollegeWebsite/Infrastructure/terraform/ami
terraform init
terraform apply -auto-approve
chmod +x inventory.sh
bash inventory.sh
cd /home/ubuntu/Project_CollegeWebsite/Infrastructure/ansible
echo "Waiting for instance to initialize(120sec)"
sleep 30
echo '90 sec left'
sleep 30
echo '60 sec left'
sleep 30
echo '30 sec left'
sleep 30
ansible-playbook ami.yml
cd /home/ubuntu/Project_CollegeWebsite/Infrastructure/terraform/ami-builder
terraform init
terraform apply -auto-approve
cd /home/ubuntu/Project_CollegeWebsite/Infrastructure/terraform/asg
terraform init
terraform apply -auto-approve
