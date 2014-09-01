remote_file "/tmp/#{node[:mysql][:percona_rpm]}" do
  source "#{node[:mysql][:percona_rpm_uri]}"
end

package "#{node[:mysql][:percona_rpm]}" do
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{node[:mysql][:percona_rpm]}"
end

package "#{node[:mysql][:percona_package]}"
package "#{node[:mysql][:percona_package_devel]}"

include_recipe 'kousoku-mysql::service'
include_recipe 'kousoku-mysql::config'

service 'mysql' do
  action [:enable, :start]
end
