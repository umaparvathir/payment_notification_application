variable "region" {
  description = "region where we have to provision all services"
}

variable "tags" { 
    type = map
}

variable "topic_name" {
  description = "SQS queue name"
}

variable "sns_protocol" {
  description = "sns protocol"
}

variable "sqs_name" {
  description = "SQS queue name"
}

variable "dead_letter_queue_name" {
  description = "Dead Letter SQS queue name"
}

variable "lambda_dynamodb_role_name" {
  description = "Lambda function role name"
}

variable "lambda_dynamodb_policy_name" {
  description = "Lambda function policy name"
}

variable "lambda_policy_description" {
  description = "Lambda function policy name"
}

variable "source_dir" {
  description = "source directory for lambda code"
}

variable "output_path" {
  description = "output path for lambda zip code"
}

variable "file_name" {
  description = "Lambda function file name"
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

variable "lambda_sqs_role_name" {
  description = "Lambda function role name"
}

variable "lambda_sqs_policy_name" {
  description = "Lambda function policy name"
}

variable "sqs_lambda_function_name" {
  description = "Lambda function name"
}

variable "sqs_lambda_handler" {
  description = "Lambda function sql handler"
}

variable "table_name" {
  description = "dynamodb table name"
}

variable "db_billing_mode" {
  description = "Controls the way you are charged for read and write."
}

variable "read_capacity" {
  description = "read capacoty units for db"
}

variable "write_capacity" {
  description = "write capacity units for db"
}

variable "hash_key" {
  description = "The attribute to use as the hash (partition) key for the table."
}

variable "attribute_name" {
  description = "The attribute name."
}
