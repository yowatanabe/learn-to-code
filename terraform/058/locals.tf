locals {
  csv_data      = file("test.csv")
  items_dataset = csvdecode(local.csv_data)
}
