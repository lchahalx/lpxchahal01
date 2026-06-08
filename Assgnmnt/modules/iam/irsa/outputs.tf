output "role_arn" {
  description = "ARN of the IRSA role"
  value       = aws_iam_role.irsa.arn
}