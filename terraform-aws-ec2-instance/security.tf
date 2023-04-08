#SECURITY GROUP WITHOUT DYNAMIC BLOCKS
/*resource "aws_security_group" "Webtraffic" {
  name        = "Webtraffic"
  description = "Allow http and https inbound traffic"

  ingress {
    description      = "allow http and https"
    from_port        = 80
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Webtraffic"
  }
}


resource "aws_security_group" "vpc_sg" {
  name        = "vpc_sg"
  description = "Allow ssh inbound traffic"

  ingress {
    description      = "allow ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpc_sg"
  }
}
*/

#Create SECURITY GROUP WITH DYNAMIC BLOCKS AND OPEN THE BELOW PORT
#Requirment ingress = 80,443,8080,22 and egress = 80,443,25,3306,53,8080


resource "aws_security_group" "Internet_traffic" {
  name        = "Allow TCP traffic"
  description = " opening custom port"
 
  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrule
    content {
    from_port        = port.value
    to_port          = port.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  }

 dynamic "egress" {
    iterator = port #This is a mechanism that loops through our port in variable igressrule
    for_each = var.egressrule #This is a condition "for_each" of our port in egressrule do what?
    # We use content block to group the "from_port" and "to_port"
    content {
    from_port        = port.value #iterator.value, port is entered here because iterator = port
                                  #and .value = the value of our port 
    to_port          = port.value
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
 }

  tags = {
    Name = "Internet_traffic"
  }
}


