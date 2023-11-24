import json
import os

import boto3


def process_data():
    processed_data = {
        'DataID': 'some_id',
        'ProcessedData': 'processed_content'
    }

    return processed_data


def lambda_handler(event, context):
    dynamo_table_name = os.environ['DYNAMO_TABLE_NAME']

    processed_data = process_data()

    dynamodb = boto3.client('dynamodb')
    dynamodb.put_item(
        TableName=dynamo_table_name,
        Item={
            'DataID': {'S': processed_data['DataID']},
            'ProcessedData': {'S': processed_data['ProcessedData']}
        }
    )

    return {
        'statusCode': 200,
        'body': json.dumps('Data processed and written to DynamoDB')
    }
