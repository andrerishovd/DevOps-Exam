resource "aws_s3_bucket" "analysis" {
  bucket = var.analysis_bucket_name
}

resource "aws_s3_bucket_lifecycle_configuration" "analysis_lifecycle" {
    bucket = aws_s3_bucket.analysis.id

    rule {
        id = "midlertidige-filer-lifecycle"
        status = "Enabled" 

        filter {
            prefix = var.prefix_midlertidig
        }

        transition {
            days = var.transition_time
            storage_class = "GLACIER"
        }

        expiration {
            days = var.expiration_time
        }
    }
}