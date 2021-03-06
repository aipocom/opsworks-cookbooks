template 'mysql configuration' do
  path value_for_platform(
    ['centos','redhat','fedora','amazon'] => {'default' => '/etc/my.cnf'},
    'default' => '/etc/mysql/my.cnf'
    )
  source 'my.cnf.erb'
  backup false
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, "service[mysql]"
end

directory "#{node[:mysql][:logdir]}" do
  owner "mysql" 
  group "mysql" 
  recursive true
  mode 0755
  recursive true
end
