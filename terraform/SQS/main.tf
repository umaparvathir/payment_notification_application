// Create sqs queue
resource "aws_sqs_queue" "sqs_queue" {
  name                      = var.sqs_name
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  tags = var.tags
}

// Create dead letter queue
resource "aws_sqs_queue" "terraform_queue_deadletter" {
  name = var.dead_letter_queue_name
  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.sqs_queue.arn]
  })
}

// add event source mapping between sqs and lambda
resource "aws_lambda_event_source_mapping" "sqs_lambda_map" {
  event_source_arn = aws_sqs_queue.sqs_queue.arn
  enabled 		   = true
  function_name    = var.terraform_lambda_func_arn
  depends_on       = [aws_sqs_queue.sqs_queue]
}

// Create policy for sqs to send/receive messages
data "aws_iam_policy_document" "sqs_policy" {
  statement {
    sid    = "shsqsstatement"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "sqs:SendMessage",
      "sqs:ReceiveMessage",
	  "sqs:DeleteMessage",
	  "sqs:GetQueueAttributes"
    ]
    resources = [
      aws_sqs_queue.sqs_queue.arn
    ]
  }
}

// Attach policy to sqs queue
resource "aws_sqs_queue_policy" "sh_sqs_policy" {
  queue_url = aws_sqs_queue.sqs_queue.id
  policy    = data.aws_iam_policy_document.sqs_policy.json
}
