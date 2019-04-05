# Variable for Region
aws_region = "us-east-1"

# Variable for Project Name
project_name = "la-terraform"

# Variable for VPC CIDR
vpc_cidr = "10.123.0.0/16"

# Variable for Public CIDRS
public_cidrs = [
  "10.123.1.0/24",
  "10.123.2.0/24"
]

# Variable for Access Ip
access_ip = "0.0.0.0/0"

# Variable for Key Name
key_name = "tf_key"

# Variable for Public Key Path
public_key_path = "/home/ec2-user/.ssh/id_rsa.pub"

# Variable for Server Instance Type
server_instance_type = "t2.micro"

# Variable for Instance Count
instance_count = 2


//TODO::
//variable: aws_region = us-west-2
//variable: project_name = la-terraform
//variable: vpc_cidr = 10.123.0.0/16
//variable: public_cidrs = [10.123.1.0/24, 10.123.2.0/24]
//variable: access_ip = 0.0.0.0/0
//variable: key_name = tf_key
//variable: public_key_path = "/home/ec2-user/.ssh/id_rsa.pub"
//variable: server_instance_type = t2.micro
//variable: instance_count = 2