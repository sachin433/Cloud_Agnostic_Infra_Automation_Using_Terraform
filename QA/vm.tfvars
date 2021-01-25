cloud_provider = "nutanix"

instance_counts = {
  "Kafka"                 = 3
  "Microservice"          = 2
  "Influx_Pentaho"        = 1
  "API_Elasticsearch"     = 2
  "Rabbitmq"              = 2
  "Repo_Redis"            = 1
  "KSL_Notification"      = 1
  "Web_Old_Txn"           = 2
  "CCE_WEB_CCE_TXN"       = 2
  "Bulkui"                = 2
  "Customer_Managementui" = 2
  "Reverse_Proxy"         = 2

}


instance_size = {
  "Kafka"                 = "t2.medium"
  "Microservice"          = "t2.2xlarge"
  "Influx_Pentaho"        = "t2.xlarge"
  "API_Elasticsearch"     = "t2.medium"
  "Rabbitmq"              = "t2.medium"
  "Repo_Redis"            = "t2.medium"
  "KSL_Notification"      = "t2.medium"
  "Web_Old_Txn"           = "t2.xlarge"
  "CCE_WEB_CCE_TXN"       = "t2.large"
  "Bulkui"                = "t2.large"
  "Customer_Managementui" = "t2.large"
  "Reverse_Proxy"         = "t2.large"
}


#maintain the physical core:virtual (Number of sockets: cores per cpu )ration 1:2 for performance and upto 1:8 for dev
#Number of VCpu=Number of sockets * Cores per Cpu
number_of_sockets = "2"


vcpu_per_core = {
  #divide the requirement by number_of_sockets
  "Kafka"                 = "1"
  "Microservice"          = "4"
  "Influx_Pentaho"        = "2"
  "API_Elasticsearch"     = "1"
  "Rabbitmq"              = "1"
  "Repo_Redis"            = "1"
  "KSL_Notification"      = "1"
  "Web_Old_Txn"           = "2"
  "CCE_WEB_CCE_TXN"       = "1"
  "Bulkui"                = "1"
  "Customer_Managementui" = "1"
  "Reverse_Proxy"         = "1"
}


RAM_Count = {
  "Kafka"                 = "4096"
  "Microservice"          = "4096"
  "Influx_Pentaho"        = "16384"
  "API_Elasticsearch"     = "4096"
  "Rabbitmq"              = "4096"
  "Repo_Redis"            = "4096"
  "KSL_Notification"      = "4096"
  "Web_Old_Txn"           = "16384"
  "CCE_WEB_CCE_TXN"       = "8192"
  "Bulkui"                = "8192"
  "Customer_Managementui" = "8192"
  "Reverse_Proxy"         = "8192"

}
