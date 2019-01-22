## AWS WAF Security Automation - modular with Terraform

This terraform code is the converted code from a Cloudformation template created by Amazon. 

![alt text](https://docs.aws.amazon.com/solutions/latest/aws-waf-security-automations/images/waf-solution-architecture.png)

Follow the links below for more information:
https://docs.aws.amazon.com/solutions/latest/aws-waf-security-automations/template.html
https://github.com/awslabs/aws-waf-security-automations

## Changes made

Add a Brute Force Authentication rule
Added cloudwatch alarms for all rules (Exception whitelist) that will be triggered if a certain threshold is hit:

| WAF Rule         | Threshold              |
|------------------|------------------------|
| Blacklist        | 5 hits in 5 minutes    |
| HTTP Flood       | 2000 hits in 5 minutes |  
| Scan Probes      | 5 hits in one day      |
| Reputation list 1| 5 hits in 5 minutes    |
| Reputation list 2| 5 hits in 5 minutes    |
| Bad Bot          | 5 hits in one day      |
| SQL Injection    | 5 hits in one day      |
| XSS              | 5 hits in one day      | 

When the the threshold has been reached, it will raise an incident in pagerduty via sns
The lambdas are created without using s3 buckets

## The setup

1. Create a pagerduty service with cloudwatch alarm integeration
2. Run the terraform code
3. Add the cloudfront distributions that you wished to have behind the waf

Credits goes to the creator, Cerbo, for the original terraform code:

For more info/help, contact them at: support@cerbo.io (http://cerbo.io)

#### LICENSE
```
Copyright 2016 Cerbo.IO, LLC.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
