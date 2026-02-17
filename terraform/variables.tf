variable "org_id" {
  type        = string
  description = "ID fictício da Organization no GCP (apenas exemplo)."
  default     = "000000000000"
}

variable "billing_account" {
  type        = string
  description = "ID fictício da Billing Account (apenas exemplo)."
  default     = "AAAAAA-BBBBBB-CCCCCC"
}

variable "credentials_file" {
  type        = string
  description = "Arquivo de credenciais (placeholder). Em ambiente real, use JSON de service account."
  default     = "example-credentials.yaml"
}

variable "bootstrap_project" {
  type        = string
  description = "Projeto fictício usado como referência no provider."
  default     = "inquisicao-tech-bootstrap"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "us-central1-c"
}

variable "project_prefix" {
  type        = string
  default     = "inquisicao-tech"
  description = "Prefixo para IDs dos projetos."
}

