variable "instance_counts" {
  default = {
    "Kafka"             = 0
    "Microservice"      = 2
    "Influx_Pentaho"    = 0
    "API_Elasticsearch" = 0
    "Rabbitmq"          = 0
    "Repo_Redis"        = 2
  }
}
variable "number_of_sockets" {
  default = "2"
}

variable "project_uuid" {
}

variable "vcpu_per_core" {
  default = {
    #divide the requirement by number_of_sockets
    "Kafka"             = "1"
    "Microservice"      = "1"
    "Influx_Pentaho"    = "2"
    "API_Elasticsearch" = "1"
    "Rabbitmq"          = "1"
    "Repo_Redis"        = "1"
  }
}

variable "RAM_Count" {
  default = {
    "Kafka"             = "4096"
    "Microservice"      = "4096"
    "Influx_Pentaho"    = "16384"
    "API_Elasticsearch" = "4096"
    "Rabbitmq"          = "4096"
    "Repo_Redis"        = "4096"
  }
}
