locals {

  axonius = {
    iam_role_name    = "AxoniusRole-test"
    s3_bucket_name   = "aws-lca-pce-config-axonius-test01"
    s3_bucket_key    = "axonius_role_tpl.yaml"
    s3_bucket_source = "../../../modules/axonius/cf_template/axonius_role_tpl.yaml"
    stackset_name    = "axonius-stackset"
    s3_user_bucket_key    = "axonius_user_tpl.yaml"
    s3_user_bucket_source = "../../../modules/axonius/cf_template/axonius_user_tpl.yaml"
    user_name= "axonius-user-test-1"
    user_stack_name= "axonius-user-stack"
    excluded_ou_names = ["Security"] # OU names to exclude

    # Tags
    cmdb_ref           = ""
    business_service   = ""
    billing_identifier = ""
    owner              = "Cloud-Infra"
  }
   deploy_ou_ids = [
    for ou in data.aws_organizations_organizational_units.all_ous.children : ou.id
    if !contains(local.axonius.excluded_ou_names, ou.name) # Only include OUs not in excluded list
  ]

}
