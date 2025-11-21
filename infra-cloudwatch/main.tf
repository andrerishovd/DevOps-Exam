resource "aws_sns_topic" "alerts" {
    name = "cloudwatch-sentiment-alert"
}

resource "aws_sns_topic_subscription" "email" {
    topic_arn = aws_sns_topic.alerts.arn
    protocol = "email"
    endpoint = var.alarm_email
}

resource "aws_cloudwatch_metric_alarm" "high_latency" {
    alarm_name = var.high_latency_alarm_name
    alarm_description = "Alarm if average analysis latency in the last minute was over accepted threshhold"
    namespace = var.cloudwatch_namespace
    metric_name = "sentiment.analysis.duration.value"
    statistic = "Average"
    period = var.high_latency_period
    evaluation_periods = var.evaluation_periods
    comparison_operator = "GreaterThanThreshold"
    threshold = var.latency_threshold
    treat_missing_data = "missing"

    alarm_actions = [
        aws_sns_topic.alerts.arn
    ]

    ok_actions = [
        aws_sns_topic.alerts.arn
    ]
}

resource "aws_cloudwatch_dashboard" "sentiment_dashboard" {
  dashboard_name = var.dashboard_name

  dashboard_body = jsonencode({
    start          = "-15 minutes"
    periodOverride = "inherit"
    widgets = [
      # Widget 1: Latency
      {
        "type" : "metric",
        "x" : 0,
        "y" : 0,
        "width" : 12,
        "height" : 6,
        "properties" : {
          "view" : "timeSeries",
          "region" : var.aws_region,
          "title" : "Sentiment Analysis Duration (Average, seconds)",
          "metrics" : [
            [ var.cloudwatch_namespace, "sentiment.analysis.duration.avg", "company", "*", "model", "*"]
          ],
          "stat" : "Average"
        }
      },

      # Widget 2: Gauge for selskaper oppdaged i et api kall
      {
        "type" : "metric",
        "x" : 0,
        "y" : 6,
        "width" : 6,
        "height" : 3,
        "properties" : {
          "view" : "singleValue",
          "region" : var.aws_region,
          "title" : "Companies Detected",
          "metrics" : [
            [ var.cloudwatch_namespace, "sentiment.companies.detected.value" ]
          ],
          "stat" : "Average"
        }
      }
    ]
  })
}
