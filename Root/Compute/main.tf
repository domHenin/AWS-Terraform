#-----compute/main.tf-----

# Build AMI
data "aws_ami" "server_ami" {
  most_recent = true

  filter {
    name = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name = "name"
    values = ["amzn-ami-hvm*-x86_64-gp2"]
  }
}

# Build Key Pair
resource "aws_key_pair" "tf_auth" {
  key_name = "${var.key_name}"
  public_key = "${var.public_key_path}"
}

# Build Template File
data "template_file" "user-init" {
  count = 2
  template = "${file("${path.module}/userdata.tpl")}"

  vars {
    firewall_subnets = "${element(var.subnet_ips, count.index)}"
  }
}

# Build EC2 Instance
resource "aws_instance" "tf_server" {
  count = "${var.instacne_count}"
  ami = "${data.aws_ami.server_ami.id}"
  instance_type = "${var.instance_type}"

  tags {
    Name = "${aws_instance.tf_server}-${count.index+1}"
  }

  key_name = "${aws_key_pair.tf_auth.id}"
  vpc_security_group_ids = ["${var.security_group}"]

  subnet_id = "${element(var.subnets, count.index)}"

  user_data = "${data.templae_file.user-init.*.rendered[count.index]}"
}

//TODO:
//data: server_ami
//  - most-recent:: true
//  - filter:
//    - name: owner-alias
//    - values: amazon
//  - filter:
//    - name: name
//    - values: amzn-ami-hvm*-x86_64-gp2
//resource: tf_auth
//  - key name: use variable
//  - public key: use variable
//resource: tf_server
//  - count: use variable
//  - instance type: use variable
//  - ami: refrence server_ami.id
//  - tags: refrence tf_server-${count.index+1
//  - key name: refrence key_pair.tf_auth.id
//  - vpc security group: use variable
//  - subnet id: element:: use variabel, and count index
//  -user data: ${data.template_file.user-init.*.rendered[cont.index]}
//data: user_init (template_file)
//  - count: 2
//  - template: file("${path.module}/userdata.tpl")
//  - vars: firewall subnet: element:: use variables(subnet_ips), count index