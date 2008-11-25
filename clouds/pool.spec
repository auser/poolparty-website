# Basic poolparty template
pool :cb do
  plugin_directory "#{::File.dirname(__FILE__)}/plugins"
  
  instances 1..5
  port 80  
  ami "ami-1cd73375"
  
  cloud :app do
    set_master_ip_to "75.101.162.232"
    
    apache do
      installed_as_worker      
      
      has_virtualhost do
        name "poolpartyrb.com"
        virtual_host_entry <<-EOE
Listen 8080
<VirtualHost *>
    ServerName poolpartyrb.com
    DocumentRoot /var/www/poolpartyrb.com/public
</VirtualHost>        
        EOE
        
        # We are going to have a repository that is updated across the servers
        has_git(:name => "poolpartyrepos", :source => "git://github.com/auser/poolparty-website.git", :at => "/var/www/poolpartyrb.com") do
          notify get_service("apache2")            
        end
        has_symlink({:name => "/var/www/poolpartyrb.com/public", :source => "/var/www/poolpartyrb.com/poolparty-website/site"})
      end
    end
    
  end

end