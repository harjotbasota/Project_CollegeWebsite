The development of a dynamic College Website was carried using a robust tech stack comprising Django, HTML, and CSS. To ensure optimal performance and scalability, we leveraged AWS infrastructure, employing an autoscaling group with a load balancer to handle traffic efficiently. Our database is securely housed within a private subnet, aligning with industry best practices for data protection. The deployment process was streamlined using Terraform, guaranteeing consistency and reliability across our infrastructure. Ansible playbooks were instrumental in provisioning, maintaining, and configuring our systems, enabling seamless management. Additionally, we implemented a series of shell scripts to automate repetitive tasks, enhancing efficiency and reducing manual intervention.
To launch this project 
- This project needs aws region us-east-1 due to region name being hardcorded in django-app and provider block of all the terraform modules and other terraform code such as availability zones
- Launch an ubuntu instance on aws( Ubuntu 22.04.4 LTS) which will serve as control node
- Clone this github repo at /home/ubuntu/
- Change the mod of setup.sh into executalbe( chmod +x setup.sh)
- Set your aws credentials at ~/.aws/credentials as default profile
- Go to Project_CollegeWebsite/Infrastructure/ansible/secrets and write you credentials and sshkeys into the required files
- execute the setup.sh to install all the requirements for this project 
- Before you launch the project you might also need to update the variable files in all terraform modules i.e, Project_CollegeWebsite/Infrastructur/terraform. 
  (NOTE --  some of the variables might need special attention such as ssh_key_name, ami for instance to use( use Ubuntu 22.04.4 LTS)
- Execute main.sh to launch this project
- Use elb dns to access the website
- Execute cleanup.sh to delete the resources created from this project
