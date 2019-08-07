provider "azurerm" {
}

resource "azurerm_resource_group" "event_hub_test" {
    name                    = "${local.resource_group_name}"
    location                = "${local.location}"
}

resource "azurerm_eventhub_namespace" "event_hub_test" {
    name                    = "${local.eventhub_namespace}"
    location                = "${azurerm_resource_group.event_hub_test.location}"
    resource_group_name     = "${azurerm_resource_group.event_hub_test.name}"
    #sku                     = "Basic" #if kafka not enabled
    sku                     = "Standard"
    capacity                = 1
    kafka_enabled           = true
}

resource "azurerm_eventhub" "event_hub_test" {
    depends_on = ["azurerm_storage_container.test"]
    count = 5
    name                    = "prod.test${count.index + 1}"
    namespace_name          = "${azurerm_eventhub_namespace.event_hub_test.name}"
    resource_group_name     = "${azurerm_resource_group.event_hub_test.name}"
    partition_count         = "${local.partition_count}"
    message_retention       = "${local.message_retention}"
    capture_description = {
        enabled             = true
        encoding            = "${local.capture_desc_encoding}"
        interval_in_seconds = 60
        size_limit_in_bytes = 10485760
        skip_empty_archives = true
        destination         = {
            name                    = "${local.capture_desc_name}"
            blob_container_name     = "${azurerm_storage_container.test.name}"
            storage_account_id      = "${azurerm_storage_account.test.id}"
            archive_name_format     = "${local.archive_name_format}"
        }
    }
}

resource "azurerm_eventhub_namespace_authorization_rule" "event_hub_test" {
    name                    = "${local.eventhub_namespace}-auth"
    namespace_name          = "${azurerm_eventhub_namespace.event_hub_test.name}"
    resource_group_name     = "${azurerm_resource_group.event_hub_test.name}"
    manage                  = true
    listen                  = true
    send                    = true
}
