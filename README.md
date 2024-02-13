# payment_notification_application
The repository contains terraform scripts to provision AWS services for payment notification application

Scope
This Application is limited to receiving the payment information from external payment source and update the payment information in the database.
Purpose of Application
The Application receives payment notifications and stores them in the Database.
Technical Components
This is a server-less application hosted in AWS Cloud. The following are the AWS services involved in this application.
Amazon SNS
Lambda functions
Amazon SQS
Amazon DynamoDB
Data Flow
The Lambda function receives payment notifications from another application or service, such as SNS, and pushes these notification messages into an SQS Queue. The Queue then forwards these messages to another Lambda function, which validates them and places the messages into DynamoDB.
![image](https://github.com/umaparvathir/payment_notification_application/assets/48677402/ae5d1518-1ebe-4329-93b4-ca7afe81036d)


![image](https://github.com/umaparvathir/payment_notification_application/assets/48677402/0bf9c38e-cd78-417f-b0d0-cf17add30866)
