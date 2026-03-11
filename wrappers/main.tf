module "wrapper" {
  source = "../"

  for_each = var.items

  create              = try(each.value.create, var.defaults.create, true)
  profile_association = try(each.value.profile_association, var.defaults.profile_association, {})
  region              = try(each.value.region, var.defaults.region, null)
  resource_id         = try(each.value.resource_id, var.defaults.resource_id)
  tags                = try(each.value.tags, var.defaults.tags, {})
}
