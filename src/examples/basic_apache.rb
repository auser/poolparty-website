# Basic poolparty template
require "poolparty_apache2_plugin"

pool :cb do  
  instances 2..5
  port 80
  ami "ami-1cd73375" #Alestic's base Ubuntu AMI
  
  cloud :app do
        
    apache do
      installed_as_worker      
      
      has_virtualhost do
        
        name "poolpartyrb.com"
        listen("8080")
        virtual_host_entry ::File.join(File.dirname(__FILE__), "templates", "virtual_host.conf.erb")
        
        has_git(:name => "poolpartyrepos", 
          :source => "git://github.com/auser/xnot.org.git", 
          :path => "/var/www/xnot.org/public")
        
      end
    end
    
  end

end