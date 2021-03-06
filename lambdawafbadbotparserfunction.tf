###############################################################################
#   Copyright 2016 Cerbo.IO, LLC.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
###############################################################################

resource "aws_lambda_function" "LambdaWAFBadBotParserFunction" {
    function_name = "${var.customer}-LambdaWAFBadBotParserFunction-${element(split("-",uuid()),0)}"
    description = "This lambda function will intercepts and inspects trap endpoint requests to extract its IP address, and then add it to an AWS WAF block list."
    role = "${aws_iam_role.LambdaRoleBadBot.arn}"
    handler = "access-handler.lambda_handler"
    filename = "${path.module}/${var.bad-bot-parser-lambda-path}"
    runtime = "python2.7"
    memory_size = "128"
    timeout = "300"
    environment {
        variables = {
            CloudFrontAccessLogBucket = "${var.CloudFrontAccessLogBucket}"
            ActivateBadBotProtectionParam = "${var.ActivateBadBotProtectionParam}"
            ActivateHttpFloodProtectionParam = "${var.ActivateHttpFloodProtectionParam}"
            ActivateReputationListsProtectionParam = "${var.ActivateReputationListsProtectionParam}"
            ActivateScansProbesProtectionParam = "${var.ActivateScansProbesProtectionParam}"
            CrossSiteScriptingProtectionParam = "${var.CrossSiteScriptingProtectionParam}"
            SqlInjectionProtectionParam = "${var.SqlInjectionProtectionParam}"
            ErrorThreshold = "${var.ErrorThreshold}"
            RequestThreshold = "${var.RequestThreshold}"
            WAFBlockPeriod = "${var.WAFBlockPeriod}"
            WAFBadBotSet = "${aws_waf_ipset.WAFBadBotSet.id}"
            SendAnonymousUsageData = "${var.SendAnonymousUsageData}"
            UUID = "${uuid()}"
        }
    }

    tags {
        Name = "WAF Security Automations"
        Region = "${data.aws_region.current_region.name}"
        Application = "${var.application}"
    }
}
