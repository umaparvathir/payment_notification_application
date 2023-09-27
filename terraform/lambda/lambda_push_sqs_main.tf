// Create role for lambda function to assume
resource "aws_iam_role" "lambda_sqs_role" {
name   = var.lambda_sqs_role_name
assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "lambda.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}

// Create policy with required permissions for lambda function
resource "aws_iam_policy" "iam_policy_for_lambda_sqs" {
 
 name         = var.lambda_sqs_policy_name
 description  = var.lambda_policy_description
 policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": [
       "logs:CreateLogGroup",
       "logs:CreateLogStream",
       "logs:PutLogEvents",
	   "sqs:SendMessage"
     ],
     "Resource": [
		"arn:aws:sqs:eu-north-1:*:*",
		"arn:aws:logs:eu-north-1:*:*"
		],
     "Effect": "Allow"
   }
 ]
}
EOF
}

// Attach iam policy to the role
resource "aws_iam_role_policy_attachment" "lambda_attach_iam_policy_to_iam_role" {
 role        = aws_iam_role.lambda_sqs_role.name
 policy_arn  = aws_iam_policy.iam_policy_for_lambda_sqs.arn
}

// Create lambda function
resource "aws_lambda_function" "terraform_lambda_sqs_func" {
	filename                       = var.file_name
	function_name                  = var.sqs_lambda_function_name
	role                           = aws_iam_role.lambda_sqs_role.arn
	handler                        = var.sqs_lambda_handler
	runtime                        = var.lambda_runtime
	tags                           = var.tags
	source_code_hash 			   = filebase64sha256("lambda_python_code/lambda-dynamodb-push.zip")
	environment {
		variables = {
		  QUEUE_URL = var.sqs_url
		}
  }
	depends_on                     = [aws_iam_role_policy_attachment.lambda_attach_iam_policy_to_iam_role]
}