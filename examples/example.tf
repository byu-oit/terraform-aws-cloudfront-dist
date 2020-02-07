provider "aws" {
  version = "~> 2.42"
  region  = "us-west-2"
}

module "cf_dist" {
  source             = "github.com/byu-oit/terraform-aws-cloudfront-dist?ref=v1.0.0"
  env_tag            = "dev"
  origin_domain_name = aws_s3_bucket.bucket.website_endpoint
  origin_id          = aws_s3_bucket.bucket.bucket
  repo_name          = "test"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "cf-dist-bucket"

  website {
    index_document = "index.html"
  }
}
