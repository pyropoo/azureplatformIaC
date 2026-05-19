variable "resource_group_name" {
  type = string
}

variable "storage_account_id" {
  type = string
}

variable "action_group_name" {
  type = string
}

variable "action_group_short_name" {
  type = string
}

variable "email_receiver_name" {
  type = string
}

variable "email_receiver_address" {
  type = string
}

variable "metric_alert_name" {
  type = string
}

variable "used_capacity_threshold_bytes" {
  type    = number
  default = 1073741824 # 1 GiB
}

variable "tags" {
  type    = map(string)
  default = {}
}