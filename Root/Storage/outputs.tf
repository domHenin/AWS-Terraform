#-----storage/outputs.tf-----

# Output Bucket Name
output "bucketname" {
  value = "${aws_s3_bucket.tf_code.id}"
}


//TODO:
//output: bucketname
//set value to reference aws_bucket.id