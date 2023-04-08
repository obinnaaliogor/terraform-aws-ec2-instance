# Input Variables

# AWS Region
/*variable "region" {
    description = "Region in which AWS Resources will be created"
    type = string
    #default = "us-east-2"
  
}
*/

# AWS EC2 Instance Type
/*variable "instance_type" {
    description = "aws instance type"
    type = string
    default = "t2.micro"
  
}*/

# AWS EC2 Instance AMI
/*variable "web_ami" {
    type = string
    description = "The aws ami"
    default = "ami-0103f211a154d64a6"
  
}*/

# AWS EC2 Instance key pair
variable "instance_key" {
    description = "aws instance keypair"
    type = string
    #default = "app"
    }

# AWS EC2 Instance Security Group
    variable "ingressrule" {
    description = "This is an inbound traffic rule"
  type = list(number)
  #default = [ 80,443,8080,22 ]
}
variable "egressrule" {
    description = "This is an outbound traffic rule"
  type = list(number)
  #default = [ 80,443,25,3306,53,8080 ]
}

# AWS EC2 Instance Type List
variable "instancetype_list" {
  type = list(string)
  #default = [ "t2.micro", "t2.medium", "t3.micro" ]
  
}

/*# AWS EC2 Instance Type Map
variable "instancetype_map" {
  type = map(string)
  default = {
    "qa" = "t2.micro"
    "dev" = "t3.micro"
    "stag" = "t2.medium"
    }
  }
  
}*/
variable "names_server" {
  type = list(string)
  #default = ["Dev", "UAT", "Prod"]
  
}
variable "user-data" {
  type = string
  description = "This will be used to pass userdata"
  #default = file("./terraform-aws-ec2-instance/httpd.sh")
}