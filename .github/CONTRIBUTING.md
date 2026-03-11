# Contributing to terraform-aws-route53-profile-association

Thank you for your interest in contributing! This document provides guidelines and instructions for contributing to this project.

## Code of Conduct

Please be respectful and constructive in all interactions. We're building something useful together.

## How to Contribute

### Reporting Issues

Before creating an issue, please:

1. **Search existing issues** to avoid duplicates
2. **Use the issue templates** when available
3. **Provide context**: Terraform version, cloud provider, error messages

### Pull Request Process

#### 1. Fork and Clone

```bash
git clone https://github.com/dsohqlab/terraform-aws-route53-profile-association.git
cd terraform-aws-route53-profile-association
```

#### 2. Create a Branch

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/your-bug-fix
```

#### 3. Make Your Changes

- Follow existing code patterns and conventions
- Add/update documentation as needed
- Add examples if introducing new features

#### 4. Run Pre-Commit Checks

```bash
# Install pre-commit (one-time)
pip install pre-commit
pre-commit install

# Run checks
pre-commit run -a
```

This will run:

- `terraform fmt` - Code formatting
- `terraform-docs` - Documentation generation
- `tflint` - Linting
- Various other checks

#### 5. Commit Your Changes

Use [Conventional Commits](https://www.conventionalcommits.org/) format:

| Prefix | Use for |
| -------- | --------- |
| `feat:` | New features |
| `fix:` | Bug fixes |
| `docs:` | Documentation only |
| `refactor:` | Code restructuring without behavior change |
| `test:` | Adding or updating tests |
| `ci:` | CI/CD changes |
| `chore:` | Maintenance tasks |

Examples:

```bash
git commit -m "feat: add AWS Route53 Profile module"
git commit -m "fix: correct tags for the module"
git commit -m "docs: improve AWS module examples"
```

#### 6. Submit Pull Request

1. Push your branch to your fork
2. Open a Pull Request against `main`
3. Fill out the PR template
4. Wait for CI checks to pass
5. Address any review feedback

## Development Guidelines

### Module Structure

Each module should follow this structure:

```bash
modules/<type>/<provider>/
├── README.md           # Module documentation
├── main.tf             # Primary resources
├── variables.tf        # Input variables
├── outputs.tf          # Output values
├── versions.tf         # Provider requirements
└── *.tf                # Additional resource files
```

### Documentation Standards

#### README.md

Every module README should include:

1. **Title and description** - What the module does
2. **Usage example** - Minimal working example
3. **Inputs table** - All variables with descriptions
4. **Outputs table** - All outputs with descriptions
5. **Requirements** - Provider versions, dependencies

Use `terraform-docs` markers for auto-generated sections:

```markdown
<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
```

#### Variables

Always include:

- `description` - Clear explanation of the variable's purpose
- `type` - Explicit type constraint
- `default` - When appropriate, with sensible defaults
- `validation` - Input validation blocks for critical variables

```hcl
variable "name" {
  description = "Name of the resource. Used as prefix for all resources."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9-]*[a-z0-9]$", var.name))
    error_message = "Name must be lowercase alphanumeric with hyphens."
  }
}
```

#### Outputs

Always include `description`:

```hcl
output "name" {
  description = "The name of the resource"
  value       = "var.name"
}
```

### Code Style

#### Formatting

- Run `terraform fmt` before committing
- Use 2-space indentation (Terraform default)
- Keep lines under 120 characters when possible

#### Naming Conventions

| Item | Convention | Example |
| ------ | ------------ | --------- |
| Resources | `snake_case` | `aws_route53profiles_association.this` |
| Variables | `snake_case` | `profile_association` |
| Outputs | `snake_case` | `profile_association_id` |
| Locals | `snake_case` | `profile_association_name` |
| Files | `kebab-case.tf` | `profile-association.tf` |

#### Resource Organization

Group related resources in dedicated files:

- `main.tf` - Primary compute resources
- `iam.tf` - IAM roles and policies
- `outputs.tf` - All outputs
- `variables.tf` - All variables
- `versions.tf` - Provider requirements
- `locals.tf` - Local values

### Testing

Currently, testing is manual. When contributing:

1. Test your changes with a real deployment
2. Verify both `terraform plan` and `terraform apply` work
3. Test destruction with `terraform destroy`
4. Document any manual testing performed in the PR

## Semantic Versioning

This project follows [Semantic Versioning](https://semver.org/):

- **MAJOR**: Breaking changes to module interfaces
- **MINOR**: New features, backward compatible
- **PATCH**: Bug fixes, backward compatible

Breaking changes include:

- Removing or renaming variables
- Changing variable types
- Removing outputs
- Changing default behavior significantly

## Questions?

- Open a [Discussion](https://github.com/dsohqlab/terraform-aws-route53-profile-association/discussions)
- Check existing [Issues](https://github.com/dsohqlab/terraform-aws-route53-profile-association/issues)

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.
