output "admin_token" {
  value       = random_id.this.hex
  description = "Token to login to admin page."
}
