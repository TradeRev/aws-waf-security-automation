resource "aws_iam_role" "waf_kinesis_firehose_role" {
  name        = "${var.waf-kinesis-role-name}"
  description = "Allows Kinesis Firehose to transform and deliver data to your destinations using CloudWatch Logs, Lambda, and S3 on your behalf."

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "waf_kinesis_firehose_role_policy" {
  name   = "${var.waf-kinesis-firehose-policy}"
  role   = "${aws_iam_role.waf_kinesis_firehose_role.id}"
  policy = "${file("${path.module}/inline-policy.json")}"
}
