resource "aws_s3_bucket" "WAFCloudfrontAccessLog" {
  bucket = "${var.CloudFrontAccessLogBucket}"
  acl = "log-delivery-write"

  tags{
    Name = "WAF Security Automations"
    Enviroment = "nthgendevops"
  }
}