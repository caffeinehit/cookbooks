default[:nginx][:version]      = "1.0.6"

default[:nginx][:user] = "www-data"
default[:nginx][:prefix]  = "/usr/local"
default[:nginx][:conf]     = "/etc/nginx"
default[:nginx][:logs] = "/var/log/nginx"
default[:nginx][:root] = "/var/www"

default[:nginx][:max_body_size] = "50M"
