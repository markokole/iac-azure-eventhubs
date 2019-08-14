resource "azurerm_databricks_workspace" "databricks_workspace" {
    count                       = "${local.provision_databricks}"
    name                        = "${local.databricks_workspace_name}"
    resource_group_name         = "${azurerm_resource_group.resource_group.name}"
    managed_resource_group_name = "${local.databricks_managed_resource_group}"
    location                    = "${azurerm_resource_group.resource_group.location}"
    sku                         = "standard"
}
resource "azurerm_role_assignment" "test" {
  count                       = "${local.provision_databricks}"
  scope                         = "${azurerm_databricks_workspace.databricks_workspace.id}"
  role_definition_name          = "${local.role_definition_name}"
  principal_id                  = "${local.principal_id}"
}