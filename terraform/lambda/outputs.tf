output "terraform_lambda_func_arn" {
	value = aws_lambda_function.terraform_lambda_func.arn
}

output "terraform_lambda_sqs_func_arn" {
	value = aws_lambda_function.terraform_lambda_sqs_func.arn
}