resource "aws_cloudwatch_metric_alarm" "cw-whitelistrule" {
  alarm_name = "Whitelist Rule Alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = 1
  metric_name = "WhitelistRule"
  namespace = "AWS/WAF"
  period = 60
  threshold = 1
  statistic = "SampleCount"
  alarm_description = "This metric measure the amount of hits from the WAF for ips listed on the whitelist"
  alarm_actions = ["${aws_sns_topic.Alert_CW_WAF_Rule.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "cw_blacklistrule" {
  alarm_name = "Blacklist Rule Alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = 1
  metric_name = "BlacklistRule"
  namespace = "AWS/WAF"
  period = 60
  threshold = 1
  statistic = "SampleCount"
  alarm_description = "This metric measure the amount of hits from the WAF for ips listed on the blacklist"
  alarm_actions = ["${aws_sns_topic.Alert_CW_WAF_Rule.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "cw-autoblock-rule" {
  alarm_name = "AutoBlockRule Alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = 1
  metric_name = "AutoBlockRule"
  namespace = "AWS/WAF"
  period = 60
  threshold = 1
  statistic = "SampleCount"
  alarm_description = "This metric measure the amount of hits from the WAF for ips listed on the AutoBlock Rule"
  alarm_actions = ["${aws_sns_topic.Alert_CW_WAF_Rule.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "cw-ipreplist1-rule" {
  alarm_name = "IP Reputation List 1 Rule Alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = 1
  metric_name = "IPReputationList1"
  namespace = "AWS/WAF"
  period = 60
  threshold = 1
  statistic = "SampleCount"
  alarm_description = "This metric measure the amount of hits from the WAF for ips listed on the IP Reputation List 1 Rule"
  alarm_actions = ["${aws_sns_topic.Alert_CW_WAF_Rule.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "cw-ipreplist2-rule" {
  alarm_name = "IP Reputation List 2 Rule Alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = 1
  metric_name = "IPReputationList2"
  namespace = "AWS/WAF"
  period = 60
  threshold = 1
  statistic = "SampleCount"
  alarm_description = "This metric measure the amount of hits from the WAF for ips listed on the IP Reputation List 2 Rule"
  alarm_actions = ["${aws_sns_topic.Alert_CW_WAF_Rule.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "cw-badbot-rule" {
  alarm_name = "Bad Bot Rule Alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = 1
  metric_name = "BadBotRule"
  namespace = "AWS/WAF"
  period = 60
  threshold = 1
  statistic = "SampleCount"
  alarm_description = "This metric measure the amount of hits from the WAF for ips listed on the BadBot Rule"
  alarm_actions = ["${aws_sns_topic.Alert_CW_WAF_Rule.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "cw-sqlinjection-rule" {
  alarm_name = "SQL Injection Rule Alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = 1
  metric_name = "SQLInjectionRule"
  namespace = "AWS/WAF"
  period = 60
  threshold = 1
  statistic = "SampleCount"
  alarm_description = "This metric measure the amount of hits from the WAF for ips listed on the SQL Injection Rule"
  alarm_actions = ["${aws_sns_topic.Alert_CW_WAF_Rule.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "cw-xss-rule" {
  alarm_name = "XSS Rule Alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = 1
  metric_name = "XSSRule"
  namespace = "AWS/WAF"
  period = 60
  threshold = 1
  statistic = "SampleCount"
  alarm_description = "This metric measure the amount of hits from the WAF for ips listed on the XSS Rule"
  alarm_actions = ["${aws_sns_topic.Alert_CW_WAF_Rule.arn}"]
}