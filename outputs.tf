output "wafregional_web_acls_id" {
  description = "Map of id values across all wafregional_web_acls, keyed the same as var.wafregional_web_acls"
  value       = { for k, v in aws_wafregional_web_acl.wafregional_web_acls : k => v.id if v.id != null && length(v.id) > 0 }
}
output "wafregional_web_acls_arn" {
  description = "Map of arn values across all wafregional_web_acls, keyed the same as var.wafregional_web_acls"
  value       = { for k, v in aws_wafregional_web_acl.wafregional_web_acls : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "wafregional_web_acls_default_action" {
  description = "Map of default_action values across all wafregional_web_acls, keyed the same as var.wafregional_web_acls"
  value       = { for k, v in aws_wafregional_web_acl.wafregional_web_acls : k => one(v.default_action) if v.default_action != null && length(v.default_action) > 0 }
}
output "wafregional_web_acls_logging_configuration" {
  description = "Map of logging_configuration values across all wafregional_web_acls, keyed the same as var.wafregional_web_acls"
  value       = { for k, v in aws_wafregional_web_acl.wafregional_web_acls : k => one(v.logging_configuration) if v.logging_configuration != null && length(v.logging_configuration) > 0 }
}
output "wafregional_web_acls_metric_name" {
  description = "Map of metric_name values across all wafregional_web_acls, keyed the same as var.wafregional_web_acls"
  value       = { for k, v in aws_wafregional_web_acl.wafregional_web_acls : k => v.metric_name if v.metric_name != null && length(v.metric_name) > 0 }
}
output "wafregional_web_acls_name" {
  description = "Map of name values across all wafregional_web_acls, keyed the same as var.wafregional_web_acls"
  value       = { for k, v in aws_wafregional_web_acl.wafregional_web_acls : k => v.name if v.name != null && length(v.name) > 0 }
}
output "wafregional_web_acls_region" {
  description = "Map of region values across all wafregional_web_acls, keyed the same as var.wafregional_web_acls"
  value       = { for k, v in aws_wafregional_web_acl.wafregional_web_acls : k => v.region if v.region != null && length(v.region) > 0 }
}
output "wafregional_web_acls_rule" {
  description = "Map of rule values across all wafregional_web_acls, keyed the same as var.wafregional_web_acls"
  value       = { for k, v in aws_wafregional_web_acl.wafregional_web_acls : k => v.rule if v.rule != null && length(v.rule) > 0 }
}
output "wafregional_web_acls_tags" {
  description = "Map of tags values across all wafregional_web_acls, keyed the same as var.wafregional_web_acls"
  value       = { for k, v in aws_wafregional_web_acl.wafregional_web_acls : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "wafregional_web_acls_tags_all" {
  description = "Map of tags_all values across all wafregional_web_acls, keyed the same as var.wafregional_web_acls"
  value       = { for k, v in aws_wafregional_web_acl.wafregional_web_acls : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}

