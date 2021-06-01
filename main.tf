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

resource "aws_s3_bucket" "b" {
  bucket = "s3-website-test-tietoevry-learn-github-exercise-2"
  source = "index.html"
  acl    = "public-read"
  key = "index.html"
  content_type = "text/html"
}