locals {
  cloud_id           = "b1gk2uh1jv4i27fikj4f"
  folder_id          = "b1g5h8d28qvg63eps3ms" #otus-lab
  #folder_test_id     = "b1g69dmheko09a0asuq1" #test
  zone               = "ru-central1-b"
}

terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  cloud_id  = local.cloud_id
  folder_id = local.folder_id
}
