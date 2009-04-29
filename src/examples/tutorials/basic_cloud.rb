pool :party do
  instances 2..5
  
  cloud :hello do
    has_file '/etc/motd',           :content=>'Welcome to your cloud!'
    has_file '/var/www/index.html', :content=>"Hello World"
  end

end