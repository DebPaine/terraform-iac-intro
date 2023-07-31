provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

resource "random_pet" "lambda_bucket_name" {
  prefix = "deb-terraform"
  length = 4
}

resource "aws_s3_bucket" "lambda_bucket" {
# Name of the S3 bucket has to be globally unique, hence we are generating a random name
  bucket = random_pet.lambda_bucket_name.id
}

resource "aws_sqs_queue" "message_queue" {
# Name of the SQS doesn't have to be unique globally
  name = "deb-terraform-sqs"
}
