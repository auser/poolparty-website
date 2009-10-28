chef_repo "basic/chef-repo"
recipe "apache2"
chef_attributes :apache2 => {:listen_ports => ["80", "8080"]}
