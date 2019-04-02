#-----root/main.tf-----

# Create AWS Region
provider "aws" {
  region = "${var.aws_region}"
}

# Deploy Storage Resource
module "storage" {
  source = "./storage"
  project_name = "${var.project_name}"
}

# Deploy Networking Resources
module "networking" {
  source = "./networking"
  vpc_cidr = "${var.vpc_cidr}"
  public_cidrs = "${var.public_cidrs}"
  accessip = "${var.access_ip}"
}

//TODO::
//create provider aws
//  region: use variable
//create module: storage
//  set source to ./storage
//  set project name to a variable
//create module: networking
//   set source: ./networking
//   set vpc_cidr: variable
//   set accessship: variable