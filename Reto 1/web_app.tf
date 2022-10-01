# App Service Plan defines the compute resources available to the FA and how it scales.
resource "azurerm_app_service_plan" "plan-copa-reto1-rbit" {
  name                = "${var.project}-${var.environment}-app-service-plan"
  resource_group_name = azurerm_resource_group.reto1-rg-rbits.name
  location            = var.location

  sku {
    tier = "Standard"
    size = "S1"
  }

  tags = {
    CREATEDBY = "${var.owner}"
    DPT       = "${var.owner}"
    AMBIENTE  = "${var.owner}"
  }
}

//Availability Set para la escalabilidad del proyecto
resource "azurerm_availability_set" "app-copa-as-reto1-rbit" {
  name                         = "app-copa-as-reto1-rbit"
  location                     = "${var.location}"
  resource_group_name          = azurerm_resource_group.reto1-rg-rbits.name
  platform_fault_domain_count  = 3
  platform_update_domain_count = 3

  depends_on = [
    azurerm_app_service_plan.plan-copa-reto1-rbit
  ]

  tags = {
    CREATEDBY = "${var.owner}"
    DPT       = "${var.owner}"
    AMBIENTE  = "${var.owner}"
  }
}


resource "azurerm_windows_web_app" "app-copa-reto1-rbit" {
  name                = "app-copa-reto1-rbit"
  resource_group_name = azurerm_resource_group.reto1-rg-rbits.name
  location            = "${var.location}"
  service_plan_id     = azurerm_app_service_plan.plan-copa-reto1-rbit.id

  site_config {
    always_on = false
  }

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.appi-copa-reto1-rbit.instrumentation_key
  }
}

resource "azurerm_app_service_source_control" "plan-copa-sc-reto1-rbit" {
  app_id   = azurerm_windows_web_app.app-copa-reto1-rbit.id
  repo_url = "https://github.com/iukion/CopaHackathon_html_base"
  branch   = "master"
}