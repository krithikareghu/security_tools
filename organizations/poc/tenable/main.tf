module "tenable_cloudformation" {
  source            = "../../../modules/tenable"
  s3_bucket_name    = local.tenable.s3_bucket_name
  iam_role_name     = local.tenable.iam_role_name
  stackset_name     = local.tenable.stackset_name
  s3_bucket_key     = local.tenable.s3_bucket_key
  s3_bucket_source  = local.tenable.s3_bucket_source
  excluded_ou_names = local.tenable.excluded_ou_names
  deploy_ou_ids     = local.deploy_ou_ids
}
