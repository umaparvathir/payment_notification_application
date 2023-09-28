import os
from mock import patch

# mock queue url for testing purpose
with patch.dict(os.environ, {'QUEUE_URL': 'mock-value'}):
    from lambda_python_code import sqs_push_lambda_function
    from lambda_python_code.sqs_push_lambda_function import lambda_handler


    # Test if no message/empty message sent from sns
    def test_sqs_lambda_handler_fail_1():
        event = {}
        event['Records'] = [{'Sns':{}}]

        response = lambda_handler(event, context={})

        assert response["statusCode"] == 204
        assert response["body"] == 'No Content'

    # Test exception scenerio
    # Mock raising an Exception
    @patch('lambda_python_code.sqs_push_lambda_function.os.environ')
    def test_sqs_lambda_handler_fail_2(response):
        response.return_value = Exception
        event = {}
        event['Records'] = [{'Sns':{'Message':{'paymentId':'1234'}}}]

        response = lambda_handler(event, context={})

        assert response["statusCode"] == 500

    # Test success scenerio
    @patch('lambda_python_code.sqs_push_lambda_function.lambda_handler')
    def test_sqs_lambda_handler_success(response):
        
        response.return_value = {'statusCode':200}
        event = {}
        event['Records'] = [{'Sns':{'Message':{'paymentId':'1234'}}}]

        response = sqs_push_lambda_function.lambda_handler(event, context={})
        print(response)
        assert response["statusCode"] == 200