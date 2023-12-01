provider "aws" {
  region = "ap-northeast-1"
}

module "s3" {
  source = "./modules/s3"
}

module "cloudwatchlog" {
  source       = "./modules/cwlog"
  firehose_arn = module.firehose.firehose_arn
}

module "firehose" {
  source        = "./modules/firehose"
  s3_bucket_arn = module.s3.s3_bucket_arn
}
