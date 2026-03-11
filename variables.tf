variable "create" {
  description = "Whether to create Route53 Profile associations"
  type        = bool
  default     = true
}

variable "profile_association" {
  description = "Map of association names to Route53 Profile IDs. Example: { app = \"rp-abc123\" }."
  type        = map(string)
  default     = {}
  nullable    = false
}

variable "resource_id" {
  description = "(Required) Resource ID of the VPC the profile to be associated with."
  type        = string
}

variable "region" {
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) Map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type        = map(string)
  default     = {}
}
