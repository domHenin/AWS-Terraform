#-----root/main.tf-----

# Create AWS Region
provider "aws" {
  region = "${var.aws_region}"
}

terraform {
  backend "s3" {
    bucket = "lat-terraform-course-state"
    key = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
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

# Deploy Compute Resource
module "compute" {
  source = "./compute"
  instance_count = "${var.instance_count}"
  key_name = "${var.key_name}"
  public_key_path = "${var.public_key_path}"
  instance_type = "${var.server_instance_type}"
  subnets = "${module.networking.public_subnets}"
  security_group = "${module.networking.public_sg}"
  subnet_ips = "${module.networking.subnet_ips}"
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
//create module: compute
//   set source: ./compute