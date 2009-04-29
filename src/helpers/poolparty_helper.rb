module PoolpartyHelper
  def define_term(term, &block)
     "<div class='term'><a name='#{term}' class='term-name'>#{term}</a>\n<div class='term-def'>#{capture_haml(&block).chomp}</div></div>\n"
  end
end
