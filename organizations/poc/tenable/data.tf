# Data source to fetch the root of the AWS Organization
data "aws_organizations_organization" "default" {}

data "aws_organizations_organizational_units" "all_ous" {
  parent_id = data.aws_organizations_organization.default.roots[0].id
}

