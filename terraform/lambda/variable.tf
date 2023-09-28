variable "lambda_dynamodb_role_name" {
  description = "Lambda function role name"
}

variable "lambda_sqs_role_name" {
  description = "Lambda function role name"
}

variable "lambda_dynamodb_policy_name" {
  description = "Lambda function policy name"
}

variable "lambda_sqs_policy_name" {
  description = "Lambda function policy name"
}

variable "lambda_policy_description" {
  description = "Lambda function policy name"
}

variable "lambda_dynamodb_function_name" {
  description = "Lambda function name"
}

variable "dynamodb_lambda_handler" {
  description = "Lambda function handler"
}

variable "lambda_runtime" {
  description = "Lambda runtime language"
}

variable "sqs_lambda_function_name" {
  description = "Lambda function name"
}

variable "sqs_lambda_handler" {
  description = "Lambda function sql handler"
}

variable "file_name" {
  description = "Lambda function file name"
}

variable "source_dir" {
  description = "source directory for lambda code"
}

variable "output_path" {
  description = "output path for lambda zip code"
}

variable "table_name" {
  description = "dynamodb table name"
}

variable "sqs_url" {
  description = "sqs url to connect from lambda"
}

variable "tags" {
  type = map
}