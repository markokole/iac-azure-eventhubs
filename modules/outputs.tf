output "resource_group_name" {
    value = "${azurerm_resource_group.event_hub_test.name}"
}

output "primary_key" {
    value = "${azurerm_eventhub_namespace_authorization_rule.event_hub_test.primary_key}"
}

output "event_hub_namespace" {
    value = "${azurerm_eventhub_namespace.event_hub_test.name}"
}

output "event_hub" {
    value = "${azurerm_eventhub.event_hub_test.name}"
}

output "primary_connection_string" {
    value = "${azurerm_eventhub_namespace_authorization_rule.event_hub_test.primary_connection_string}"
}