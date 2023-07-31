provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

resource "random_pet" "lambda_bucket_name" {
  prefix = "deb-terraform"
  length = 4
}

resource "aws_s3_bucket" "lambda_bucket" {
  bucket = random_pet.lambda_bucket_name.id
}

