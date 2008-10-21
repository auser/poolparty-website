exec({:name => "git-#{name}"}) do
  command parent.user ? "git clone #{parent.user}@#{parent.source}" : "git clone #{parent.source}"
  cwd "#{parent.cwd if parent.cwd}"
  creates "#{::File.join( (parent.cwd ? parent.cwd : cwd), ::File.basename(parent.source, ::File.extname(parent.source)) )}/.git"
  
  exec(:name => "update-#{name}") do
    cwd ::File.dirname(parent.creates)
    command "git pull"
  end      
end