#https://github.com/jashkenas/coffee-script/zipball/1.1.2

include_recipe "build-essential"
include_recipe "nodejs"

version = node[:coffeescript][:version]

remote_file "#{Chef::Config[:file_cache_path]}/coffee-script-#{version}.tar.gz" do
	source "https://github.com/jashkenas/coffee-script/tarball/#{version}"
	action :create_if_missing
end

bash "install_coffeescript" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOH
		mkdir -p coffee-script-#{version}
		tar --strip-components 1 -xf coffee-script-#{version}.tar.gz -C coffee-script-#{version}/
		cd coffee-script-#{version}
		bin/cake install
	EOH
    not_if "`which coffee`"
end