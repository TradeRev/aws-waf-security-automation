resource "aws_s3_bucket" "WAFCloudfrontAccessLog" {
  bucket = "${var.CloudFrontAccessLogBucket}"
  acl = "log-delivery-write"

  tags{
    Name = "WAF Security Automations"
    Region = "${data.aws_region.current_region.name}"
    Application = "${var.application}"
  }
}
