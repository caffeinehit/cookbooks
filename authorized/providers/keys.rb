require 'chef/mixin/shell_out'
require 'chef/mixin/language'
include Chef::Mixin::ShellOut

action :create do
    Chef::Log.info("Adding authorized SSH keys to #{@new_resource.user}")
    save_keys @new_resource
end

action :delete do
    if exists?
        delete_keys @new_resource
    end
end

action :create_if_missing do
    unless exists?
        save_keys @new_resource
    end
end

private
def save_keys(resource)
    directory "#{resource.homeroot}/#{resource.user}/.ssh" do
        owner resource.user
        mode 0700
        action: create
    end
    template "#{resource.homeroot}/#{resource.user}/.ssh/authorized_keys" do
        cookbook "authorized"
        source "authorized_keys.erb"
        mode 0600
        variables (:keys => resource.keys)
    end
end

private
def delete_keys
    ::File.delete("#{resource.homeroot}/#{@new_resource.user}/.ssh/authorized_keys")
end

private
def exists?
    ::File.exists?("#{resource.homeroot}/#{@new_resource.user}/.ssh/authorized_keys")