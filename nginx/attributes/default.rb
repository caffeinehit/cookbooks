default[:nginx][:version]      = "1.0.6"

set[:nginx][:user] = "www-data"
set[:nginx][:prefix]  = "/usr/local"
set[:nginx][:conf]     = "/etc/nginx"
set[:nginx][:logs] = "/var/log/nginx"
set[:nginx][:root] = "/var/www"

set[:nginx][:max_body_size] = "50M"
