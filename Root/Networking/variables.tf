#-----networking/variables.tf-----

# Variabel for CIDR
variable "vpc_cidr" {
  default = "10.123.0.0/16"
}

//TODO:
//variable: vpc_cidr
//   -set default: 10.123.0.0/16