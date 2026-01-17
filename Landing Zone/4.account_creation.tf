#Creates accounts inside your Landing Zone. automates the multi-account creation process.

resource "aws_organizations_account" "security_account" {
  name      = "Security-Account"
  email     = var.security_account_email
  parent_id = aws_organizations_organizational_unit.security.id
}

resource "aws_organizations_account" "shared_services_account" {
  name      = "SharedServices-Account"
  email     = var.shared_services_email
  parent_id = aws_organizations_organizational_unit.shared_services.id
}

resource "aws_organizations_account" "workload_account" {
  name      = "Workload-Account"
  email     = var.workload_account_email
  parent_id = aws_organizations_organizational_unit.workloads.id
}

