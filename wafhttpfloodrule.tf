resource "aws_waf_rate_based_rule" "http-flood-rule-1" {
  metric_name = "HTTPFloodRule"
  name = "${var.waf-name} - HTTP Flood Rule"
  rate_key = "IP"
  rate_limit = 2000
}