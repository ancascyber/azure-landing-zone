# ============================================================
# variables.tf — Input variables for Azure Enterprise Landing Zone
# ============================================================

variable "resource_group_name" {
  description = "Name of the main resource group"
  type        = string
  default     = "rg-azlz-enterprise-dev"
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "eastus"
}

variable "location_short" {
  description = "Short code for location used in naming (e.g. eus, wus)"
  type        = string
  default     = "eus"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}

