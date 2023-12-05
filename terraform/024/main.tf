provider "aws" {
  region = "ap-northeast-1"
}

module "s3" {
  source = "./modules/s3"
}

module "cloudwatchlog" {
  source               = "./modules/cwlog"
  lambda_function_name = module.lambda.lambda_function_name
  lambda_function_arn  = module.lambda.lambda_function_arn
}

module "lambda" {
  source                   = "./modules/lambda"
  s3_bucket_name           = module.s3.s3_bucket_name
  cloudwatch_log_group_arn = module.cloudwatchlog.cloudwatch_log_group_arn
}
