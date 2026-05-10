terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "rds_terra" {
  identifier = "actividad2-terra"

  engine         = "mysql"
  engine_version = "5.7"
  instance_class = "db.t3.micro"

  allocated_storage = 15
  storage_type      = "gp2"
  storage_encrypted = true

  db_name  = "DB_terra"
  username = "admTerra"
  password = "Viu2022Terra"

  backup_retention_period = 15
  backup_window           = "03:00-04:00"
  maintenance_window      = "sun:05:00-sun:06:00"

  skip_final_snapshot = true
  publicly_accessible = false

  tags = {
    Name = "actividad2-terra"
  }
}