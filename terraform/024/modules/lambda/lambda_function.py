import base64
import gzip
import json
import os

import boto3

s3 = boto3.client('s3')

def lambda_handler(event, context):
    # 環境変数からS3バケット名を読み込み
    s3_bucket_name = os.environ['S3_BUCKET_NAME']

    # base64デコード処理
    decoded_data = base64.b64decode(event['awslogs']['data'])

    # gzip解凍処理
    json_data = json.loads(gzip.decompress(decoded_data))

    # メッセージ取得
    message = json_data['logEvents'][0]['message']

    # ログをS3に保存
    s3_key = f'logs/{context.log_stream_name}.log'
    s3.put_object(Body=message, Bucket=s3_bucket_name, Key=s3_key)

    return {
        'statusCode': 200,
        'body': json.dumps('Logs successfully processed and saved to S3')
    }
