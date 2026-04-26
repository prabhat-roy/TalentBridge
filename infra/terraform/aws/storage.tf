# Per-region S3 for payslips, contracts. Each bucket lives in its residency region.
resource "aws_s3_bucket" "documents_eu" { provider = aws.eu  bucket = "talentbridge-eu-${var.environment}-documents" }
resource "aws_s3_bucket_versioning" "documents_eu" { provider = aws.eu  bucket = aws_s3_bucket.documents_eu.id  versioning_configuration { status = "Enabled" } }
resource "aws_s3_bucket_server_side_encryption_configuration" "documents_eu" {
  provider = aws.eu  bucket = aws_s3_bucket.documents_eu.id
  rule { apply_server_side_encryption_by_default { sse_algorithm = "aws:kms" } }
}
resource "aws_s3_bucket_public_access_block" "documents_eu" {
  provider = aws.eu  bucket = aws_s3_bucket.documents_eu.id
  block_public_acls = true  block_public_policy = true  ignore_public_acls = true  restrict_public_buckets = true
}

resource "aws_s3_bucket" "documents_in" { provider = aws.in  bucket = "talentbridge-in-${var.environment}-documents" }
resource "aws_s3_bucket_versioning" "documents_in" { provider = aws.in  bucket = aws_s3_bucket.documents_in.id  versioning_configuration { status = "Enabled" } }
resource "aws_s3_bucket_server_side_encryption_configuration" "documents_in" { provider = aws.in  bucket = aws_s3_bucket.documents_in.id  rule { apply_server_side_encryption_by_default { sse_algorithm = "aws:kms" } } }
resource "aws_s3_bucket_public_access_block" "documents_in" { provider = aws.in  bucket = aws_s3_bucket.documents_in.id  block_public_acls = true  block_public_policy = true  ignore_public_acls = true  restrict_public_buckets = true }

resource "aws_s3_bucket" "documents_us" { provider = aws.us  bucket = "talentbridge-us-${var.environment}-documents" }
resource "aws_s3_bucket_versioning" "documents_us" { provider = aws.us  bucket = aws_s3_bucket.documents_us.id  versioning_configuration { status = "Enabled" } }
resource "aws_s3_bucket_server_side_encryption_configuration" "documents_us" { provider = aws.us  bucket = aws_s3_bucket.documents_us.id  rule { apply_server_side_encryption_by_default { sse_algorithm = "aws:kms" } } }
resource "aws_s3_bucket_public_access_block" "documents_us" { provider = aws.us  bucket = aws_s3_bucket.documents_us.id  block_public_acls = true  block_public_policy = true  ignore_public_acls = true  restrict_public_buckets = true }
