#Enabled multi-region. Logs all management events. Sends logs to the S3 log archive bucket
#gives full audit logging across all accounts

resource "aws_cloudtrail" "org_trail" {
  name                          = "organization-trail"
  s3_bucket_name                = aws_s3_bucket.log_archive.bucket
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true

  depends_on = [aws_s3_bucket_policy.cloudtrail_write]
}

