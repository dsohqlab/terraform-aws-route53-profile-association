# terraform-aws-route53-profile-association

Terraform module that creates one or more AWS Route53 Profile associations for a target VPC.

- AWS documentation: [Associate Route53 Profiles with VPCs](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/profile-associate-vpcs.html)

## Usage

To create Route 53 Profile associations with a VPC, define the following input variables:

1. `resource_id` - The ID of the target VPC
2. `profile_association` - A map of Route 53 Profile association names to resource IDs that should be associated with the VPC.

## Examples

### Multiple profiles association

```hcl
module "route53_profile_association" {
  source  = "dsohqlab/route53-profile-association/aws"
  version = "~> 1.0.0"

  resource_id = "vpc-0abc123def4567890"

  profile_association = {
    core-dns = "rp-abc123def456"
    app-dns  = "rp-123abc456def"
  }

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}
```

### Single profile association

```hcl
module "route53_profile_association" {
  source  = "dsohqlab/route53-profile-association/aws"
  version = "~> 1.0.0"

  resource_id = "vpc-0abc123def4567890"

  profile_association = {
    default = "rp-abc123def456"
  }
}
```

### Disabled module for conditional deployment

```hcl
module "route53_profile_association" {
  source  = "dsohqlab/route53-profile-association/aws"
  version = "~> 1.0.0"

  create = false

  # Required by interface, but ignored when create=false
  resource_id          = "vpc-0abc123def4567890"
  profile_association  = {}
}
```

## Best practices notes

- Keep keys in `profile_association` stable because key changes recreate associations.
- Use provider `default_tags` for global tags and reserve module tags for resource-specific metadata.
- Keep VPC IDs environment-scoped; avoid sharing `resource_id` values between workspaces.

## Doc generation

Code formatting and documentation for variables and outputs is generated using
[pre-commit-terraform
hooks](https://github.com/antonbabenko/pre-commit-terraform) which uses
[terraform-docs](https://github.com/terraform-docs/terraform-docs).

Follow [these
instructions](https://github.com/antonbabenko/pre-commit-terraform#how-to-install)
to install pre-commit locally.

And install `terraform-docs` with `go get github.com/terraform-docs/terraform-docs`
or `brew install terraform-docs`.

## Contributing

Report issues/questions/feature requests on in the
[issues](https://github.com/dsohqlab/terraform-aws-route53-profile-association/issues/new)
section.

Full contributing [guidelines are covered
here](https://github.com/dsohqlab/terraform-aws-route53-profile-association/blob/main/.github/CONTRIBUTING.md).
