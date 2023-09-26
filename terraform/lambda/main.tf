// Create role for lambda function to assume
resource "aws_iam_role" "lambda_role" {
name   = var.lambda_role_name
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
resource "aws_iam_policy" "iam_policy_for_lambda" {
 
 name         = var.lambda_policy_name
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
	   "dynamodb:GetItem",
       "dynamodb:PutItem",
       "dynamodb:UpdateItem",
       "dynamodb:DescribeTable"
     ],
     "Resource": [
		"arn:aws:dynamodb:eu-north-1:479291791770:table/*",
		"arn:aws:logs:*:*:*"
		],
     "Effect": "Allow"
   }
 ]
}
EOF
}

// Attach iam policy to the role
resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
 role        = aws_iam_role.lambda_role.name
 policy_arn  = aws_iam_policy.iam_policy_for_lambda.arn
}

// Create zip of python application
data "archive_file" "zip_the_python_code" {
type        = "zip"
source_dir  = "lambda_python_code/"
output_path = "lambda_python_code/lambda-dynamodb-push.zip"
}

// Create lambda function
resource "aws_lambda_function" "terraform_lambda_func" {
filename                       = var.file_name
function_name                  = var.lambda_function_name
role                           = aws_iam_role.lambda_role.arn
handler                        = "index.lambda_handler"
runtime                        = "python3.8"
depends_on                     = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}