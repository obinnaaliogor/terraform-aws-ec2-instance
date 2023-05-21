

/*output "securitygroup_id" {
    value = aws_security_group.Webtraffic.id
  
}*/
output "PublicIP" {
  value = aws_instance.web.*.public_ip #Added "*" b/c we are creating multiple instances and needs all their IP
}

output "instance_id" {
  value = aws_instance.web.*.id #Added "*" it is called splat operator b/c we are creating multiple instances and needs all their IDS
}

output "amidata" {
value = data.aws_ami.RedHat.id
  
}

/*output "vpc_sg_id" {
  value = aws_security_group.vpc_sg.id
}
*/
output "Internet_traffic" {
  value = aws_security_group.Internet_traffic.id
}
