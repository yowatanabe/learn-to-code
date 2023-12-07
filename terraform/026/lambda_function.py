def lambda_handler(event, context):
    print("Processed successfully!")

    return {
        'statusCode': 200,
        'body': 'Hello World!',
    }
