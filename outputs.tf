output "id" {
  value       = { for k, v in aws_route53profiles_association.this : k => v.id }
  description = "ID of the Profiles Association"
}
