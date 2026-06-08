variable "project" {
  description = "Project name used for naming resources"
  type        = string
  default     = "app_assignment"
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.33"
}

variable "cluster_role_arn" {
  description = "ARN of the EKS cluster IAM role"
  type        = string
}

variable "node_group_role_arn" {
  description = "ARN of the EKS node group IAM role"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for EKS"
  type        = list(string)
}

variable "instance_types" {
  description = "List of instance types for the node group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "capacity_type" {
  description = "Capacity type for the node group: ON_DEMAND or SPOT"
  type        = string
  default     = "SPOT"
}

variable "min_size" {
  description = "Minimum number of nodes in the node group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of nodes in the node group"
  type        = number
  default     = 1
}

variable "desired_size" {
  description = "Desired number of nodes in the node group"
  type        = number
  default     = 1
}

variable "addon_vpc_cni_version" {
  description = "Version of the vpc-cni addon"
  type        = string
  default     = "v1.18.1-eksbuild.1"
}

variable "addon_coredns_version" {
  description = "Version of the coredns addon"
  type        = string
  default     = "v1.11.1-eksbuild.4"
}

variable "addon_kube_proxy_version" {
  description = "Version of the kube-proxy addon"
  type        = string
  default     = "v1.29.1-eksbuild.2"
}

variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}
}