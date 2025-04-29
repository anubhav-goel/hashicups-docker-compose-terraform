module "backend" {
  source              = "../../modules/backend"
  bucket_name         = "my-hashicups-dev-tfstate"
  dynamodb_table_name = "my-hashicups-dev-locks"
}
