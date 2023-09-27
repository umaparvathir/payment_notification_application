// Create SNS topic
resource "aws_sns_topic" "payment_updates" {
  name            = var.topic_name
  
  delivery_policy = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
EOF
}

// Create subscription for SNS topic to lambda function
resource "aws_sns_topic_subscription" "invoke_with_sns" {
  topic_arn = aws_sns_topic.payment_updates.arn
  protocol  = var.sns_protocol
  endpoint  = var.terraform_lambda_sqs_func_arn
}

// Allow SNS to invoke lambda function
resource "aws_lambda_permission" "allow_sns_invoke" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = var.sqs_lambda_function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.payment_updates.arn
}