resource "aws_s3_bucket" "pdf_bucket" {
  bucket = "pdf-bucket-update"
  tags = { 
    Name = "BSA Compliance PDF Bucket"
  }
}
# enables versioning to track changes to the PDF files
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.pdf_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
# encrypts the PDF
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
    bucket = aws_s3_bucket.pdf_bucket.id
    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    }
}
#blocks public access
resource "aws_s3_bucket_public_access_block" "block" {
    bucket = aws_s3_bucket.pdf_bucket.id
    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}


