<script src="http://gist.github.com/69121.js"></script>


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
        virtual_host_entry ::File.join(File.dirname(__FILE__), "cb/templates", "virtual_host.conf.erb")
        
        # We are going to have a repository that is updated across the servers
        has_git({:name => "poolpartyrepos", 
          :source => "git://github.com/auser/poolparty-website.git", 
          :cwd => "/var/www/poolpartyrb.com"}) do
        
          # We don't keep the site in the top level of the repos, so let's create
          # a symlink so that the public directory is a symlink of the root level
          # site directory
          has_symlink({:name => "/var/www/poolpartyrb.com/public", :from => "/var/www/poolpartyrb.com/repos/site"})
        end
      end
    end
    
  end

end