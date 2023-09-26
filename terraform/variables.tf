variable "region" {
  description = "region where we have to provision all services"
  default = "eu-north-1"
}

variable "bucket_name" {
  description = "s3 bucket name"
  default = "terraform-state-file-store1838"
}

variable "key" {
  description = "s3 bucket key"
  default = "global/s3/terraform.tfstate"
}

variable "tf_dynamo_table_name" {
  description = "s3 bucket key"
  default = "terraform-state-file-locks"
}

variable "encrypt" {
  description = "encryption value boolean enabled or disabled"
  default = true
}