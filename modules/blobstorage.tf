resource "azurerm_storage_account" "test" {
  name                     = "${local.storage_account_name}"
  resource_group_name      = "${azurerm_resource_group.event_hub_test.name}"
  location                 = "${local.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "test" {
  name                  = "${local.storage_container_name}"
  resource_group_name   = "${azurerm_resource_group.event_hub_test.name}"
  storage_account_name  = "${azurerm_storage_account.test.name}"
  container_access_type = "blob"
}

/*
resource "azurerm_storage_blob" "blob_storage_kafka" {
  name = "${local.storage_blob_name}"

  resource_group_name    = "${azurerm_resource_group.event_hub_test.name}"
  storage_account_name   = "${azurerm_storage_account.test.name}"
  storage_container_name = "${azurerm_storage_container.test.name}"
  type                   = "page"
  size                   = 1024
}
*/