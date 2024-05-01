#!/bin/bash
# This script is used to send out db endpoint and secret name dynamically to our django aap 
secret_name=$(terraform output secret_name)
db_name=$(terraform output db_name)
db_name=${db_name%:*}
db_name=${db_name#'"'}
secret_name=${secret_name#*secret:}
secret_name=${secret_name%-*}
echo $db_name > /home/ubuntu/Project_CollegeWebsite/django/db_name.txt
echo $secret_name > /home/ubuntu/Project_CollegeWebsite/django/secret_name.txt
echo "Your database password for this project can be found at aws secrets manager under"
echo $secret_name
echo "Your database endpoint is "
echo $db_name
