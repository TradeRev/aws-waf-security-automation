resource "aws_waf_rate_based_rule" "BrokenAuthSessionManageRule" {
  metric_name = "BrokenAuthSessionManageMetric"
  name = "${var.waf-name} - BrokenAuthSessionManageRule"
  rate_key = "IP"
  rate_limit = 2000

  predicates {
    data_id = "${aws_waf_byte_match_set.Header-set-1.id}"
    negated = false
    type = "ByteMatch"
  }

  predicates {
    data_id = "${aws_waf_byte_match_set.Header-set-2.id}"
    negated = false
    type = "ByteMatch"
  }

  predicates {
    data_id = "${aws_waf_byte_match_set.Header-set-3.id}"
    negated = false
    type = "ByteMatch"
  }

  predicates {
    data_id = "${aws_waf_byte_match_set.Header-set-4.id}"
    negated = false
    type = "ByteMatch"
  }

  predicates {
    data_id = "${aws_waf_byte_match_set.URI-set-1.id}"
    negated = false
    type = "ByteMatch"
  }

  predicates {
    data_id = "${aws_waf_byte_match_set.URI-set-2.id}"
    negated = false
    type = "ByteMatch"
  }

}

