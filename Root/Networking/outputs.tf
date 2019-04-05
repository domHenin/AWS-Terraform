#-----networking/outputs.tf-----

# Output Public Subnets
output "public_subnets" {
  value = "${aws_subnet.tf_public_subnet.*.id}"
}

# Output Public Security Group
output "public_sg" {
  value = "${aws_security_group.tf_public_sg.id}"
}

# Output
output "subnet_ips" {
  value = "${aws_subnet.tf_public_subnet.*.cidr_block}"
}