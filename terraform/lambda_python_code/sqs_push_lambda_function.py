import os
import json
import boto3
from datetime import datetime

# Get sqs url from environment variable
queue_url = os.environ['QUEUE_URL']

def lambda_handler(event, context):
   try:
      # Extract data from sns message
      records = event['Records'][0]
      
      # Check if message exist in record or not
      if 'Message' in records['Sns']:
         message = records['Sns']['Message']
         
         sqs = boto3.client('sqs')
         
         # send message to sqs queue
         response = sqs.send_message(
                      QueueUrl=queue_url,
                      MessageBody=message
                  )
         response = json.dumps(response)
         
         # Return response code        
         return {
           'statusCode': response['ResponseMetadata']['HTTPStatusCode']
         }
      
      # If no message exist, return response 204
      else:
         return {
           'statusCode': 204,
           'body': 'No Content'
         }
         exit(1)
   
   except Exception as e:
      print(e)
      return {
           'statusCode': 500,
           'body': e
         }
      
      