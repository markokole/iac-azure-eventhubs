provider "azurerm" {
}

resource "azurerm_resource_group" "event_hub_test" {
    name                    = "eventHubRG"
    location                = "westeurope"
}

resource "azurerm_eventhub_namespace" "event_hub_test" {
    name                    = "markoTerraformEventHubNS123"
    location                = "${azurerm_resource_group.event_hub_test.location}"
    resource_group_name     = "${azurerm_resource_group.event_hub_test.name}"
    #sku                     = "Basic" #if kafka not enabled
    sku                     = "Standard"
    capacity                = 1
    kafka_enabled           = true
}

resource "azurerm_eventhub" "event_hub_test" {
    name                    = "markoTerraformEventHub123"
    namespace_name          = "${azurerm_eventhub_namespace.event_hub_test.name}"
    resource_group_name     = "${azurerm_resource_group.event_hub_test.name}"
    partition_count         = 2
    message_retention       = 1
}

resource "azurerm_eventhub_namespace_authorization_rule" "event_hub_test" {
    name                    = "markoTerraformAuthRule123"
    namespace_name          = "${azurerm_eventhub_namespace.event_hub_test.name}"
    resource_group_name     = "${azurerm_resource_group.event_hub_test.name}"

    manage                  = true
    listen                  = true
    send                    = true
}
