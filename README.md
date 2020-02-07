![Latest GitHub Release](https://img.shields.io/github/v/release/byu-oit/terraform-aws-cloudfront-dist?sort=semver)

# Terraform AWS CloudFront Distribution Module
 
## Usage

```hcl
module "cf_dist" {
  source             = "github.com/byu-oit/terraform-aws-cloudfront-dist?ref=v1.0.0"
  env_tag            = "dev"
  origin_domain_name = "s3-bucket-name.us-west-2.amazonaws.com"
  origin_id          = "s3-bucket-name"
  repo_name          = "test"
}
```

## Requirements

* Terraform version 0.12.16 or greater

## Inputs

| Name | Type | Description | Default |
| --- | --- | --- | --- |
| env_tag | string | The environment tag for the resources. |
| data_sensitivity_tag | string | The data-sensitivity tag for the resources. | confidential |
| repo_name | string | The name of the repo containing the site. |
| price_class | number | The price class of the distribution. | 100 |
| origin_domain_name | string | The domain name of the origin. |
| origin_id | string | A unique ID for thebv origin. |
| origin_path | string | Path to where the distribution should send traffic. | *Empty String* |
| origin_protocol_policy | string | The origin protocol policy to apply to your origin. | match-viewer |
| index_doc | string | The index document of the distribution. |
| cname | string | The CNAME for the distribution. *DNS must be setup separately*. |
| cname_ssl_cert_arn | string | The ARN for the SSL cert for the custom URL. |
| wait_for_deployment | bool | Wait for the distribution to fully deploy before Terraform completes. | `true` |
| query_string_forwarding | bool | Defines if the distribution should forward the query string. | `false` |
| cookies_forwarding | string | Defines if the distribution forward cookies. You can specify `all` or `none` | none |
| allowed_methods | set(string) | Methods the distribution will forward. | ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"] |
| cached_methods | set(string) | Methods the distribution will cache. | ["GET", "HEAD"] |

## Outputs

| Name | Type | Description |
| --- | --- | --- |
| cloudfront_dist | object | The [CloudFront distribution](https://www.terraform.io/docs/providers/aws/r/cloudfront_distribution.html#attribute-reference) object. |
