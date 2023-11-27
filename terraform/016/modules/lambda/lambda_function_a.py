import json

import boto3


def lambda_handler(event, context):
    # S3イベントからバケット名とオブジェクトキーを取得
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']

    # S3オブジェクトを取得
    s3 = boto3.client('s3')
    response = s3.get_object(Bucket=bucket, Key=key)
    content = response['Body'].read().decode('utf-8')

    # JSONデータを読み取り
    data = json.loads(content)

    # 条件分岐
    if 'condition' in data:
        condition = data['condition']
        if condition == 'A':
            process_condition_A(data)
        elif condition == 'B':
            invoke_lambda_function('function_b', condition, content)
        elif condition == 'C':
            invoke_lambda_function('function_c', condition, content)
        else:
            process_default(data)
    else:
        print("Condition not found in the JSON data.")

def process_condition_A(data):
    # conditionがAの場合の処理
    print("Processing for condition A")
    print("Content:", data['content'])

def process_default(data):
    # それ以外の場合のデフォルト処理
    print("Default processing")
    print("Content:", data['content'])

def invoke_lambda_function(function_name, condition, payload):
    print(f"Processing for condition {condition}")

    # Lambda関数BまたはCを呼び出す
    lambda_client = boto3.client('lambda')
    response = lambda_client.invoke(
        FunctionName=function_name,
        InvocationType='Event',
        Payload=json.dumps({'content': payload})
    )

    print(f"{function_name} invoked")
