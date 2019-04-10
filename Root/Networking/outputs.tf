#-----networking/outputs.tf-----

# Output Public Subnets
output "public_subnets" {
  value = "${aws_subnet.tf_public_subnet.*.id}"
}

# Output Public Security Group
output "public_sg" {
  value = "${aws_security_group.tf_public_sg.id}"
}

# Output Subnet IPs
output "subnet_ips" {
  value = "${aws_subnet.tf_public_subnet.*.cidr_block}"
}

//TODO::
//output: public_subnets
//  set value: refrence subnet -> .*.id
//output: public_sg
//  set value: reference security group -> .id
//output: subnet_ips
//  set value: reference subnet -> .*.cider_block
