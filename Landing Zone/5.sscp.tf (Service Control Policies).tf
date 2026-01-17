#attaches SCPs at rool level. all Accounts + OUs inherit the protection.This ensures CloudTrail cannot be modified.

resource "aws_organizations_policy" "deny_delete_cloudtrail" {
  name        = "Deny-CloudTrail-Delete"
  description = "Prevents disabling or deleting CloudTrail"

  content = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyDisableCloudTrail",
      "Effect": "Deny",
      "Action": [
        "cloudtrail:DeleteTrail",
        "cloudtrail:StopLogging",
        "cloudtrail:UpdateTrail"
      ],
      "Resource": "*"
    }
  ]
}
EOF

  type = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "attach_ct_scp" {
  policy_id = aws_organizations_policy.deny_delete_cloudtrail.id
  target_id = aws_organizations_organization.main.roots[0].id

  depends_on = [
    aws_organizations_policy.deny_delete_cloudtrail,
    aws_organizations_organization.main
  ]
}
