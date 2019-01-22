resource "aws_sns_topic" "Alert_CW_WAF_Rule" {
  name = "${var.sns-topic-name}"
}

resource "aws_sns_topic_subscription" "Pagerduty-Alert" {
  endpoint = "${var.pagerduty_endpoint}"
  endpoint_auto_confirms = true
  protocol = "https"
  topic_arn = "${aws_sns_topic.Alert_CW_WAF_Rule.arn}"
}