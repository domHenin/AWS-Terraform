#-----root/output.tf-----

#-----storage/outputs
# Output Bucket Name
output "Bucket Name" {
  value = "${module.storage.bucketname}"
}

#-----networking/output
# Output Public Subnets
output "Public Subnets" {
  value = "${join(", ", module.networking.public_subnets)}"
}

#Output Subnet IPs
output "Subnet IPs" {
  value = "${join(", ", module.networking.subnet_ips)}"
}

# Output Public Security Group
output "Public Security Group" {
  value = "${module.networking.public_sg}"
}

#-----compute/outputs

# Output Public Instance IDs
output "Public Instance IDs" {
  value = "${module.compute.server_id}"
}

# Output Public Instance IPs
output "Public Instance IPs" {
  value = "${module.compute.server_ip}"
}

//TODO::
//output: Bucket Name
//  set value to module.bucketname
//output: Public Subnets
//  set value: ${join(", ", module.networking.public_subnets)}
//output: Subnet IPs
//  set value: "${join(", ", module.networking.subnet_ips)}"
//output: Public Security Group
//  set value: reference network modules subnet_ips
//output: Public Instance IDs
//  set value: reference compute modules server_id
//output: Public Instance IPs
//  set value: reference copute modues server_ip

