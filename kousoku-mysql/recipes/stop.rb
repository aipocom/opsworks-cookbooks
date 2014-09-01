include_recipe "kousoku-mysql::service"

service "mysql" do
  action :stop
end