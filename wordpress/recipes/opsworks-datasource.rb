#
# Cookbook Name:: wordpress
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'wordpress::core'

execute "change permission" do
  command <<-EOH    
    chown nginx:nginx -R /var/www/vhosts/#{node[:wordpress][:instance_id]}
  EOH
end

node[:deploy].each do |app_name, deploy|
  template "wp-config.php" do
    path "/var/www/vhosts/#{node[:wordpress][:instance_id]}/wp-config.php"
    source "wp-config.php.erb"
    owner "root"
    group "root"
    mode 0666
    variables ({
          :host => deploy[:database][:host],
          :user => deploy[:database][:username],
          :password => deploy[:database][:password],
          :db => deploy[:database][:database]
          })
  end
end

include_recipe "nginx::service"

template "www.conf" do
  path "/etc/nginx/conf.d/www.conf"
  source "nginx-www.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[nginx]"
end

