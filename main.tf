terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_s3_bucket" "bucket3" {
  bucket = "s3-website-test-tietoevry-learn-github-exercise-2"
  acl    = "public-read"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.bucket3.id
  source = "index.html"
  acl    = "public-read"
  key = "index.html"
  content_type = "text/html"
}