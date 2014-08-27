#
# Cookbook Name:: php-fpm
# Recipe:: default
#
# Copyright 2014, Aimluck,Inc.
#
# All rights reserved - Do Not Redistribute
#

%w{php54 php54-mysqlnd php54-mbstring php54-xml php54-gd php54-mcrypt php54-pspell php54-pecl-imagick php54-pecl-apc php54-fpm php54-pecl-memcache php54-devel}.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end

include_recipe 'php-fpm::service'

include_recipe 'php-fpm::config'
