variable "pagerduty_endpoint" {
  type = "string"
  default = "https://events.pagerduty.com/integration/afad10ebd07c47ff88a77d06e6fee376/enqueue"
}

variable "splunk_hec_endpoint" {
  type = "string"
  default = "https://http-inputs-karauctionservices.splunkcloud.com/services/collector/event"
}

variable "splunk_hec_token" {
  type = "string"
  default = "D1ABC097-FC14-4988-9E07-E7CEAB878F22"
}

variable "waf_kinesis_name" {
  type = "string"
  default = "aws-waf-logs-devops-env"
}

variable "s3_bucket_name" {
  type = "string"
  default = "tr-waf-s3"
}

variable "logging_bucket_name" {
  type = "string"
  default = "tr-waf-logging-bucket"
}

variable "aws-account-id" {
  type = "string"
  default = "082894742960"
}

variable "waf-kinesis-role-name" {
  type = "string"
  default = "tr-waf-kinesis-role-dev"
}

variable "solutionhelper-lambda-path" {
  type = "string"
  description = "path to the solution helper lambda code"
  default = "files/solution-helper/solution-helper.zip"
}

variable "rep-list-lambda-path" {
  type = "string"
  description = "path to the reputation list paser lambda code"
  default = "files/reputation-lists-parser/reputation-lists-parser.zip"
}

variable "log-parser-lambda-path" {
  type = "string"
  description = "path to the log parser lambda code"
  default = "files/log-parser/log-parser.zip"
}

variable "bad-bot-parser-lambda-path" {
  type = "string"
  description = "path to the bad bot parser lambda code"
  default = "files/access-handler/access-handler.zip"
}

variable "custom-resource-lambda-path" {
  type = "string"
  description = "path to the custom resource lambda code"
  default = "files/custom-resource/custom-resource.zip"
}

variable "kinesis-log-config-redacted-list" {
  type = "string"
  description = "A list of fields to redact from the waf logs"
  default = "[{Type=HEADER,Data=cookie},{Type=HEADER,Data=authorization}]"
}

variable "sns-topic-name" {
  type = "string"
  default = "Alert_CW_WAF_Rule"
}

variable "waf-kinesis-firehose-policy" {
  type = "string"
  default = "waf-kinesis-policy"
}