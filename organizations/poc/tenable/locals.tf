locals {
  tenable = {
    iam_role_name     = "TenableOneRole"
    s3_bucket_name    = "aws-lca-pce-config-tenable-security"
    s3_bucket_key     = "tenable_template.yaml"
    s3_bucket_source  = "../../../modules/tenable/cf_template/tenable_template.yaml"
    stackset_name     = "tenable-stackset"
    excluded_ou_names = ["Security"] # OU names to exclude

    # Collect the OUs that are not in the excluded list
    # Tags
    cmdb_ref           = ""
    business_service   = ""
    billing_identifier = ""
    owner              = "Cloud-Infra"
  }
  
  deploy_ou_ids = [
    for ou in data.aws_organizations_organizational_units.all_ous.children : ou.id
    if !contains(local.tenable.excluded_ou_names, ou.name) # Only include OUs not in excluded list
  ]
}
