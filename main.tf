# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53profiles_association
# Creating association a Route 53 Profiles profile with a VPC.
resource "aws_route53profiles_association" "this" {
  for_each = var.create && var.profile_association != {} ? var.profile_association : {}

  name        = each.key
  profile_id  = each.value
  region      = var.region
  resource_id = var.resource_id

  tags = var.tags
}
