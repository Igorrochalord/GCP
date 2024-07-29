variable "bucket_name" {
  description = "O nome do bucket de armazenamento" # Descrição da variável
  default     = "meu-nome-unico-bucket"             # Valor padrão
}

variable "location" {
  description = "A região do GCP para o bucket de armazenamento" # Descrição da variável
  default     = "US"                                             # Valor padrão
}

variable "storage_class" {
  description = "A classe de armazenamento do bucket" # Descrição da variável
  default     = "STANDARD"                            # Valor padrão
}
