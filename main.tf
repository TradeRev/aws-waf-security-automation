provider "aws" {
  region = "${var.aws_region}"
}


variable "customer" {
  description = "[REQUIRED] Customer/Project Name (max 15 characters):"
  default     = "tr-waf-"
}

variable "waf-name" {
  description = "Name of the WAF and the direct associated components"
  default = "TR-WAF"
}

variable "CloudFrontAccessLogBucket" {
  description = "[REQUIRED] CDN S3 Logs Bucket:"
  default     = "tr-aws-waf-cloudfront"
}

###############################################################################
# CUSTOM VARIABLES - TUNNING WAF #
#   BE CAREFUL, MASSIVE IMPACT   #
##################################
variable "ErrorThreshold" {
  default = "50"
}
#default = "400"
variable "RequestThreshold" {
  default = "400"
}
variable "WAFBlockPeriod" {
  default = "240"
}



###############################################################################
# TURN ON COMPONENTS #
#    DO NOT TOUCH    #
######################
variable "ActivateBadBotProtectionParam" {
  default = "yes"
}
variable "ActivateHttpFloodProtectionParam" {
  default = "yes"
}
variable "ActivateReputationListsProtectionParam" {
  default = "yes"
}
variable "ActivateScansProbesProtectionParam" {
  default = "yes"
}
variable "CrossSiteScriptingProtectionParam" {
  default = "yes"
}
variable "SqlInjectionProtectionParam" {
  default = "yes"
}



###############################################################################
# IMPROVE AWS WAF #
###################
# Helps Amazon tune WAF functionality - highly recommended
variable "SendAnonymousUsageData" {
  default = "yes"
}


###############################################################################
# REGION - us-east-1 #
######################
# Used by modules - DO NOT REMOVE!
variable "aws_region" {
  description = "AWS US-East-1 region"
  default     = "us-east-1"
}

data "aws_region" "current_region" {}


###############################################################################
# GET AWS ACCOUNT #
###################
data "aws_caller_identity" "current" { }
output "account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}

###############################################################################
#Application
###############################################################################
variable "application" {
  description = "The software use to provision the infrastructure"
  default = "Terraform"
}