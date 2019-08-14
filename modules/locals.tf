
locals {
    
    customer                    = "customer"

    // services to provision
    provision_resource_group    = 1
    provision_databricks        = 1
    provision_event_hub         = 0
    provision_blob_storage      = 0

    // resource group
    resource_group_name         = "${local.customer}RG"
    location                    = "westeurope"

    // databricks
    databricks_workspace_name   = "${local.customer}DBWS"
    databricks_managed_resource_group   = "${local.customer}DBMRG"
    role_definition_name        = "Owner"

    // eventhubs
    eventhub_namespace          = "markobigdata"
    topic                       = "testtopic"
    partition_count             = 1
    message_retention           = 1 // between 1 and 7 (days)

    //capture_description block
    archive_name_format         = "{Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second}"
    capture_desc_name           = "EventHubArchive.AzureBlockBlob"
    capture_desc_encoding       = "Avro"

    // storage blob
    storage_account_name        = "markobigdatastorageacc"
    storage_container_name      = "kafka"
}
