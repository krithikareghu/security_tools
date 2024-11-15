terraform {
  backend "s3" {
    //bucket         = "tf-backend-axonius-aws-lca-pce-poc"
    # bucket         = "tf-backend-axonius-gxy-audit"
    bucket = "aws-lca-pce-config-tf-backend-security-tools"
    key            = "cloud-infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "aws-lca-pce-config-tf-locks-test"
    encrypt        = true
  }
}
