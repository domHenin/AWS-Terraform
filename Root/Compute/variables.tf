#-----compute/variables.tf-----

# Variable
variable "key_name" {
  default = "tfkey"
}

# Variable
variable "public_key_auth" {
  default = "/home/ec3-user/.ssh/id_rsa.pub"
}