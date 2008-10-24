module PoolParty
  class Database
    
    plugin :mysql do
      
      # Enable is called if there is no block given when the 
      # mysql plugin is called in the cloud
      def enable
        base_install
      end
            
      def base_install
        # Required packages
        has_package(:name => "MySQL-server")
        has_package(:name => "MySQL-shared")
        has_package(:name => "MySQL-client")
        
        # Setting the Mysql password
        has_exec(:name => "Set the Mysql Password") do
          subscribe [package(:name => "MySQL-server"), package(:name => "MySQL-client"), package(:name => "MySQL-shared")]
          refreshonly true
          ifnot "mysqladmin -uroot -p$password status"
          command "mysqladmin -uroot password $password"
        end
      end
      
      # Allow us to set a password
      def password(pass="default_poolparty_password")
        has_variable(:name => "password", :value => pass)
      end
      
    end
    
  end
end
