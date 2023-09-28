output "payment_sqs_arn" {
	value = aws_sqs_queue.sqs_queue.url
}
