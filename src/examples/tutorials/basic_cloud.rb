pool :app do
  
  instances 2..500
  
  cloud :app do
  end
  
end