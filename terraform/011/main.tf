provider "aws" {
  region = "ap-northeast-1"
}

module "container" {
  source = "./container/ecr"

}
