provider "aws" {
  region = "ap-northeast-1"
}

module "compute" {
  source        = "./compute/lambda"
  dynamodb_name = module.database.dynamodb_name
}

module "database" {
  source = "./database/dynamodb"

}
