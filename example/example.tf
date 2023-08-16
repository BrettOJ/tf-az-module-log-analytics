locals {
  tags = {
    "created-by" = "Terraform"

  }

  naming_convention_info = {
    name         = "eg"
    project_code = "boj"
    env          = "dev"
    zone         = "z1"
    agency_code  = "brettoj"
    tier         = "web"
  }
}

module "resource_groups" {
  source = "git::https://github.com/BrettOJ/tf-az-module-resource-group?ref=main"
  resource_groups = {
    1 = {
      name                   = var.resource_group_name
      location               = var.location
      naming_convention_info = local.naming_convention_info
      tags                   = local.tags
    }
  }
}


module "azure_log_analytics_workspace" {
  source                             = "../"
  location                           = var.location
  resource_group_name                = var.resource_group_name
  naming_convention_info             = local.naming_convention_info
  tags                               = local.tags
  sku                                = var.sku
  allow_resource_only_permissions    = var.allow_resource_only_permissions
  local_authentication_disabled      = var.local_authentication_disabled
  retention_in_days                  = var.retention_in_days
  daily_quota_gb                     = var.daily_quota_gb
  cmk_for_query_forced               = var.cmk_for_query_forced
  internet_ingestion_enabled         = var.internet_ingestion_enabled
  internet_query_enabled             = var.internet_query_enabled
  reservation_capacity_in_gb_per_day = var.reservation_capacity_in_gb_per_day
  depends_on                         = var.dependencies
}