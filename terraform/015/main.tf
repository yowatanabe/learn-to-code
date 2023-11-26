provider "aws" {
  region = "ap-northeast-1"
}

module "stepfunctions" {
  source              = "./modules/sfn"
  lambda_function_arn = module.lambda.lambda_function_arn
}

module "lambda" {
  source = "./modules/lambda"
}
