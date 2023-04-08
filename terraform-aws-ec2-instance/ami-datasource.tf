data "aws_ami" "RedHat" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["RHEL-9.0.0_HVM-*-Hourly2-GP2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  
}

#to get the ami it will be data.resourcetype.resourcename.attribute #attribute is id
#This ami id that will be gotten will be passed into the ami fild in the instance