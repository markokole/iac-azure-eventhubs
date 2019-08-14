resource "azurerm_resource_group" "resource_group" {
    count                   = "${local.provision_resource_group}"
    name                    = "${local.resource_group_name}"
    location                = "${local.location}"
}