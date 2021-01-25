resource "aws_efs_file_system" "efs-mount" {
  count            = "${var.is_efs_needed == "true" ? 1 : 0}"
  creation_token   = "${var.env_name}-efs-tf"
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  encrypted        = "false"
  tags = {
    Name = "${var.env_name}-efs-tf"
  }
}

resource "aws_efs_mount_target" "efs-mount" {
  count           = length(local.subnetids) * "${var.is_efs_needed == "true" ? 1 : 0}"
  file_system_id  = "${aws_efs_file_system.efs-mount[0].id}"
  subnet_id       = local.subnetids[count.index]
  security_groups = ["${aws_security_group.ingress-efs-sg[0].id}"]
}

resource "aws_security_group" "ingress-efs-sg" {
  count  = "${var.is_efs_needed == "true" ? 1 : 0}"
  name   = "${var.env_name}-efs-sg"
  vpc_id = var.vpc_id

  // NFS
  ingress {
    security_groups = ["${local.securitygroup}"]
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    cidr_blocks     = ["${local.vpc_cidr}"]
  }

  // Terraform removes the default rule
  egress {
    security_groups = ["${local.securitygroup}"]
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
