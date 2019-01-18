resource "aws_s3_bucket" "waf-logging-bucket" {
  bucket = "${var.logging_bucket_name}"
  acl = "log-delivery-write"

  tags {
    Name = "WAF Security Automations"
    Region = "${data.aws_region.current_region.name}"
    Application = "${var.application}"
  }
}

resource "aws_s3_bucket" "waf_kinesis_bucket" {
  bucket = "${var.s3_bucket_name}"
  acl    = "private"

  logging {
    target_bucket = "${aws_s3_bucket.waf-logging-bucket.bucket}"
    target_prefix = "s3logs"
  }

  tags {
    Name = "WAF Security Automations"
    Region = "${data.aws_region.current_region.name}"
    Application = "${var.application}"
  }
}


