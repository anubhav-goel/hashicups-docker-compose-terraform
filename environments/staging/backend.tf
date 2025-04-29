module "backend" {
  source              = "../../modules/backend"
  bucket_name         = "my-hashicups-stage-tfstate"
  dynamodb_table_name = "my-hashicups-stage-locks"
}
