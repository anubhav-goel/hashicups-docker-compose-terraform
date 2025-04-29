module "backend" {
  source              = "../../modules/backend"
  bucket_name         = "my-hashicups-manual-tfstate"
  dynamodb_table_name = "my-hashicups-manual-locks"
}
