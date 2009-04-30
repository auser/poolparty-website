chef do
  include_recipes "~/.poolparty/chef/cookbooks/*"
  recipe "#{File.dirname(__FILE__)}/examples/fairchild_chef.rb"
end
