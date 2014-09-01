require 'minitest/spec'

describe_recipe 'kousoku-nginx::service' do
  include MiniTest::Chef::Resources
  include MiniTest::Chef::Assertions

end
