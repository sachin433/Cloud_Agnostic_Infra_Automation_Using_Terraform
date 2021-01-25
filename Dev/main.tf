#plugin for aws
provider "aws" {
  region = "us-east-2"

}

#plugin for openstack
terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.33.0"
    }
    aws = {
      source = "hashicorp/aws"
    }
    nutanix = {
      source = "nutanix/nutanix"
    }
  }
}

provider "openstack" {
  # Configuration options
  auth_url = "http://example.com"
}

provider "nutanix" {
  username = "USERNAME"
  //password = "ENTERPASSWORD"
  endpoint = "example1.com"
  port     = 9441
  insecure = true
}

module "aws_module" {
  source = "../modules/aws"
  count  = "${var.cloud_provider == "aws" ? 1 : 0}"
  vpc_id = "vpc-b487457"
  # subnet_tag       = "PublicSubnet*"
  subnet_tag = "Default-Subnet*"
  # sg_tag           = "web_sg1"
  sg_tag           = "Default_key"
  root_volume_size = "100"
  # environment_type = "openshift"
  #Please ensure that every project has  its own workspace."terraform workspace new <env_name>"
  env_name = "${terraform.workspace}"

  #comment the instance_counts & instance_size variable for Openshift deployment
  instance_counts = var.instance_counts
  instance_size   = var.instance_size
  ami_id          = "ami-01ed306a12b7d1c96"
  is_efs_needed   = "false"
  # instance_type = "t2.small"
  #below detail is exported from vpc folder itself therefore "my_module"
  # subnet_ids    = "${module.aws_module.subnetids}"
  # securitygroup = "${module.aws_module.securitygroup}"
}


module "openstack_module" {
  source           = "../modules/openstack"
  count            = "${var.cloud_provider == "openstack" ? 1 : 0}"
  root_volume_size = "100"
  imageId          = "288e4040-b4f8-4c28-93f0-4ecb8"
  volumeType       = "my_vol_type"
  # instance_counts  = var.instance_counts
  securitygroup = "my_sg"
  networkGroup  = "my_sg"

}

module "nutanix_module" {
  source            = "../modules/nutanix"
  count             = "${var.cloud_provider == "nutanix" ? 1 : 0}"
  instance_counts   = var.instance_counts
  number_of_sockets = var.number_of_sockets
  vcpu_per_core     = var.vcpu_per_core
  RAM_Count         = var.RAM_Count
  project_uuid      = var.project_uuid

}
