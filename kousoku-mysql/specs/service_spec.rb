require 'minitest/spec'

describe_recipe 'kousoku-mysql::service' do
  include MiniTest::Chef::Resources
  include MiniTest::Chef::Assertions

end
