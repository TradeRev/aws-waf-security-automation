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

resource "aws_waf_web_acl" "WAFWebACL" {
    depends_on = ["aws_waf_rule.WAFWhitelistRule", "aws_waf_rule.WAFBlacklistRule", "aws_waf_rule.WAFAutoBlockRule", "aws_waf_rule.WAFIPReputationListsRule1", "aws_waf_rule.WAFIPReputationListsRule2", "aws_waf_rule.WAFBadBotRule", "aws_waf_rule.WAFSqlInjectionRule", "aws_waf_rule.WAFXssRule"]
    name = "${var.waf-name}"
    metric_name = "SecurityAutomationsMaliciousRequesters"
    default_action {
        type = "ALLOW"
    }
    rules {
        action {
            type = "ALLOW"
        }
        priority = 10
        rule_id = "${aws_waf_rule.WAFWhitelistRule.id}"
    }
    rules {
        action {
            type = "BLOCK"
        }
        priority = 20
        rule_id = "${aws_waf_rule.WAFBlacklistRule.id}"
    }
    rules {
        action {
            type = "BLOCK"
        }
        priority = 30
        rule_id = "${aws_waf_rule.WAFAutoBlockRule.id}"
    }
    rules {
        action {
            type = "BLOCK"
        }
        priority = 35
        rule_id = "${aws_waf_rate_based_rule.http-flood-rule-1.id}"
        type = "RATE_BASED"
    }
    rules {
        action {
            type = "BLOCK"
        }
        priority = 40
        rule_id = "${aws_waf_rule.WAFIPReputationListsRule1.id}"
    }
    rules {
        action {
            type = "BLOCK"
        }
        priority = 50
        rule_id = "${aws_waf_rule.WAFIPReputationListsRule2.id}"
    }
    rules {
        action {
            type = "BLOCK"
        }
        priority = 60
        rule_id = "${aws_waf_rule.WAFBadBotRule.id}"
    }
    rules {
        action {
            type = "BLOCK"
        }
        priority = 70
        rule_id = "${aws_waf_rule.WAFSqlInjectionRule.id}"
    }
    rules {
        action {
            type = "BLOCK"
        }
        priority = 80
        rule_id = "${aws_waf_rule.WAFXssRule.id}"
    }
    rules {
        action {
            type="BLOCK"
        }
        priority = 90
        rule_id = "${aws_waf_rate_based_rule.BrokenAuthSessionManageRule.id}"
        type = "RATE_BASED"
    }

    provisioner "local-exec" {
        command = "aws cloudwatch put-metric-data --namespace WAF --metric-name WhitelistRule --unit Count --value 0 --dimensions Rule=${aws_waf_rule.WAFWhitelistRule.metric_name},WebACL=${aws_waf_web_acl.WAFWebACL.metric_name}"
    }

    provisioner "local-exec" {
        command = "aws cloudwatch put-metric-data --namespace WAF --metric-name BlacklistRule --unit Count --value 0 --dimensions Rule=${aws_waf_rule.WAFBlacklistRule.metric_name},WebACL=${aws_waf_web_acl.WAFWebACL.metric_name}"
    }

    provisioner "local-exec" {
        command = "aws cloudwatch put-metric-data --namespace WAF --metric-name AutoBlockRule --unit Count --value 0 --dimensions Rule=${aws_waf_rule.WAFAutoBlockRule.metric_name},WebACL=${aws_waf_web_acl.WAFWebACL.metric_name}"
    }

    provisioner "local-exec" {
        command = "aws cloudwatch put-metric-data --namespace WAF --metric-name IPReputationList1 --unit Count --value 0 --dimensions Rule=${aws_waf_rule.WAFIPReputationListsRule1.metric_name},WebACL=${aws_waf_web_acl.WAFWebACL.metric_name}"
    }

    provisioner "local-exec" {
        command = "aws cloudwatch put-metric-data --namespace WAF --metric-name IPReputationList2 --unit Count --value 0 --dimensions Rule=${aws_waf_rule.WAFIPReputationListsRule2.metric_name},WebACL=${aws_waf_web_acl.WAFWebACL.metric_name}"
    }

    provisioner "local-exec" {
        command = "aws cloudwatch put-metric-data --namespace WAF --metric-name BadBotRule --unit Count --value 0 --dimensions Rule=${aws_waf_rule.WAFBadBotRule.metric_name},WebACL=${aws_waf_web_acl.WAFWebACL.metric_name}"
    }

    provisioner "local-exec" {
        command = "aws cloudwatch put-metric-data --namespace WAF --metric-name SQLInjectionRule --unit Count --value 0 --dimensions Rule=${aws_waf_rule.WAFSqlInjectionRule.metric_name},WebACL=${aws_waf_web_acl.WAFWebACL.metric_name}"
    }

    provisioner "local-exec" {
        command = "aws cloudwatch put-metric-data --namespace WAF --metric-name XSSRule --unit Count --value 0 --dimensions Rule=${aws_waf_rule.WAFXssRule.metric_name},WebACL=${aws_waf_web_acl.WAFWebACL.metric_name}"
    }
}
