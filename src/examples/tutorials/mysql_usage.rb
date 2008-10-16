pool :app do
  
  # this will load all the plugins in the directory
  # It deep includes every .rb file in the directory
  # 
  # Example will require mysql.rb and apache.rb
  # plugins/
  #   mysql/
  #     mysql.rb
  #   apache/
  #     apache.rb
  #     spec/
  #       apache_spec.rb
  plugin_directory File.dirname(__FILE__) + "/plugins"
  
  cloud :app do
    
    # Call the mysql plugin
    mysql do
      # It's important to set the password before installing to set the password
      # on the server
      password("frankspassword")
      base_install
    end
    
  end
end