variable "region" {
  description = "AWS region to deploy the StackSet"
  type        = string
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
}

variable "iam_role_name" {
  type        = string
  description = "The name of the IAM role"
}

variable "stackset_name" {
  type        = string
  description = "The name of the CloudFormation StackSet"
}

variable "s3_bucket_key" {
  type        = string
  description = "The key for the bucket object"
}

variable "s3_bucket_source" {
  type        = string
  description = "The source path for the bucket"
}

variable "excluded_ou_names" {
  type = list(string)
  description = "List of ous to be excluded"
}

variable "deploy_ou_ids" {
  type = list(any)
  description = ""
}