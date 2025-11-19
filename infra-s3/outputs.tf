output "analysis_bucket_name" {
    description = "Navn på bucket for analysefiler"
    value = aws_s3_bucket.analysis.bucket
}

output "aws_region" {
    description = "AWS region"
    value = var.aws_region
}

output "limited_lifecycle_status" {
    description = "Status for regel om midlertidige filer"
    value = aws_s3_bucket_lifecycle_configuration.analysis_lifecycle.rule[0].status
}

output "lifecycle_transition_time" {
    description = "Tid før midlertidige filer flyttes til Glacier"
    value = var.transition_time
}

output "lifecycle_deletion_time" {
    description = "Tid før midlertidige filer slettes"
    value = var.expiration_time
}