variable "aws_region" {
    description = "AWS region"
    type = string
}

variable "analysis_bucket_name" {
    description = "Navn på s3 bucket" #analysis-bucket-candidate-34
    type = string
}

variable "prefix_midlertidig" {
    description = "Prefix for midlertidige filer" #midlertidig
    type = string 
    default = "midlertidig/"
}

variable "transition_time" {
    description = "Dager før filer i /midlertidig flyttes til Glacier"
    type = number
    default = 20
}

variable "expiration_time" {
    description = "Dager før filer i /midlertidig er fjernet"
    type = number
    default = 60
}