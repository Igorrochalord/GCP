provider "google" {
  credentials = file("<caminho-para-sua-chave-de-conta-de-serviço>.json") # Arquivo de credenciais para autenticação no GCP
  project     = "<seu-id-do-projeto-gcp>"                                 # ID do seu projeto no GCP
  region      = "us-central1"                                             # Região padrão
}

resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name       # Nome do bucket, usando uma variável
  location      = var.location          # Localização do bucket, usando uma variável
  storage_class = var.storage_class     # Classe de armazenamento do bucket, usando uma variável

  versioning {
    enabled = true                      # Habilita o versionamento no bucket
  }

  lifecycle_rule {
    action {
      type          = "SetStorageClass" # Ação de definir a classe de armazenamento
      storage_class = "NEARLINE"        # Define a classe de armazenamento como NEARLINE após uma certa condição
    }
    condition {
      age = 30                          # Condição para a ação: 30 dias
    }
  }

  lifecycle_rule {
    action {
      type = "Delete"                   # Ação de deletar objetos
    }
    condition {
      age    = 365                      # Condição para a ação: 365 dias
      is_live = false                   # Apenas objetos não ativos
    }
  }
}