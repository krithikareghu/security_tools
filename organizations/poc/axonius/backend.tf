terraform {
  backend "s3" {
    # bucket         = "tf-backend-tenable-aws-lca-pce-poc"
    bucket = "aws-lca-pce-config-tf-backend-axonius"
    key            = "axonius/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
     # dynamodb_table = "aws-lca-pce-config-tf-locks-axonius"
  }
}