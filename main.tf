variable "image_name" {
  type = string
  default = "ghost:latest"
}

variable "container_name" {
  type = string
  default = "ghost_blog"
}

variable "ext_port" {
   default = "80"
}

################################### RESOURCE #################################

resource "docker_image" "ghost_image" {
  name = var.image_name

}


###CONTAINER
resource "docker_container" "ghost_container" {
  name     = var.container_name
  image    = docker_image.ghost_image.latest
  ports {
    internal = 2368
    external = var.ext_port
    }
}
