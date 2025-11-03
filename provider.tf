resource "aws_s3_bucket" "tfstate" {
  bucket = "bluebird-hotel-tfstate"
}

resource "aws_s3_bucket_versioning" "tfstate_versioning" {
  bucket = aws_s3_bucket.tfstate.id

  versioning_configuration {
    status = "Enabled"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    encrypt      = true //server side encryption
    use_lockfile = true
    region       = "eu-north-1"
    bucket       = "bluebird-hotel-tfstate"
    key          = "terraform.tfstate"
  }

  required_version = ">= 1.13"
}

provider "aws" {
  region  = var.region
  profile = "terraform"
}
