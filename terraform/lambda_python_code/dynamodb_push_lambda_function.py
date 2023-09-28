import os
import boto3
import json

# Get table_name from environment variable
table_name = os.environ['TABLE_NAME']

def lambda_handler(event, context):
    
    try:
        # Extract data from sqs message
        records = event['Records'][0]
        
        # Convert message body to json
        item = json.loads(records['body'])
        
        # Validate item has paymentId or not
        if 'paymentId' in item:
            client = boto3.resource('dynamodb')
        
            table = client.Table(table_name)
            response = table.put_item(Item= item)
            
            # Return response code      
            return {
               'statusCode': response['ResponseMetadata']['HTTPStatusCode']
            }
        else:
            return {
                'statusCode': 400,
                'body': 'paymentId is missing in the message'
            }
            
    except Exception as e:
      print(e)
      return {
           'statusCode': 500,
           'body': e
         }