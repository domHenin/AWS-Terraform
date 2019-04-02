#-----networking/variables.tf-----

# Variabel for CIDR
variable "vpc_cidr" {
  description = "variable for CIDR"
  default = "10.123.0.0/16"
}


variable "public_cidrs" {
  type = "list"
  default = [
    "10.123.1.0/24",
    "10.123.2.0/24"
  ]
}

variable "accessip" {
  default = "0.0.0.0/0"
}

//TODO:
//variable: vpc_cidr
//   -set default: 10.123.0.0/16
//
//variable: public_cidrs
//  - set type: list
//  - set default: "10.123.1.0/24", "10.123.2.0/24"
//
//variable: accessip
//  - set default: 0.0.0.0/0