# variable "environment_type" {
#   default = "test"
# }
variable "env_name" {
  default = "Openshift-Fresh"
}

variable "vpc_id" {}
variable "subnet_tag" {
  default = "PublicSubnet*"
}
variable "sg_tag" {
  default = "web_sg"
}

variable "is_efs_needed" {
  default = "false"
}
# variable "ec2_count" {
#   type = map(string)
#   default = {
#     "test"      = 4
#     "openshift" = 8
#     "vm"        = 22
#   }
# }
#variable "cloud_provider" {}

variable "ami_id" {
  default = "ami-098f16afa9edf40be"
  #  type = map(string)
  #  default = {
  #    "us-east-1" = "ami-098f16afa9edf40be"
  #    "us-west-2" = "ami-036affea69a1101c9"
  #  }
}


# variable "subnet_ids" {}
# variable "securitygroup" {}
variable "instance_counts" {
  default = {
    "Kafka"             = 3
    "Microservice"      = 0
    "Influx_Pentaho"    = 1
    "API_Elasticsearch" = 1
    "Rabbitmq"          = 1
    "Repo_Redis"        = 1
  }
}
variable "instance_size" {
  default = {
    "Kafka"             = "t2.medium"
    "Microservice"      = "t2.medium"
    "Influx_Pentaho"    = "t2.xlarge"
    "API_Elasticsearch" = "t2.medium"
    "Rabbitmq"          = "t2.medium"
    "Repo_Redis"        = "t2.medium"
  }
}

variable "root_volume_size" {}
# variable "listeners" {
#   default = {
#     "mds"       = 5065
#     "statement" = 3131
#     "web"       = 8080
#
#   }
# }
