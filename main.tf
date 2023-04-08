terraform {
required_version = "~> 1.4"       #1.4.4/5/6/7 1.4/5/6/7 Terraform version for running the code
required_providers {
aws = {
source  = "hashicorp/aws" #aws plugin version 3.0 
version = "~> 3.0" #constrained the aws version to the right most value, any version from 3.0 above will be supported
}
}

}

provider "aws" {
  region = var.region #Here iam passing the provider as a variable 
  profile = "obinna"
}
variable "region" {
    description = "Region in which AWS Resources will be created example us-east-1"
    type = string
    #default = "us-east-2" I declared a variable for the provider without giving it default 
    # value, the user will have to pass in the region they want the resources to be created at runtime "us-east-1"

  
}

module "ec2" {
  source = "./terraform-aws-ec2-instance"
instance_key = "app"
ingressrule = [ 80,443,8080,22 ]
egressrule = [ 80,443,25,3306,53,8080 ]
instancetype_list = [ "t2.micro", "t2.medium", "t3.micro", "t2.small" ]
names_server = ["Dev", "UAT", "Prod", "sales"]
user-data = file("./terraform-aws-ec2-instance/httpd.sh")
}
#Very important the key above can 
#Though we have output block in our module but we dont seem to get or see those attribute after apply while calling our module 
#This is because to get an output of a module outside the module, you will have to create an output block in the module calling file

output "PublicIP" {
  value = module.ec2.PublicIP #module.modulename.name of your output block or label in the module
}

output "instance_id" {
 value = module.ec2.instance_id
}

output "amidata" {
  value = module.ec2.amidata
}
output "Internet_traffic" {
  value = module.ec2.Internet_traffic
}