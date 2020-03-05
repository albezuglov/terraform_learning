provider "docker" {
    host = "tcp://10.0.2.5:2375"
}

resource "docker_image" "myimage" {
  name = "ghost:alpine"
}

resource "docker_container" "mycontainer" {
    image = "${docker_image.myimage.latest}"
    name = "myalpine"
    ports {
        internal = "2368"
        external = "80"
    }
}