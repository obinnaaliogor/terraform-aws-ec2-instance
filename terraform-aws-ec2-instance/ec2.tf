
resource "aws_instance" "web" {
  #instance_type = var.instance_type
  #instance_type = var.instancetype_list[0] #With this kind of index, you can only access resource in a list one by one
  #With the use of length a terraform fxn, you will return or access all the element in a list or map
  #instance_type = var.instancetype_map["qa"]
  instance_type = var.instancetype_list[count.index]
  count = length(var.names_server)
  ami = data.aws_ami.RedHat.id
  user_data = var.user-data #file("./terraform-aws-ec2-instance/httpd.sh")
  
#vpc_security_group_ids = [aws_security_group.Webtraffic.id, aws_security_group.vpc_sg.id ]
vpc_security_group_ids = [aws_security_group.Internet_traffic.id]
key_name = var.instance_key
#You can attach multiple security group to an instance
  tags = {
    #Name = "prod-${count.index}" #You can also use prod-${count.index} when the name or tag is the same
  Name = var.names_server[count.index]
  }
}

