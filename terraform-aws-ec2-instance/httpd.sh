#!/bin/bash  
 sudo useradd simon  
 sudo yum install httpd -y 
 sudo systemctl start httpd
 sudo systemctl enable httpd 
 sudo echo "<h1>Welcome To Engr Aliogo's Terraform series </h1>" | sudo tee -a /var/www/html/index.html