/*resource "local_file" "kinesislogging" {
  content = <<JSON
    {"ResourceArn": "arn:aws:waf::${var.aws-account-id}/${aws_waf_web_acl.WAFWebACL.id}",
    "LogDestinationConfigs": ["${aws_kinesis_firehose_delivery_stream.aws-waf-logs.arn}"],
    "RedactedFields": [
      {
        "Type": "HEADER",
        "Data": "cookie"
      },
      {
        "Type": "HEADER",
        "Data": "authorization"
      }]}
  JSON
  filename = "${path.module}/kinesislogging.json"
}
*/


/*resource "local_file" "waf-kinesis-logging" {
  content = <<JSON
    {
     "LoggingConfiguration": {
        "LogDestinationConfigs": [ "${aws_kinesis_firehose_delivery_stream.aws-waf-logs.arn}" ],
        "RedactedFields": [
           {
              "Type": "HEADER",
              "Data": "cookie"
            },
          {
            "Type": "HEADER",
            "Data": "authorization"
          }
        ],
        "ResourceArn": "arn:aws:waf::${var.aws-account-id}/${aws_waf_web_acl.WAFWebACL.id}"
     }
  }
JSON
  filename = "${path.module}/kinesislogging_config.json"
}
*/

/*
data "template_file" "kinesislogging" {
  template = "${file("${path.module}/kinesislogging_config.json")}"

  vars {
    aws_account_id = "${var.aws-account-id}"
    aws_waf_id = "${aws_waf_web_acl.WAFWebACL.id}"
    aws_firehose_arn = "${aws_kinesis_firehose_delivery_stream.aws-waf-logs.arn}"
  }
}
*/

/*data "template_file" "kinesislogging" {
  template = <<JSON
  {
     "LoggingConfiguration": {
        "LogDestinationConfigs": [ "${aws_kinesis_firehose_delivery_stream.aws-waf-logs.arn}" ],
        "RedactedFields": [
           {
              "Type": "HEADER",
              "Data": "cookie"
            },
          {
            "Type": "HEADER",
            "Data": "authorization"
          }
        ],
        "ResourceArn": "arn:aws:waf::${var.aws-account-id}/${aws_waf_web_acl.WAFWebACL.id}"
     }
  }
JSON
  vars {
    aws_account_id = "${var.aws-account-id}"
    aws_waf_id = "${aws_waf_web_acl.WAFWebACL.id}"
    aws_kinesis_arn = "${aws_kinesis_firehose_delivery_stream.aws-waf-logs.arn}"
  }
}

*/
resource "aws_kinesis_firehose_delivery_stream" "aws-waf-logs" {
  name        = "${var.waf_kinesis_name}"
  destination = "splunk"

  s3_configuration {
    role_arn        = "${aws_iam_role.waf_kinesis_firehose_role.arn}"
    bucket_arn      = "${aws_s3_bucket.waf_kinesis_bucket.arn}"
    buffer_size     = "5"                                             #5 megabytes
    buffer_interval = "300"                                           #300 seconds
  }

  splunk_configuration {
    hec_endpoint               = "${var.splunk_hec_endpoint}"
    hec_token                  = "${var.splunk_hec_token}"
    hec_acknowledgment_timeout = 180
    hec_endpoint_type          = "Raw"
    s3_backup_mode             = "FailedEventsOnly"
  }


  provisioner "local-exec" {
    command = "aws waf put-logging-configuration --logging-configuration 'ResourceArn=arn:aws:waf::${var.aws-account-id}:webacl/${aws_waf_web_acl.WAFWebACL.id},LogDestinationConfigs=${aws_kinesis_firehose_delivery_stream.aws-waf-logs.arn},RedactedFields=${var.kinesis-log-config-redacted-list}'"
  }


  /*
  provisioner "local-exec" {
    command = "aws waf put-logging-configuration --logging-configuration ${file("kinesislogging_config.json")}"
  }
*/

}


