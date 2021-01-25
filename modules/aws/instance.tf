resource "aws_instance" "web" {
  count                  = length(local.instance_list)
  ami                    = var.ami_id
  instance_type          = var.instance_size[local.instance_size_list[count.index]]
  subnet_id              = local.subnetids[count.index % length(local.subnetids)]
  vpc_security_group_ids = ["${local.securitygroup}"]
  key_name               = "keypairfile"
  user_data              = "${file("${path.module}/scripts/sudouser.sh")}"
  root_block_device {
    volume_type = "gp2"
    volume_size = var.root_volume_size
  }
  tags = {
    Name = "${var.env_name}-${local.instance_list[count.index]}"
  }
}
