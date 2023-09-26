variable "sqs_name" {
  description = "SQS queue name"
  default = "payment_lambda_push_queue"
}

variable "dead_letter_queue_name" {
  description = "Dead Letter SQS queue name"
  default = "payment_lambda_dead_letter_queue"
}