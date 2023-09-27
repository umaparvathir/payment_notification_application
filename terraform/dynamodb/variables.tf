variable "table_name" {
  description = "Dynamodb table name"
}

variable "db_billing_mode" {
  description = "Controls the way you are charged for read and write."
}

variable "read_capacity" {
  description = "read capacoty units for db"
}

variable "write_capacity" {
  description = "write capacity units for db"
}

variable "hash_key" {
  description = "The attribute to use as the hash (partition) key for the table."
}

variable "attribute_name" {
  description = "The attribute name."
}

variable "tags" { 
    type = map
}