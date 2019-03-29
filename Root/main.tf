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

//TODO::
//create provider aws
//  region: use variable
//create module: storage
//  set source to ./storage
//  set project name to a variable