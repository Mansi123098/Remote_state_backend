terraform {
  backend "s3" {
    bucket         = "statetfbucket12307533"  
    key            = "global/state/terraform.tfstate" 
    region         = "eu-west-3"  

    dynamodb_table = "terraform-locks"
  }
}
