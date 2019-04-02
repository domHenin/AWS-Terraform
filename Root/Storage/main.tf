#-----storage/main.tf-----

# Create a Random ID
resource "random_id" "tf_bucket_id" {
  byte_length = 2
}

# Create the Bucket
resource "aws_s3_bucket" "tf_code" {
  bucket = "${var.project_name}-${random_id.tf_bucket_id.dec}"
  acl = "private"
  force_destroy = true

  tags {
    Name = "tf_bucket"
  }
}


//TODO::
//random_id: tf_bucket_id
//  length 2
//aws_bucket: tf_code
//  use variables- refrence random_id.dec
//set acl -> private
//set destroy
//set tag -> tf_bucket