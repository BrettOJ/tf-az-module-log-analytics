resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                               = module.la_workspace_name.naming_convention_output["${var.naming_convention_info.name}"].names.0
  location                           = var.location
  resource_group_name                = var.resource_group_name
  sku                                = var.sku
  allow_resource_only_permissions    = var.allow_resource_only_permissions
  local_authentication_disabled      = var.local_authentication_disabled
  retention_in_days                  = var.retention_in_days
  daily_quota_gb                     = var.daily_quota_gb
  cmk_for_query_forced               = var.cmk_for_query_forced
  internet_ingestion_enabled         = var.internet_ingestion_enabled
  internet_query_enabled             = var.internet_query_enabled
  reservation_capacity_in_gb_per_day = var.reservation_capacity_in_gb_per_day
  tags                               = module.la_workspace_name.naming_convention_output["${var.naming_convention_info.name}"].tags.0
  depends_on                         = [var.dependencies]
}


resource "azurerm_log_analytics_solution" "la_solution" {
  for_each = var.solution_plan_map != null ? var.solution_plan_map : {}
  
  solution_name         = each.key
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.log_analytics.id
  workspace_name        = azurerm_log_analytics_workspace.log_analytics.name
  tags = module.la_solution_name.naming_convention_output[each.key].tags.0
 

  plan {
    product   = var.solution_plan_map[each.key].product
    publisher = var.solution_plan_map[each.key].publisher
  }
}