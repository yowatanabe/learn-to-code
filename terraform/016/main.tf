provider "aws" {
  region = "ap-northeast-1"
}

module "s3" {
  source                = "./modules/s3"
  lambda_function_a_arn = module.lambda.lambda_function_a_arn
}

module "lambda" {
  source        = "./modules/lambda"
  s3_bucket_arn = module.s3.s3_bucket_arn
}
