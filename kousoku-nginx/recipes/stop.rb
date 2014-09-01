include_recipe "kousoku-nginx::service"

service "nginx" do
  action :stop
end