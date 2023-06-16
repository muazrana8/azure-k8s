terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "azure_infra" {
  backend = "azurerm"

  config = {
    storage_account_name = "your_storage_account_name"
    container_name       = "your_container_name"
    key                  = "your_state_file_name.tfstate"
    access_key           = "your_storage_account_access_key"
    sas_token            = "your_sas_token"
  }
}

module "kubernetes_cluster" {
  source                  = "path/to/kubernetes_cluster"
  resource_group_name     = data.terraform_remote_state.azure_infra.outputs.resource_group_name
  location                = data.terraform_remote_state.azure_infra.outputs.location
  private_subnet_cidr     = data.terraform_remote_state.azure_infra.outputs.private_subnet_cidr
  public_subnet_cidr      = data.terraform_remote_state.azure_infra.outputs.public_subnet_cidr
  storage_account_name    = data.terraform_remote_state.azure_infra.outputs.storage_account_name
  container_name          = data.terraform_remote_state.azure_infra.outputs.container_name
  state_file_name         = data.terraform_remote_state.azure_infra.outputs.state_file_name
  storage_account_key     = data.terraform_remote_state.azure_infra.outputs.storage_account_key
  storage_account_sas     = data.terraform_remote_state.azure_infra.outputs.storage_account_sas
  cluster_name            = "your_cluster_name"
  node_count              = 3
  node_vm_size            = "Standard_DS2_v2"
}
