import logging
import os

import boto3

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):

    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']

    download_path = f"/tmp/{os.path.basename(key)}"

    s3 = boto3.client('s3')
    s3.download_file(bucket, key, download_path)

    with open(download_path, 'r') as file:
        content = file.read()
        logger.info(f"Content of the file: {content}")

    os.remove(download_path)

    return {
        'statusCode': 200,
        'body': 'File processed successfully!',
    }
