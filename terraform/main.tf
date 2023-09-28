provider "aws" {
  region = var.region
}

// specify backend s3 to store tf state file and dynamodb for state lock 
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
	tags = var.tags
	table_name = var.table_name
	lambda_dynamodb_role_name = var.lambda_dynamodb_role_name
	lambda_dynamodb_policy_name = var.lambda_dynamodb_policy_name
	lambda_policy_description = var.lambda_policy_description
	source_dir = var.source_dir
	output_path = var.output_path
	file_name = var.file_name
	lambda_dynamodb_function_name = var.lambda_dynamodb_function_name
	dynamodb_lambda_handler = var.dynamodb_lambda_handler
	lambda_runtime = var.lambda_runtime
	lambda_sqs_role_name = var.lambda_sqs_role_name
	lambda_sqs_policy_name = var.lambda_sqs_policy_name
	sqs_lambda_function_name = var.sqs_lambda_function_name
	sqs_lambda_handler = var.sqs_lambda_handler
	sqs_url = module.sqs.payment_sqs_arn
}

module "dynamodb" {
	source = "./dynamodb"
	tags = var.tags
	table_name = var.table_name
	db_billing_mode = var.db_billing_mode
	read_capacity = var.read_capacity
	write_capacity = var.write_capacity
	hash_key = var.hash_key
	attribute_name = var.attribute_name
}

module "sqs" {
	source = "./SQS"
	tags = var.tags
	sqs_name = var.sqs_name
	dead_letter_queue_name = var.dead_letter_queue_name
	terraform_lambda_func_arn = module.lambda.terraform_lambda_func_arn
}

module "sns" {
	source = "./SNS"
	tags = var.tags
	topic_name = var.topic_name
	sns_protocol = var.sns_protocol
	sqs_lambda_function_name = var.sqs_lambda_function_name
	terraform_lambda_sqs_func_arn = module.lambda.terraform_lambda_sqs_func_arn
}