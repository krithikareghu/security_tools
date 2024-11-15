# Define an S3 bucket for storing the CloudFormation template
resource "aws_s3_bucket" "tenable_bucket" {
  bucket = var.s3_bucket_name
}

# Upload the CloudFormation template to S3
resource "aws_s3_object" "tenable_template_upload" {
  bucket = aws_s3_bucket.tenable_bucket.bucket
  key    = var.s3_bucket_key
  source = var.s3_bucket_source
  etag   = filemd5(var.s3_bucket_source) # This ensures template changes trigger updates
}

# Create the CloudFormation StackSet
resource "aws_cloudformation_stack_set" "tenable" {
  name             = var.stackset_name
  template_url     = "https://s3.amazonaws.com/${aws_s3_bucket.tenable_bucket.bucket}/tenable_template.yaml" # Correct S3 URL for us-east-1
  capabilities     = ["CAPABILITY_NAMED_IAM"]
  permission_model = "SERVICE_MANAGED"
  call_as          = "DELEGATED_ADMIN"

  parameters = {
    RoleName = var.iam_role_name
  }

  auto_deployment {
    enabled                          = true
    retain_stacks_on_account_removal = true # Change to true if you want to retain stacks after deletion
  }

  lifecycle {
    ignore_changes = [
      administration_role_arn # AWS manages this when using SERVICE_MANAGED
    ]
  }
}

# Create StackSet instances targeting the root organizational unit
resource "aws_cloudformation_stack_set_instance" "tenable" {
  stack_set_name = aws_cloudformation_stack_set.tenable.name
  region         = var.region # Specify the region variable where StackSet will be applied
  call_as        = "DELEGATED_ADMIN"

  deployment_targets {
    organizational_unit_ids = var.deploy_ou_ids
  }
}
