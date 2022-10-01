variable "project" {
  type        = string
  description = "Project name"
}

variable "environment" {
  type        = string
  description = "Environment (dev / stage / prd)"
}

variable "department" {
  type        = string
  description = "Variable required for tags"
}

variable "location" {
  type        = string
  description = "Azure region to deploy module to"
}

variable "owner" {
  type        = string
  description = "Owner of the project"
}