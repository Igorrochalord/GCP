output "bucket_name" {
  value = google_storage_bucket.bucket.name # Exibe o nome do bucket
}

output "bucket_url" {
  value = "gs://${google_storage_bucket.bucket.name}" # Exibe a URL do bucket
}
