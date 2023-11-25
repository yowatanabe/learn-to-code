def lambda_handler(event, context):

    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']

    print(bucket+"に"+key+"が作成されました")
