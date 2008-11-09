# Basic poolparty template
pool :cb do
  
  plugin_directory "#{File.dirname(__FILE__)}/plugins"
  instances 2..5
  port 80  
  # Alestic's base ubuntu AMI
  ami "ami-1cd73375"
  
  cloud :app do
    set_master_ip_to "75.101.162.232"
    mount_ebs_volume_at "vol-4e48ad27", "/vol"
    expand_when "cpu > 0.90"
    contract_when "cpu < 0.10"
    
    apache do
      installed_as_worker      
      
      has_virtualhost do |vh|
        name "poolpartyrb.com"
        listen("8080")
        virtual_host_entry ::File.join(File.dirname(__FILE__), "cb/templates", "virtual_host.conf.erb")
        
        # We are going to have a repository that is updated across the servers
        has_git({:name => "poolpartyrepos", 
          :source => "git://github.com/auser/poolparty-website.git", 
          :at => "/var/www/poolpartyrb.com"}) do |g|
            notify get_service("apache2")
            # We don't keep the site in the top level of the repos, so let's create
            # a symlink so that the public directory is a symlink of the root level
            # site directory
            # Requires is a temporary fix
            has_symlink({:name => "/var/www/poolpartyrb.com/public", :source => "/var/www/poolpartyrb.com/poolparty-website/site"})
            
          end
      end
    end
    
  end

end