package "openjdk-6-jdk" # for ``javac``
package "solr-jetty"

service "jetty" do
    supports :status => true, :restart => true
    action :enable
end

cookbook_file "/etc/solr/conf/schema.xml" do
    source "schema.xml"
    owner "root"
    group "root"
    mode "644"
end

cookbook_file "/etc/default/jetty" do
  source "default"
  owner "root"
  group "root"
  mode "644"
  notifies :restart, "service[jetty]"
end


