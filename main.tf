# ============================================================
# main.tf — Azure Enterprise Landing Zone
# Provisions: Resource Group, VNet, Subnets, NSGs, Bastion,
#             Linux VM, Windows VM, Log Analytics Workspace
# ============================================================
terraform {
  required providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}
# ============================================================
# RESOURCE GROUP
# ============================================================
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

# ============================================================
# VIRTUAL NETWORK
# ============================================================
resource "azurerm_virtual_network" "main" {
  name                = "vnet-${var.environment}-${var.location_short}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

# ============================================================
# SUBNETS
# ============================================================

# Public subnet — for Bastion and public-facing resources

# Private subnet — for backend VMs and workloads

# Bastion subnet — MUST be named AzureBastionSubnet, minimum /27


# ============================================================
# NETWORK SECURITY GROUPS
# ============================================================

# NSG for public subnet

  # Allow HTTPS inbound

  # Deny all other inbound by default (Azure implicit deny covers this,
  # but explicit rule makes intent clear for auditors)

# NSG for private subnet — no direct internet inbound

  # Allow inbound from public subnet only

# Associate NSGs with subnets


# ============================================================
# AZURE BASTION (secure VM access — no public RDP/SSH)
# ============================================================


# ============================================================
# LOG ANALYTICS WORKSPACE (centralized monitoring)
# ============================================================


# ============================================================
# KEY VAULT (secrets management)
# ============================================================

  # Allow current Terraform identity to manage secrets

# Store VM admin password in Key Vault


# ============================================================
# LINUX VM (private subnet)
# ============================================================

  # Assign a system-managed identity (no hardcoded credentials for Azure APIs)


# ============================================================
# WINDOWS VM (private subnet)
# ============================================================


# ============================================================
# DIAGNOSTIC SETTINGS — wire VMs to Log Analytics
# ============================================================

# Uncomment this block once you have an Azure Storage Account
# for remote state (Phase 4 of your portfolio project)
# backend "azurerm" {
#   resource_group_name  = "rg-tfstate"
#   storage_account_name = "stterraformstate"
#   container_name       = "tfstate"
#   key                  = "landing-zone.tfstate"
# }
