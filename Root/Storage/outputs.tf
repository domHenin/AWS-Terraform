#-----storage/outputs.tf-----

# Output
output "bucketname" {
  value = "${aws_s3_bucket.tf_code.id}"
}