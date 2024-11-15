variable "region" {
  type        = string
  description = "Primary AWS region"
  default     = "us-east-1"
}

variable "tags" {
  type        = map(string)
  description = "Common tags for resources"
  default = {
    "managed_by" = "Terraform",
    "tf_config"  = "https://github.com/LabCorp/security-tools"
  }
}
