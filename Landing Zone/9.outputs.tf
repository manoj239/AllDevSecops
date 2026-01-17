output "cloudtrail_arn" {
  value = aws_cloudtrail.org_trail.arn
}

output "log_archive_bucket" {
  value = aws_s3_bucket.log_archive.id
}

output "organization_id" {
  value = aws_organizations_organization.main.id
}

output "root_id" {
  value = aws_organizations_organization.main.roots[0].id
}

output "security_ou_id" {
  value = aws_organizations_organizational_unit.security.id
}

output "shared_services_ou_id" {
  value = aws_organizations_organizational_unit.shared_services.id
}

output "workloads_ou_id" {
  value = aws_organizations_organizational_unit.workloads.id
}
