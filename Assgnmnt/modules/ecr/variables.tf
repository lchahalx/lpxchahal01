variable "project" {
  description = "Project name used for naming resources"
  type        = string
  default     = "app_assignment"
}

variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}
}