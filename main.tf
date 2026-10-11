resource "aws_wafregional_web_acl" "wafregional_web_acls" {
  for_each = var.wafregional_web_acls

  metric_name = each.value.metric_name
  name        = each.value.name
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  default_action {
    type = each.value.default_action.type
  }

  dynamic "logging_configuration" {
    for_each = each.value.logging_configuration != null ? [each.value.logging_configuration] : []
    content {
      log_destination = logging_configuration.value.log_destination
      dynamic "redacted_fields" {
        for_each = logging_configuration.value.redacted_fields != null ? [logging_configuration.value.redacted_fields] : []
        content {
          dynamic "field_to_match" {
            for_each = redacted_fields.value.field_to_match
            content {
              data = field_to_match.value.data
              type = field_to_match.value.type
            }
          }
        }
      }
    }
  }

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {
      dynamic "action" {
        for_each = rule.value.action != null ? [rule.value.action] : []
        content {
          type = action.value.type
        }
      }
      dynamic "override_action" {
        for_each = rule.value.override_action != null ? [rule.value.override_action] : []
        content {
          type = override_action.value.type
        }
      }
      priority = rule.value.priority
      rule_id  = rule.value.rule_id
      type     = rule.value.type
    }
  }
}

