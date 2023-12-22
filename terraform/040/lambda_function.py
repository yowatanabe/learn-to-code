import json


def lambda_handler(event, context):
    for record in event['Records']:
        # DynamoDB Streamsからのイベントを処理
        if record['eventName'] == 'INSERT':
            # 新しいアイテムが挿入された場合の処理
            new_image = record['dynamodb']['NewImage']
            print(f"New Item: {json.dumps(new_image)}")
        elif record['eventName'] == 'MODIFY':
            # アイテムが変更された場合の処理
            new_image = record['dynamodb']['NewImage']
            old_image = record['dynamodb']['OldImage']
            print(f"Old Item: {json.dumps(old_image)}")
            print(f"New Item: {json.dumps(new_image)}")
        elif record['eventName'] == 'REMOVE':
            # アイテムが削除された場合の処理
            old_image = record['dynamodb']['OldImage']
            print(f"Old Item: {json.dumps(old_image)}")

    return {
        'statusCode': 200,
        'body': json.dumps('Lambda function executed successfully!')
    }
