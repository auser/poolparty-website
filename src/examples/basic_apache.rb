# Basic poolparty template
require "#{File.dirname(__FILE__)}/cb/plugins/apache/apache"

pool :cb do
  
  instances 2..5
  port 80
  ami "ami-1cd73375"
  using :ec2
  
  cloud :app do
        
    apache do
      installed_as_worker      
      
      has_virtualhost do
        
        name "xnot.org"
        listen("8080")
        virtual_host_entry ::File.join(File.dirname(__FILE__), "cb/templates", "virtual_host.conf.erb")
        
        has_git(:name => "poolpartyrepos", :source => "git://github.com/auser/xnot.org.git", :path => "/var/www/xnot.org/public")
        
      end
    end
    
  end

end