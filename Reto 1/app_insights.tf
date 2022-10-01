# Application Insights
resource "azurerm_application_insights" "appi-copa-reto1-rbit" {
  name                = "appi-copa-reto1-rbit"
  location            = azurerm_resource_group.reto1-rg-rbits.location
  resource_group_name = azurerm_resource_group.reto1-rg-rbits.name
  application_type    = "Node.JS"
  workspace_id        = azurerm_log_analytics_workspace.log-copa-reto1-rbit.id

  tags = {
    CREATEDBY = "${var.owner}"
    DPT       = "${var.owner}"
    AMBIENTE  = "${var.owner}"
  }
}

# Analytics Logs
resource "azurerm_log_analytics_workspace" "log-copa-reto1-rbit" {
  name                = "acctest-01"
  location            = azurerm_resource_group.reto1-rg-rbits.location
  resource_group_name = azurerm_resource_group.reto1-rg-rbits.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = {
    CREATEDBY = "${var.owner}"
    DPT       = "${var.owner}"
    AMBIENTE  = "${var.owner}"
  }
}

