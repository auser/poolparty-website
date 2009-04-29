chef do
  include_recipes "~/.poolparty/chef/cookbooks/*"
  recipe "~/.poolparty/chef/rails_recipe.rb"
  templates "~/.poolparty/chef/templates/"
end