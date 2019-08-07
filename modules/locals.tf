
locals {

    // resource group
    resource_group_name     = "eventHubRG"
    location                = "westeurope"

    // eventhubs
    eventhub_namespace      = "markobigdata"
    topic                   = "testtopic"
    partition_count         = 1
    message_retention       = 1 // between 1 and 7 (days)

        //capture_description block
    archive_name_format     = "{Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second}"
    capture_desc_name       = "EventHubArchive.AzureBlockBlob"
    capture_desc_encoding   = "Avro"

    // storage blob
    storage_account_name    = "markobigdatastorageacc"
    storage_container_name  = "kafka"
    storage_blob_name       = "prod.vhd" //vhd -> virtual hard disk
}
