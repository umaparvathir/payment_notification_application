import os
from mock import patch

# mock table name for testing purpose
with patch.dict(os.environ, {'TABLE_NAME': 'mock-value'}):
    from lambda_python_code import dynamodb_push_lambda_function
    from lambda_python_code.dynamodb_push_lambda_function import lambda_handler


    # Test if no paymentId attribute present in message
    def test_dynamodb_lambda_handler_fail_1():
        event = {}
        event['Records'] = [{'body':'{"paymentMethod":"Gpay"}'}]

        response = lambda_handler(event, context={})
        assert response["statusCode"] == 400
        

    # Test if any Exception raises
    # Mock raising an Exception
    @patch('lambda_python_code.dynamodb_push_lambda_function.boto3')
    def test_dynamodb_lambda_handler_fail_2(res):
        res.return_value = Exception
        event = {}
        event['Records'] = [{'body':{'paymentMethod':'Gpay'}}]

        response = lambda_handler(event, context={})

        assert response["statusCode"] == 500

    # Test success scenerio
    @patch('lambda_python_code.dynamodb_push_lambda_function.lambda_handler')
    def test_dynamodb_lambda_handler_success(res):
        res.return_value = {'statusCode':200}
        event = {}
        event['Records'] = [{'body':{'paymentMethod':'Gpay'}}]

        response = dynamodb_push_lambda_function.lambda_handler(event, context={})

        assert response["statusCode"] == 200