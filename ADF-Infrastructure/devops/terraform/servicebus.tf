resource "azurerm_servicebus_namespace" "snamespace" {
  name                = "northstar-servicebus-${local.environment}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku                 = var.sku[local.environment]
  capacity            = var.capacity[local.environment]
  
}

resource "azurerm_servicebus_queue" "squeue" {
  name                = "northstar-servicebus-queue-${local.environment}"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "create-user" {
  name                = "northstar-sr-create-user"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "update-user" {
  name                = "northstar-sr-update-user"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "delete-user" {
  name                = "northstar-sr-delete-user"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "erp-invoice-message" {
  name                = "northstar-erp-invoice-message"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "erp-lineitem-message" {
  name                = "northstar-erp-lineitem-message"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "erp-invoice-fee" {
  name                = "northstar-erp-invoice-fee"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "erp-project-outbound" {
  name                = "northstar-erp-project-outbound"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "erp-glcoa-outbound-queue" {
  name                = "northstar-erp-glcoa-outbound-queue"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "100"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "erp-purchase-order-queue" {
  name                = "northstar-erp-purchase-order"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "erp-okperinta-queue" {
  name                = "northstar-erp-okperinta"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "erp-interview-salesorderattachment-queue" {
  name                = "northstar-erp-interview-salesorderattachment"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "erp-mulesoft-salesorderattachment-queue" {
  name                = "northstar-erp-mulesoft-salesorderattachment"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "erp-interview-productdescription-update-queue" {
  name                = "northstar-erp-interview-productdescription-update"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "northstar-erp-subscriptions-mass-update-queue" {
  name                = "northstar-erp-subscriptions-mass-update"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "northstar-erp-priceandproduct-queue" {
  name                = "northstar-erp-priceandproduct"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "northstar-erp-cpqproductimport" {
  name                = "northstar-erp-cpqproductimport"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "northstar-erp-cpqproductcostimport" {
  name                = "northstar-erp-cpqproductcostimport"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "northstar-erp-cpqpriceimport" {
  name                = "northstar-erp-cpqpriceimport"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "northstar-erp-fiinvoicepdfqueue" {
  name                = "northstar-erp-fiinvoice-pdf-queue"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "northstar-erp-fiinvoicexmlqueue" {
  name                = "northstar-erp-fiinvoice-xml-queue"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "northstar-erp-fiinvoicefilesprepqueue" {
  name                = "northstar-erp-fiinvoice-filesprep-queue"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "northstar-erp-fiinvoicefilesprocessedqueue" {
  name                = "northstar-erp-fiinvoice-filesprocessed-queue"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}

resource "azurerm_servicebus_queue" "northstar-erp-bwinvoice-xmlqueue" {
  name                = "northstar-erp-bwinvoice-xml-queue"
  namespace_id        = azurerm_servicebus_namespace.snamespace.id

  auto_delete_on_idle                  = null
  default_message_ttl                  = null
  enable_express                       = false
  enable_partitioning                  = false
  lock_duration                        = null
  max_size_in_megabytes                = null
  requires_duplicate_detection         = false
  requires_session                     = false
  dead_lettering_on_message_expiration = false
  max_delivery_count                   = "10"
  duplicate_detection_history_time_window = null
}
