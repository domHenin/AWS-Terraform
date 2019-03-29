#-----root/output.tf-----

# Output Bucket Name
output "Bucket Name" {
  value = "${module.storage.bucketname}"
}

//TODO::
//output: Bucket Name
//  set value to module.bucketname