data "aws_caller_identity" "current" {}

module "axonius_cloudformation" {
  source        = "../../../modules/axonius"
  s3_bucket_name        = local.axonius.s3_bucket_name
  iam_role_name     = local.axonius.iam_role_name
  stackset_name = local.axonius.stackset_name
  s3_bucket_key    = local.axonius.s3_bucket_key
  s3_bucket_source = local.axonius.s3_bucket_source
  root_account_id       = data.aws_caller_identity.current.account_id
  user_name             = local.axonius.user_name
  user_stack_name       = local.axonius.user_stack_name
  s3_user_bucket_key    = local.axonius.s3_user_bucket_key
  s3_user_bucket_source = local.axonius.s3_user_bucket_source
  excluded_ou_names = local.axonius.excluded_ou_names
  deploy_ou_ids = local.deploy_ou_ids
}