data "nutanix_clusters" "clusters" {}

resource "nutanix_virtual_machine" "MyTestVM_TF" {
  count       = length(local.instance_list)
  name        = "${terraform.workspace}-${local.instance_list[count.index]}"
  description = "Created with Terraform"
  # provider             = nutanix
  cluster_uuid = data.nutanix_clusters.clusters.entities.0.metadata.uuid
  # cluster_uuid         = "0005b231-aec3-c536-4d27-3868dd39f168"
  num_vcpus_per_socket = var.vcpu_per_core[local.instance_size_list[count.index]]
  num_sockets          = var.number_of_sockets
  memory_size_mib      = var.RAM_Count[local.instance_size_list[count.index]]
  #  guest_customization_cloud_init_user_data = "${filebase64("${path.module}/scripts/partitionmount.sh")}"
  //guest_customization_cloud_init_user_data = "${base64encode(local.instance_userdata)}"
  project_reference = {
    kind = "project"
    #   name = "DFS_Performance"
    uuid = var.project_uuid
  }
  nic_list {
    subnet_uuid = "98a79bda-a833-4e8e-b7a7-b03f0rthdj"
  }

  disk_list {
    # data_source_reference in the Nutanix API refers to where the source for
    # the disk device will come from. Could be a clone of a different VM or a
    # image like we're doing here
    data_source_reference = {
      kind = "image"
      uuid = "e9ab605b-aae7-4be4-97f567-80"
    }

    #    device_properties {
    #      disk_address = {
    #        device_index = 0
    #        adapter_type = "IDE"
    #      }
    #
    #      device_type = "DISK"
    #    }
  }

  disk_list {
    # defining an additional entry in the disk_list array will create another.
    #disk_size_mib and disk_size_bytes must be set together.
    disk_size_mib   = 100000
    disk_size_bytes = 104857600000
  }
}

 output "ip_address" {
#   value = nutanix_virtual_machine.MyTestVM_TF[*].nic_list_status.0.ip_endpoint_list[0]["ip"]
  value = zipmap(local.instance_name,local.ip_address)
 }
locals {
ip_address = nutanix_virtual_machine.MyTestVM_TF[*].nic_list_status.0.ip_endpoint_list[0]["ip"]
instance_name = nutanix_virtual_machine.MyTestVM_TF[*].name
}

