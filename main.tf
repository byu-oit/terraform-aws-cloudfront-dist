terraform {
  required_version = ">= 0.12.16"
  required_providers {
    aws = ">= 2.42"
  }
}

provider "aws" {
  alias  = "aws_n_va"
  region = "us-east-1"
}

locals {
  tags = {
    env              = var.env_tag
    data-sensitivity = var.data_sensitivity_tag
    repo             = "https://github.com/byu-oit/${var.repo_name}"
  }
}

data "aws_iam_account_alias" "current" {}

data "aws_acm_certificate" "nva_account_cert" {
  provider = aws.aws_n_va
  domain   = "${data.aws_iam_account_alias.current.account_alias}.amazon.byu.edu"
}

resource "aws_cloudfront_distribution" "cdn" {
  price_class = "PriceClass_${var.price_class}"
  origin {
    domain_name = var.origin_domain_name
    origin_id   = var.origin_id
    origin_path = var.origin_path

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2", "TLSv1.1", "TLSv1"]
    }
  }

  comment             = "CDN for ${var.repo_name}"
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = var.index_doc
  aliases             = var.cname != "" ? [var.cname] : ["${var.repo_name}.${data.aws_iam_account_alias.current.account_alias}.amazon.byu.edu"]

  default_cache_behavior {
    target_origin_id = var.origin_id
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "redirect-to-https"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.cname == "" ? data.aws_acm_certificate.nva_account_cert.arn : var.cname_ssl_cert_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.1_2016"
  }

  tags = local.tags
}
