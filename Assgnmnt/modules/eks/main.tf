resource "aws_eks_cluster" "eks" {
  name     = "${var.project}-cluster"
  version  = var.cluster_version
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids              = var.private_subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  tags = var.common_tags

  depends_on = [var.cluster_role_arn]
}

# Node Group 

resource "aws_eks_node_group" "eks_ng" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "${var.project}-node-group"
  node_role_arn   = var.node_group_role_arn
  subnet_ids      = var.private_subnet_ids
  instance_types  = var.instance_types
  capacity_type   = var.capacity_type

  scaling_config {
    min_size     = var.min_size
    max_size     = var.max_size
    desired_size = var.desired_size
  }

  tags = var.common_tags
}

# Addons 

resource "aws_eks_addon" "vpc_cni" {
  cluster_name      = aws_eks_cluster.eks.name
  addon_name        = "vpc-cni"
  addon_version     = var.addon_vpc_cni_version

  tags = var.common_tags
}

resource "aws_eks_addon" "coredns" {
  cluster_name      = aws_eks_cluster.eks.name
  addon_name        = "coredns"
  addon_version     = var.addon_coredns_version

  tags = var.common_tags

  depends_on = [aws_eks_node_group.eks_ng]
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name      = aws_eks_cluster.eks.name
  addon_name        = "kube-proxy"
  addon_version     = var.addon_kube_proxy_version

  tags = var.common_tags
}
