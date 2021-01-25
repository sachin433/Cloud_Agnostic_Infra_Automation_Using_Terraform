# terraform {
#   required_providers {
#     openstack = {
#       source  = "terraform-provider-openstack/openstack"
#       version = "1.33.0"
#     }
#   }
# }
#
# provider "openstack" {
#   # Configuration options
# }
resource "openstack_blockstorage_volume_v2" "myvol" {
  count = length(local.instance_list)
  name  = "${terraform.workspace}-${local.instance_list[count.index]}"
  #  name              = "myvol"
  size              = var.root_volume_size
  availability_zone = var.availability_zone
  volume_type       = var.volumeType
}

resource "openstack_compute_instance_v2" "myinstance" {
  count = length(local.instance_list)
  name  = "${terraform.workspace}-${local.instance_list[count.index]}"
  #image_name = RHEL-7.2_x86_64
  image_id = var.imageId
  #2VCPU 4 GB
  flavor_name       = "type-Small"
  key_pair          = "key_terra"
  availability_zone = var.availability_zone
  security_groups   = ["${var.securitygroup}"]

  network {
    name = var.networkGroup
  }
}

resource "openstack_compute_volume_attach_v2" "attached" {
  count       = length(local.instance_list)
  instance_id = "${openstack_compute_instance_v2.myinstance[count.index].id}"
  volume_id   = "${openstack_blockstorage_volume_v2.myvol[count.index].id}"
}
