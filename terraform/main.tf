provider "aws" {
  region = var.region
}

// specify backendto store tf state file
terraform {
  backend "s3" {
    bucket         = var.bucket_name
    key            = var.key
    region         = var.region

    dynamodb_table = var.tf_dynamo_table_name
    encrypt        = var.encrypt
  }
}