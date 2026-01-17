variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "security_account_email" {
  type = string
}

variable "shared_services_email" {
  type = string
}

variable "workload_account_email" {
  type = string
}

variable "log_archive_bucket" {
  type = string
}
