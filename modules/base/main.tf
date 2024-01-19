resource "google_service_account" "default" {
  account_id = ""
  # todo: ...
}

resource "google_project" "default" {
  name       = var.name
  project_id = var.id
}

resource "google_container_cluster" "default" {
  project = google_project.default.id
  name = ""
  location = var.region

  # We can't create a base with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count = 1

  cluster_autoscaling {
    enabled = ""
    auto_provisioning_defaults {
      min_cpu_platform = ""
      service_account = ""
      disk_type = ""
      disk_size = ""
      image_type = ""
      management {
        auto_upgrade = ""
        auto_repair = ""
      }
      upgrade_settings {
        strategy = ""
        max_surge = 0
        max_unavailable = 0

      }
    }
    autoscaling_profile = ""
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = ""
    }
  }

}

resource "google_container_node_pool" "default" {
  name = ""
  location = ""
  cluster = ""
  node_count = 1
  node_config {}
  # todo: ...
}
