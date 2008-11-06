pool :app do
  plugin_directory "#{File.dirname(__FILE__)}/plugins"
  instances 2..5
  
  cloud :app do
    
  end

end