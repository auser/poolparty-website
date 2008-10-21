virtual_resource(:git) do
  # This is called after instantiated
  def loaded(opts={}, parent=self)
    has_git_repos
  end
  
  def has_git_repos
    exec({:name => "git-#{name}"}) do
      command parent.user ? "git clone #{parent.user}@#{parent.source}" : "git clone #{parent.source}"
      cwd "#{parent.cwd if parent.cwd}"
      creates "#{::File.join( (parent.cwd ? parent.cwd : cwd), ::File.basename(parent.source, ::File.extname(parent.source)) )}/.git"
      
      exec(:name => "update-#{name}") do
        cwd ::File.dirname(parent.creates)
        command "git pull"
      end      
    end
  end
  
  # Since git is not a native type, we have to say which core resource
  # it is using to be able to require it
  def class_type_name
    "exec"
  end
  
  # Because we are requiring an exec, instead of a built-in package of the git, we have to overload
  # the to_s method and prepend it with the same name as above
  def key
    "git-#{name}"
  end
  
end