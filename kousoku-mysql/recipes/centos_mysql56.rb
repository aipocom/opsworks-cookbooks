#
# Cookbook Name:: mysql
# Recipe:: centos_mysql56
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "mysqlclient16" do
  action [:remove]
end

include_recipe 'kousoku-mysql::mysql56'
