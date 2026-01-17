resource "aws_s3_bucket" "log_archive" {
  bucket        = var.log_archive_bucket
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "log_archive_versioning" {
  bucket = aws_s3_bucket.log_archive.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "log_archive_encryption" {
  bucket = aws_s3_bucket.log_archive.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

data "aws_iam_policy_document" "cloudtrail_write_policy" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
    actions = ["s3:GetBucketAcl", "s3:PutObject"]
    resources = [
      aws_s3_bucket.log_archive.arn,
      "${aws_s3_bucket.log_archive.arn}/*"
    ]
  }
}

resource "aws_s3_bucket_policy" "cloudtrail_write" {
  bucket = aws_s3_bucket.log_archive.id
  policy = data.aws_iam_policy_document.cloudtrail_write_policy.json
}
