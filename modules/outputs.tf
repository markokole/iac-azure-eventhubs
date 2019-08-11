output "resource_group_name" {
    value           = "${azurerm_resource_group.resource_group.name}"
}
output "databricks_workspace_id" {
    depends_on      = ["azurerm_databricks_workspace.databricks_workspace"]
    value           = "${azurerm_databricks_workspace.databricks_workspace.*.id}"
}
output "primary_key" {
    depends_on      = ["azurerm_eventhub_namespace_authorization_rule.event_hub_test"]
    value           = "${azurerm_eventhub_namespace_authorization_rule.event_hub_test.*.primary_key}"
}

output "event_hub_namespace" {
    depends_on      = ["azurerm_eventhub_namespace.event_hub_test"]
    value           = "${azurerm_eventhub_namespace.event_hub_test.*.name}"
}

output "event_hub" {
    depends_on      = ["azurerm_eventhub.event_hub_test"]
    value           = ["${azurerm_eventhub.event_hub_test.*.name}"]
}

output "primary_connection_string" {
    depends_on      = ["azurerm_eventhub_namespace_authorization_rule.event_hub_test"]
    value           = "${azurerm_eventhub_namespace_authorization_rule.event_hub_test.*.primary_connection_string}"
}