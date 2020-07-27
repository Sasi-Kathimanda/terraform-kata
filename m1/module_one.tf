##############################################################################
# RESOURCE
##############################################################################
provider "docker" {
    # host = "tcp://localhost:2376"
    registry_auth {
    address = "index.docker.io/v1/"
    config_file = "${pathexpand("~/.docker/config.json")}"
  }
}
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = "nginx:latest"
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
##############################################################################
# OUTPUT
#############################################################################

output "docker_container.nginx" {
    value = "docker_container.nginx.id"
}

output "docker_image.nginx" {
    value = "docker_image.id"
}