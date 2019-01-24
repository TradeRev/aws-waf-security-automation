resource "aws_s3_bucket" "waf-logging-bucket" {
  bucket = "${var.logging_bucket_name}"
  acl = "log-delivery-write"

  tags {
    Name = "WAF Security Automations"
    Region = "${data.aws_region.current_region.name}"
    Application = "${var.application}"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
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

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

}


