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
