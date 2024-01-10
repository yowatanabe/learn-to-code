import boto3


def lambda_handler(event, context):
    # S3イベントからバケット名とオブジェクトキーを取得
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']

    # S3オブジェクトの内容を読み取り
    s3_client = boto3.client('s3')
    response = s3_client.get_object(Bucket=bucket, Key=key)
    content = response['Body'].read().decode('utf-8')

    # CloudWatchログに内容を出力
    print(f"Contents of {key}: {content}")

    return {
        'statusCode': 200,
        'body': f'Contents of {key} logged successfully.'
    }
