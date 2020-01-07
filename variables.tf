variable "env_tag" {
  type        = string
  description = "The environment tag for the resources."
}

variable "data_sensitivity_tag" {
  type        = string
  default     = "confidential"
  description = "The data-sensitivity tag for the resources."
}

variable "repo_name" {
  type        = string
  description = "The name of the repo containing the site."
}

variable "price_class" {
  type        = number
  default     = 100
  description = "The price class of the disribution."
}

variable "origin_domain_name" {
  type        = string
  description = "The domain name of the origin."
}

variable "origin_id" {
  type        = string
  description = "A unique ID for the origin."
}

variable "origin_protocol_policy" {
  type        = string
  default     = "match-viewer"
  description = "The origin protocol policy to apply to your origin."
}

variable "origin_path" {
  default     = ""
  type        = string
  description = "Path to where the distribution should send traffic."
}

variable "index_doc" {
  default     = "index.html"
  type        = string
  description = "The index document of the distribution."
}

variable "cname" {
  default     = ""
  type        = string
  description = "The CNAME for the distribution (DNS must be setup seperately)."
}

variable "cname_ssl_cert_arn" {
  default     = ""
  type        = string
  description = "The ARN for the SSL cert for the custom URL."
}

variable "wait_for_deployment" {
  default     = true
  type        = bool
  description = "Wait for the distribution to fully deploy before Terraform completes."
}

variable "query_string_forwarding" {
  default     = false
  type        = bool
  description = "Defines if the distribution should forward the query string."
}

variable "cookies_forwarding" {
  default     = "none"
  type        = string
  description = "Defines if the distribution forward cookies. You can specify \"all\" or \"none\""
}

variable "allowed_methods" {
  type        = set(string)
  default     = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
  description = "Methods the distribution will forward."
}

variable "cached_methods" {
  type        = set(string)
  default     = ["GET", "HEAD"]
  description = "Methods the distribution will cache."
}