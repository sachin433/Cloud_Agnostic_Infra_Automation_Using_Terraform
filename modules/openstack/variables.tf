variable "root_volume_size" {}
variable "availability_zone" {
  default = "my_zone"
}
variable "volumeType" {
  default = "my_volumeType"
}

variable "imageId" {
  default = "288e4040-b4f8-4c28-93f0-4ecb8f4a5d79"
}
variable "securitygroup" {
  default = "my_sg"
}

variable "networkGroup" {
  default = "my_subnet"
}
variable "instance_counts" {
  default = {
    "Kafka"             = 0
    "Microservice"      = 1
    "Influx_Pentaho"    = 0
    "API_Elasticsearch" = 0
    "Rabbitmq"          = 0
    "Repo_Redis"        = 1
  }
}
