#-----compute/outputs.tf-----

# Output Server ID
output "server_id" {
  value = "${join(", ", aws_instance.tf_server.*.id)}"
}

# Output Server Ip
output "server_ip" {
  value = "${join(", ", aws_instance.tf_server.*.public_ip)}"
}

//TODO:
//output: server_id
//  - set value: ${join(", ", aws_instance.tf_server.*.id)}
//output: server_ip
//- set value: ${join(", ", aws_instance.tf_server.*.public_ip)}

