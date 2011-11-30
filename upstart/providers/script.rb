require 'chef/mixin/shell_out'
require 'chef/mixin/language'
include Chef::Mixin::ShellOut

action :create do
    Chef::Log.info("Creating upstart script: #{@new_resource.name}")
    Chef::Log.info("Command: #{@new_resource.command}")
    save_file @new_resource
end

action :delete do
    if exists?
        delete_file @new_resource
    end
end

action :create_if_missing do
    unless exists?
        save_file @new_resource
    end
end

private
def save_file(resource)
    template "/etc/init/#{resource.name}.conf" do
        cookbook "upstart"
        source "upstart.erb"
        variables (:resource => resource)
    end
end

private
def delete_file(resource)
    ::File.delete("/etc/init/#{resource.name}.conf")
end

private
def exists?
    ::File.exists?("/etc/init/#{@new_resource.name}.conf")
end