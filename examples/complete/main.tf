module "route53_profile_association" {
  source = "../.."

  profile_association = {
    core-dns = "rp-abc123def456"
    app-dns  = "rp-123abc456def"
  }

  resource_id = "vpc-0abc123def4567890"

  tags = var.tags
}
