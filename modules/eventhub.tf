provider "azurerm" {
}

locals {
    namespace = "markobigdata"
    resource_group_name = "eventHubRG"
    location = "westeurope"
    topic = "testtopic"
}

resource "azurerm_resource_group" "event_hub_test" {
    name                    = "${local.resource_group_name}"
    location                = "${local.location}"
}

resource "azurerm_eventhub_namespace" "event_hub_test" {
    name                    = "${local.namespace}" #"markoTerraformEventHubNS123"
    location                = "${azurerm_resource_group.event_hub_test.location}"
    resource_group_name     = "${azurerm_resource_group.event_hub_test.name}"
    #sku                     = "Basic" #if kafka not enabled
    sku                     = "Standard"
    capacity                = 1
    kafka_enabled           = true
}

resource "azurerm_eventhub" "event_hub_test" {
    name                    = "${local.topic}" #"markoTerraformEventHub123"
    namespace_name          = "${azurerm_eventhub_namespace.event_hub_test.name}"
    resource_group_name     = "${azurerm_resource_group.event_hub_test.name}"
    partition_count         = 2
    message_retention       = 1
}

resource "azurerm_eventhub_namespace_authorization_rule" "event_hub_test" {
    name                    = "${local.namespace}-auth" #"markoTerraformAuthRule123"
    namespace_name          = "${azurerm_eventhub_namespace.event_hub_test.name}"
    resource_group_name     = "${azurerm_resource_group.event_hub_test.name}"

    manage                  = true
    listen                  = true
    send                    = true
}
