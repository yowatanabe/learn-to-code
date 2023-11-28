provider "aws" {
  region = "ap-northeast-1"
}

module "s3" {
  source = "./modules/s3"
}
