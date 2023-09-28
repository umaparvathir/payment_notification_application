variable "sqs_name" {
  description = "SQS queue name"
}

variable "dead_letter_queue_name" {
  description = "Dead Letter SQS queue name"
}

variable "tags" { 
    type = map
}

variable "terraform_lambda_func_arn" {
  description = "lambda function arn"
}