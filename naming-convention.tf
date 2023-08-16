
module "la_workspace_name" {
  source      = "git::https://github.com/BrettOJ/tf-az-module-naming-convention?ref=main"
  name_format = "res_type|-|project_code|-|env|zone|tier|-|name"
  naming_convention_info = {
    "${var.naming_convention_info.name}" = {
      name_info = var.naming_convention_info
      tags      = var.tags
    }
  }
  resource_type = "loga"
}


locals {
  la_solution_naming_convention_info = {
    for key, value in var.solution_plan_map : "${key}" => {
      name_info = merge(var.naming_convention_info, { name = key })
      tags      = var.tags
    }
  }
}

module "la_solution_name" {
  source                 = "git::https://github.com/BrettOJ/tf-az-module-naming-convention?ref=main"
  name_format            = "res_type|-|project_code|-|env|zone|tier|-|name"
  naming_convention_info = local.la_solution_naming_convention_info
  resource_type          = "las"
}