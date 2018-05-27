job "example" {
  # Specify this job should run in the region named "global". Regions
  # are defined by the Nomad servers' configuration.
  region = "global"
  # Spread the tasks in this job between us-west-1 and us-east-1.
  datacenters = ["dc1"]
  # Run this job as a "service" type. Each job type has different
  # properties. See the documentation below for more examples.
  type = "service"
  # A group defines a series of tasks that should be co-located
  # on the same client (host). All tasks within a group will be
  # placed on the same host.
  group "web" {
    # Specify the number of these tasks we want.
    count = 1
    # Create an individual task (unit of work). This particular
    task "web-backend-1" {
      # Specify the driver to be "docker"
      driver = "docker"
      # Configuration is specific to each driver.
      config {
        image = "cilium/demo-httpd"
        hostname = "web-backend-1"
        labels {
          id="app"
          stack="backend"
        }
        # not need map to host's port
        # port_map = {
        #   http = 80
        # }
        # name of created cilium network
        network_mode = "cilium-net"
      }
      # The service block tells Nomad how to register this service
      # with Consul for service discovery and monitoring.
      service {
        name="web-backend-1"
        # container service's port
        port     = 80
        # use address by docker driver
        address_mode = "driver"
        check {
          type     = "http"
          path     = "/"
          interval = "10s"
          timeout  = "2s"
          port     = 80
          address_mode = "driver"
        }
      }

      resources {
        network {
          mbits = 100
        }
      }
    }
  }
}
