provider "aws" {
  region = var.region
}

// specify backendto store tf state file
terraform {
  backend "s3" {
    bucket         = "terraform-state-file-store1838"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-north-1"

    dynamodb_table = "terraform-state-file-locks"
    encrypt        = true
  }
}

module "lambda" {
	source = "./lambda"
}

module "dynamodb" {
	source = "./dynamodb"
}

module "sqs" {
	source = "./SQS"
}