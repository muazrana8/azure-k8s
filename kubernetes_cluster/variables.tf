variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
}

variable "storage_account_name" {
  description = "Name of the storage account"
}

variable "container_name" {
  description = "Name of the storage container"
}

variable "state_file_name" {
  description = "Name of the state file"
}

variable "storage_account_key" {
  description = "Access key for the storage account"
}

variable "storage_account_sas" {
  description = "Shared access signature (SAS) token for the storage account"
}

variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
}

variable "node_count" {
  description = "Number of cluster nodes"
  default     = 3
}

variable "node_vm_size" {
  description = "Virtual machine size for the cluster nodes"
  default     = "Standard_DS2_v2"
}
