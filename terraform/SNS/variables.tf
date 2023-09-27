variable "topic_name" {
  description = "SQS queue name"
}

variable "sqs_lambda_function_name" {
  description = "lambda function name to add access to sns"
}

variable "terraform_lambda_sqs_func_arn" {
  description = "lambda function arn"
}

variable "sns_protocol" {
  description = "sns protocol"
}

variable "tags" {
  type = map
}