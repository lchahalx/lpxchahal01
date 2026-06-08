# DB Password from Secrets Manager

data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = "${var.project}/db_password"
}

# DB Subnet Group 

resource "aws_db_subnet_group" "eks" {
  name = "${replace(var.project, "_", "-")}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = var.common_tags
}

# Security Group 

resource "aws_security_group" "rds" {
  name = "${replace(var.project, "_", "-")}-rds-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.eks_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}

# RDS Instance 

resource "aws_db_instance" "eks" {
  identifier = "${replace(var.project, "_", "-")}-db"
  engine            = "postgres"
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  db_name           = var.db_name
  username          = var.db_username
  password = jsondecode(data.aws_secretsmanager_secret_version.db_password.secret_string)["password"]
  db_subnet_group_name   = aws_db_subnet_group.eks.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  multi_az               = false
  publicly_accessible    = false
  storage_encrypted      = true
  allocated_storage      = var.allocated_storage
  skip_final_snapshot    = true
  deletion_protection    = false

  tags = var.common_tags
}