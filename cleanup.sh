#!/bin/bash
cd /home/ubuntu/Project_CollegeWebsite/Infrastructure/terraform/asg
terraform destroy -auto-approve
cd /home/ubuntu/Project_CollegeWebsite/Infrastructure/terraform/ami-builder
terraform destroy -auto-approve
cd /home/ubuntu/Project_CollegeWebsite/Infrastructure/terraform/ami
terraform destroy -auto-approve
cd /home/ubuntu/Project_CollegeWebsite/Infrastructure/terraform/rds
terraform destroy -auto-approve
cd /home/ubuntu/Project_CollegeWebsite/Infrastructure/terraform/vpc
terraform destroy -auto-approve
