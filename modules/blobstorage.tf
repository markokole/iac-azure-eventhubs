resource "azurerm_storage_account" "test" {
  count                    = "${local.provision_blob_storage}"
  name                     = "${local.storage_account_name}"
  resource_group_name      = "${azurerm_resource_group.resource_group.name}"
  location                 = "${local.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "test" {
  count                    = "${local.provision_blob_storage}"
  name                     = "${local.storage_container_name}"
  resource_group_name      = "${azurerm_resource_group.resource_group.name}"
  storage_account_name     = "${azurerm_storage_account.test.name}"
  container_access_type    = "blob"
}