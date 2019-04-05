#-----compute/variables.tf-----

# Variable for Key Name
variable "key_name" {
//  default = "tfkey"
}

# Variable for Public Key Path
variable "public_key_path" {
//  default = "/home/ec3-user/.ssh/id_rsa.pub"
}

# Variable for Subnet IPs
variable "subnet_ips" {
  type = "list"
}

# Variable for Instance Count
variable "instance_count" {}

# Variable for Instance Type
variable "instance_type" {}

# Variable for Security Group
variable "security_group" {}

# Variable for Subnets
variable "subnets" {
  type = "list"
}

//TODO:
//varibale: key_name
//  - default: tfkey
//variable: public_key_path
//  - default: "/home/ec3-user/.ssh/id_rsa.pub"
//variable: subnet_ips
//  - type: list
// set no values for below variables
//variable: instance_count
//variable: instance_type
//variable: security_group
//variabel: subnets = list