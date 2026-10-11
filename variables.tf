variable "wafregional_web_acls" {
  description = <<EOT
Map of wafregional_web_acls, attributes below
Required:
    - metric_name
    - name
    - default_action (block):
        - type (required)
Optional:
    - region
    - tags
    - tags_all
    - logging_configuration (block):
        - log_destination (required)
        - redacted_fields (optional, block):
            - field_to_match (required, block):
                - data (optional)
                - type (required)
    - rule (block):
        - action (optional, block):
            - type (required)
        - override_action (optional, block):
            - type (required)
        - priority (required)
        - rule_id (required)
        - type (optional)
EOT

  type = map(object({
    metric_name = string
    name        = string
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
    default_action = object({
      type = string
    })
    logging_configuration = optional(object({
      log_destination = string
      redacted_fields = optional(object({
        field_to_match = list(object({
          data = optional(string)
          type = string
        }))
      }))
    }))
    rule = optional(list(object({
      action = optional(object({
        type = string
      }))
      override_action = optional(object({
        type = string
      }))
      priority = number
      rule_id  = string
      type     = optional(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.wafregional_web_acls : (
        v.logging_configuration == null || (v.logging_configuration.redacted_fields == null || (length(v.logging_configuration.redacted_fields.field_to_match) >= 1))
      )
    ])
    error_message = "Each field_to_match list must contain at least 1 items"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

