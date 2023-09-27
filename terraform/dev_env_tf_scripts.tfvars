region = "eu-north-1"

tags = { 
        projectName: "Audibene",
		environment: "development",
        team: "Infrastructure"
  }
  
// SNS variables
topic_name = "payment_notification"
sns_protocol = "lambda"

// Lambda function variables
lambda_dynamodb_role_name = "lambda_dynamodb_push_role"
lambda_dynamodb_policy_name = "lambda_dynamodb_push_policy"
lambda_policy_description = "AWS IAM Policy for managing aws lambda role"
source_dir = "lambda_python_code/"
output_path = "lambda_python_code/lambda-dynamodb-push.zip"
file_name = "lambda_python_code/lambda-dynamodb-push.zip"
lambda_dynamodb_function_name = "lambda_dynamodb_push"
dynamodb_lambda_handler = "dynamodb_push_lambda_function.lambda_handler"
lambda_runtime = "python3.8"
lambda_sqs_role_name = "lambda_sqs_push_role"
lambda_sqs_policy_name = "lambda_sqs_push_policy"
sqs_lambda_function_name = "lambda_sqs_push"
sqs_lambda_handler = "sqs_push_lambda_function.lambda_handler"

// SQS variables
sqs_name = "payment_lambda_push_queue"
dead_letter_queue_name = "payment_lambda_dead_letter_queue"

//dynamodb variables
table_name = "PaymentInfo" 
db_billing_mode = "PROVISIONED"
read_capacity = 20
write_capacity = 20
hash_key = "paymentId"
attribute_name = "paymentId"

 