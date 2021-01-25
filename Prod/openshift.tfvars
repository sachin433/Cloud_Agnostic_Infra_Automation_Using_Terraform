cloud_provider = "nutanix"

instance_counts = {
  "Kafka"                 = 3
  "Microservice"          = 0
  "Influx_Graphana"       = 1
  "API_Pentaho"           = 1
  "Rabbitmq"              = 3
  "Shulka_Elastic"        = 1
  "Repo_Redis"            = 0
  "KSL_Notification"      = 0
  "Web_Old_Txn"           = 0
  "CCE_WEB_CCE_TXN"       = 0
  "Bulkui"                = 0
  "Customer_Managementui" = 0
  "Reverse_Proxy"         = 0

}

instance_size = {
  "Kafka"                 = "t2.large"
  "Microservice"          = "t2.2xlarge"
  "Influx_Graphana"       = "t2.xlarge"
  "API_Pentaho"           = "t2.xlarge"
  "Rabbitmq"              = "m5.2xlarge"
  "Shulka_Elastic"        = "t2.large"
  "Repo_Redis"            = "t2.medium"
  "KSL_Notification"      = "t2.medium"
  "Web_Old_Txn"           = "t2.xlarge"
  "CCE_WEB_CCE_TXN"       = "t2.large"
  "Bulkui"                = "t2.large"
  "Customer_Managementui" = "t2.large"
  "Reverse_Proxy"         = "t2.large"
}

number_of_sockets = 2


vcpu_per_core = {
  #divide the requirement by number_of_sockets
  "Kafka"                 = "1"
  "Microservice"          = "4"
  "Influx_Graphana"       = "2"
  "API_Pentaho"           = "2"
  "Rabbitmq"              = "4"
  "Shulka_Elastic"        = "1"
  "Repo_Redis"            = "1"
  "KSL_Notification"      = "1"
  "Web_Old_Txn"           = "2"
  "CCE_WEB_CCE_TXN"       = "1"
  "Bulkui"                = "1"
  "Customer_Managementui" = "1"
  "Reverse_Proxy"         = "1"
}

RAM_Count = {
  "Kafka"                 = "8192"
  "Microservice"          = "4096"
  "Influx_Graphana"       = "16384"
  "API_Pentaho"           = "16384"
  "Rabbitmq"              = "32768"
  "Shulka_Elastic"        = "8192"
  "Repo_Redis"            = "4096"
  "KSL_Notification"      = "4096"
  "Web_Old_Txn"           = "16384"
  "CCE_WEB_CCE_TXN"       = "8192"
  "Bulkui"                = "8192"
  "Customer_Managementui" = "8192"
  "Reverse_Proxy"         = "8192"
}
