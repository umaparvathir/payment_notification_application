variable "lambda_role_name" {
  description = "Lambda function role name"
  default = "lambda_dynamodb_push_role"
}

variable "lambda_policy_name" {
  description = "Lambda function policy name"
  default = "lambda_dynamodb_push_policy"
}

variable "lambda_policy_description" {
  description = "Lambda function policy name"
  default = "AWS IAM Policy for managing aws lambda role"
}

variable "lambda_function_name" {
  description = "Lambda function name"
  default = "lambda_dynamodb_push"
}

variable "file_name" {
  description = "Lambda function file name"
  default = "lambda_python_code/lambda-dynamodb-push.zip"
}