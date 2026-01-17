#Creates the main AWS Organization for the root account.

resource "aws_organizations_organization" "main" {
  feature_set = "ALL"
}