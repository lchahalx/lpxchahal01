output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.eks
}

output "cluster_endpoint" {
  description = "Endpoint of the EKS cluster"
  value       = aws_eks_cluster.eks.endpoint
}

output "cluster_oidc_issuer_url" {
  description = "OIDC issuer URL of the EKS cluster"
  value       = aws_eks_cluster.eks.identity[0].oidc[0].issuer
}

output "kubeconfig_certificate_authority_data" {
  description = "Certificate authority data for kubeconfig"
  value       = aws_eks_cluster.eks.certificate_authority[0].data
}

output "node_security_group_id" {
  description = "Primary security group ID of the EKS cluster"
  value       = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
}