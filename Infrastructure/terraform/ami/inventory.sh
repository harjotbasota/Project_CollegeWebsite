#!/bin/bash
# This scipt is used to set ami instance as inventory for ansible 
echo "[webservers]"> /home/ubuntu/Project_CollegeWebsite/Infrastructure/ansible/inventory/hosts
myip=$(terraform output ami-instance-public-ip)
myip=${myip#'"'}
myip=${myip%'"'}
echo $myip >> /home/ubuntu/Project_CollegeWebsite/Infrastructure/ansible/inventory/hosts
echo "Ansbile inventory has been updated to "
echo ""
cat /home/ubuntu/Project_CollegeWebsite/Infrastructure/ansible/inventory/hosts
