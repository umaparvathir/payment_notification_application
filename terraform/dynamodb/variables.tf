variable "table_name" {
  description = "Dynamodb table name"
  default = "PaymentInfo"
}

variable "db_billing_mode" {
  description = "Controls the way you are charged for read and write."
  default = "PROVISIONED"
}

variable "billing_mode" {
  description = "Controls the way you are charged for read and write."
  default = "PROVISIONED"
}

variable "read_capacity" {
  description = "read capacoty units for db"
  default = 20
}

variable "write_capacity" {
  description = "write capacity units for db"
  default = 20
}

variable "hash_key" {
  description = "The attribute to use as the hash (partition) key for the table."
  default = "paymentId"
}

variable "attribute_name" {
  description = "The attribute name."
  default = "paymentId"
}

variable "tags" { 
    type = map
    default = { 
        projectName: "Audibene",
		environment: "development",
        team: "Infrastructure"
  } 
}