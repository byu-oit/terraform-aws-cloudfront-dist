![Latest GitHub Release](https://img.shields.io/github/v/release/byu-oit/terraform-aws-cloudfront-dist?sort=semver)

# Terraform AWS CloudFront Distribution Module
 
## Usage

```hcl
module "cf_dist" {
  source = "git@github.com:byu-oit/terraform-aws-cloudfront-dist?ref=v1.0.0"
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
| origin_id | string | A unique ID for the origin. |
| origin_path | string | Path to where the distribution should send traffic. | *Empty String* |
| index_doc | string | The index document of the distribution. |
| cname | string | The CNAME for the distribution. *DNS must be setup separately*. |
| cname_ssl_cert_arn | string | The ARN for the SSL cert for the custom URL. |

## Outputs

| Name | Description |
| --- | --- |
| cloudfront_dist | The [CloudFront distribution](https://www.terraform.io/docs/providers/aws/r/cloudfront_distribution.html#attribute-reference) object. |
