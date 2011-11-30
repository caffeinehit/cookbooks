include_recipe "build-essential"

version = node[:nodejs][:version]

remote_file "#{Chef::Config[:file_cache_path]}/node-v#{version}.tar.gz" do
	source "http://nodejs.org/dist/node-v#{version}.tar.gz"
	action :create_if_missing
end

bash "compile_nodejs" do
	cwd Chef::Config[:file_cache_path]
	code <<-EOH
		tar xzf node-v#{version}.tar.gz
		cd node-v#{version}
		./configure
		make
		make install
	EOH
	not_if "`which node`"
end


