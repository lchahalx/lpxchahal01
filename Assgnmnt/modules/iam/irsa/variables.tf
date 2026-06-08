variable "project" {
  description = "Project name used for naming resources"
  type        = string
  default     = "app_assignment"
}

variable "role_name" {
  description = "Name for IRSA role"
  type        = string
}

variable "oidc_provider_arn" {
  description = "ARN of the OIDC provider"
  type        = string
}

variable "oidc_provider_url" {
  description = "URL of the OIDC provider without https://"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace of the service account"
  type        = string
}

variable "service_account_name" {
  description = "Kubernetes service account name"
  type        = string
}

variable "policy_document" {
  description = "IAM policy document JSON passed from root"
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}
}