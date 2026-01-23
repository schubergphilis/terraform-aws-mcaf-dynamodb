############################################
# Core
############################################

variable "name" {
  description = "Name of the DynamoDB table."
  type        = string
}

variable "hash_key" {
  description = "Partition (hash) key attribute name. Must also be defined in `attributes`."
  type        = string
}

variable "range_key" {
  description = "Sort (range) key attribute name. Must also be defined in `attributes`."
  type        = string
  default     = null
}

variable "attributes" {
  description = "List of attribute definitions for keys and indexes. Each item must include: `name` and `type` (S, N, or B)."
  type        = list(map(string))
}

############################################
# Encryption & tags
############################################

variable "kms_key_arn" {
  description = "KMS key ARN used for server-side encryption. If `null`, the AWS-managed key `aws/dynamodb` is used."
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources."
  type        = map(string)
  default     = {}
}

############################################
# Capacity, billing, and storage class
############################################

variable "billing_mode" {
  type        = string
  default     = "PAY_PER_REQUEST"
  description = "Billing mode for the table. Valid values: PROVISIONED or PAY_PER_REQUEST."

  validation {
    condition     = contains(["PROVISIONED", "PAY_PER_REQUEST"], var.billing_mode)
    error_message = "billing_mode must be PROVISIONED or PAY_PER_REQUEST."
  }
}

variable "read_capacity" {
  description = "Read capacity units (RCU) when `billing_mode` is `PROVISIONED`."
  type        = number
  default     = null
}

variable "write_capacity" {
  description = "Write capacity units (WCU) when `billing_mode` is `PROVISIONED`."
  type        = number
  default     = null
}

variable "table_class" {
  description = "Table class. Valid values: `STANDARD` or `STANDARD_INFREQUENT_ACCESS`."
  type        = string
  default     = "STANDARD"

  validation {
    condition     = contains(["STANDARD", "STANDARD_INFREQUENT_ACCESS"], var.table_class)
    error_message = "table_class must be one of: STANDARD or STANDARD_INFREQUENT_ACCESS."
  }
}

############################################
# Indexes
############################################

variable "local_secondary_indexes" {
  description = "Local secondary indexes (LSIs). LSIs can only be set at table creation time."
  type = list(object({
    name               = string
    range_key          = string
    projection_type    = string
    non_key_attributes = optional(list(string), null)
  }))
  default = []
}

variable "global_secondary_indexes" {
  description = "Global secondary indexes (GSIs). Subject to DynamoDB limits on number of GSIs and projected attributes."
  type = list(object({
    name               = string
    hash_key           = string
    projection_type    = string
    range_key          = optional(string, null)
    read_capacity      = optional(string, null)
    write_capacity     = optional(string, null)
    non_key_attributes = optional(list(string), null)
  }))
  default = []
}

############################################
# Streams
############################################

variable "stream_enabled" {
  description = "Enable DynamoDB Streams for the table."
  type        = bool
  default     = false
}

variable "stream_view_type" {
  description = "Stream view type when streams are enabled. Valid values: `KEYS_ONLY`, `NEW_IMAGE`, `OLD_IMAGE`, `NEW_AND_OLD_IMAGES`."
  type        = string
  default     = null
}

############################################
# TTL
############################################

variable "ttl_enabled" {
  description = "Enable Time To Live (TTL) on the table."
  type        = bool
  default     = false
}

variable "ttl_attribute_name" {
  description = "TTL attribute name (Unix epoch time in seconds). Used only when `ttl_enabled` is true."
  type        = string
  default     = ""
}

############################################
# Replication (Global Tables)
############################################

variable "replica_regions" {
  description = "Replica regions configuration for global tables."
  type = list(object({
    region_name            = string
    kms_key_arn            = optional(string, null)
    propagate_tags         = optional(bool, null)
    point_in_time_recovery = optional(bool, null)
  }))
  default = []
}

############################################
# Durability & protection
############################################

variable "point_in_time_recovery_enabled" {
  description = "Enable point-in-time recovery (PITR) for the table."
  type        = bool
  default     = true
}

variable "deletion_protection_enabled" {
  description = "Enable deletion protection for the table."
  type        = bool
  default     = true
}

############################################
# Observability
############################################

variable "enable_dynamodb_insights" {
  description = "Enable DynamoDB Contributor Insights for the table."
  type        = bool
  default     = false
}
