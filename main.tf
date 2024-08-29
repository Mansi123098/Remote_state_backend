# s3_bucket.tf
provider "aws" {
  region = "eu-west-3" 
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "statetfbucket12307533"  
  tags = {
    Name        = "Terraform State Bucket"
  }
}


resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-locks"
  billing_mode    = "PAY_PER_REQUEST" 
  hash_key        = "LockID"

  attribute {
    name = "LockID"
    type = "S"  
  }

  tags = {
    Name        = "Terraform Lock Table"
  }
}

resource "aws_instance" "ec2in1" {
    ami = "ami-0e141aee2812422a2"
    instance_type = "t2.micro"
  
}
