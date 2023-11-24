provider "aws" {
  region = "ap-northeast-1"
}

module "sns" {
  source     = "./modules/sns"
  my_email   = var.my_email
  lambda_arn = module.lambda.lambda_arn
}

module "lambda" {
  source    = "./modules/lambda"
  topic_arn = module.sns.topic_arn
}
