terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0"
    }
  }
}

provider "google" {
  project     = var.bootstrap_project
  region      = var.region
  zone        = var.zone
  credentials = file(var.credentials_file)
}

resource "google_folder" "inquisicao_tech" {
  display_name = "inquisicao_tech"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "ti" {
  display_name = "TI"
  parent       = google_folder.inquisicao_tech.name
}

resource "google_folder" "rh" {
  display_name = "RH"
  parent       = google_folder.inquisicao_tech.name
}

resource "google_folder" "financeiro" {
  display_name = "Financeiro"
  parent       = google_folder.inquisicao_tech.name
}

resource "google_folder" "administrativo" {
  display_name = "Administrativo"
  parent       = google_folder.inquisicao_tech.name
}

locals {
  areas = {
    TI             = google_folder.ti.name
    RH             = google_folder.rh.name
    Financeiro     = google_folder.financeiro.name
    Administrativo = google_folder.administrativo.name
  }

  subfolders = ["Shared", "Dev", "Prod"]
}

resource "google_folder" "area_subfolders" {
  for_each = {
    for area_name, area_parent in local.areas :
    for sf in local.subfolders :
    "${area_name}-${sf}" => {
      display_name = sf
      parent       = area_parent
      area         = area_name
      sf           = sf
    }
  }

  display_name = each.value.display_name
  parent       = each.value.parent
}

locals {
  pessoas = {
    TI = ["tecnico1", "tecnico2"]
    RH = ["rh1", "rh2"]
    Financeiro = ["fin1", "fin2"]
    Administrativo = ["adm1", "adm2"]
  }

  dev_folder_ids = {
    for k, v in local.areas :
    k => google_folder.area_subfolders["${k}-Dev"].name
  }
}

resource "google_project" "projetos_por_area" {
  for_each = {
    for area, pessoas in local.pessoas :
    for p in pessoas :
    "${area}-${p}" => {
      name       = "${area}-${p}-Project"
      project_id = lower(replace("${var.project_prefix}-${area}-${p}", "_", "-"))
      folder_id  = local.dev_folder_ids[area]
    }
  }

  name                = each.value.name
  project_id          = each.value.project_id
  folder_id           = each.value.folder_id
  auto_create_network = false
  billing_account     = var.billing_account
}

