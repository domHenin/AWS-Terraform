#-----compute/variables.tf-----

# Variable
variable "key_name" {
  default = "tfkey"
}

# Variable
variable "public_key_path" {
  default = "/home/ec3-user/.ssh/id_rsa.pub"
}

//TODO:
//varibale: key_name
//  - default: tfkey
//variable: public_key_path
//  - default: "/home/ec3-user/.ssh/id_rsa.pub"