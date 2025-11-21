variable "alarm_email" {
    description = "epost som alarm blir sendt til"
    type = string
    default = "andre44@live.no"
}

variable "high_latency_alarm_name" {
    description = "alarmnavn med kandidatnumer"
    type = string 
    default = "kandidat-34-high-latency-alarm"
}

variable "cloudwatch_namespace" {
    description = "MÅ være samme som i MetricsConfigure"
    type = string
    default = "kandidat34"
}

variable "high_latency_period" {
    description = "hvor mange sekunder hver periode varer"
    type = number
    default = 60
}

variable "evaluation_periods" {
    description = "hvor mange perioder må threshhold overstiges før alarmen går"
    type = number
    default = 1
}

variable "latency_threshold" {
    description = "alarmtrigger for latency"
    type = number
    default = 0.5
}

variable "aws_region" {
    description = "AWS region"
    type = string
    default = "eu-west-1"
}

variable "dashboard_name" {
    description = "name with candidate number for dashboard"
    type = string
    default = "kandidat-34-dashboard"
}