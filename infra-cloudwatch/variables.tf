variable "alarm_email" {
    description = "epost som alarm blir sendt til"
    type = string
    default = "andre44@live.no"
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
    default = 5
}