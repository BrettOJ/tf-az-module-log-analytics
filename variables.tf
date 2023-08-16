variable "resource_group_name" {
  description = "(Required) Resource groups map"
}

variable "location" {
  description = "(Required) Location of the resources"
}

variable "solution_plan_map" {
  description = "(Optional) Map structure containing the list of solutions to be enabled.See https://docs.microsoft.com/en-us/azure/azure-monitor/insights/solutions-inventory"
  type        = map(any)
}

variable "sku" {
  description = "(Required) sku for log analytics workspace. (Premium, Standard, Standalone, Unlimited, and PerGB2018)"
}

variable "naming_convention_info" {
  description = "(Required) Specify the naming convention information to the resource."
  type = object({
    name         = string
    agency_code  = string
    agency_code  = string
    project_code = string
    env          = string
    zone         = string
    tier         = string
  })
}

variable "tags" {
  type        = map(string)
  description = "Specify the tags to the resource. Additional tags will be appended based on the convention"
}

variable "dependencies" {
  description = "List of dependecies modules or resources"
  default     = null
}

variable "allow_resource_only_permissions" {
  description = "(Optional) Specifies if the log Analytics Workspace allow users accessing to data associated with resources they have permission to view, without permission to workspace. Defaults to true."
  type        = bool
  default     = true
}

variable "local_authentication_disabled" {
  description = "(Optional) Specifies if the log Analytics workspace should enforce authentication using Azure AD. Defaults to false."
  type        = bool
  default     = false
}

variable "retention_in_days" {
  description = "(Optional) The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
  type        = number
  default     = 30
}

variable "daily_quota_gb" {
  description = "(Optional) The workspace daily quota for ingestion in GB. Defaults to -1 (unlimited) if omitted."
  type        = number
  default     = -1
}

variable "cmk_for_query_forced" {
  description = "(Optional) Is Customer Managed Storage mandatory for query management?"
  type        = bool
  default     = false
}

variable "internet_ingestion_enabled" {
  description = "(Optional) Should the Log Analytics Workspace support ingestion over the Public Internet? Defaults to true."
  type        = bool
  default     = true
}

variable "internet_query_enabled" {
  description = "(Optional) Should the Log Analytics Workspace support querying over the Public Internet? Defaults to true."
  type        = bool
  default     = true
}

variable "reservation_capacity_in_gb_per_day" {
  description = "(Optional) The capacity reservation level in GB for this workspace. Possible values are 100, 200, 300, 400, 500, 1000, 2000 and 5000."
  type        = number
  default     = 100
}

