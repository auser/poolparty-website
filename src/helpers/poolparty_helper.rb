module PoolpartyHelper
  def define_term(term, &block)
     "<div class='term'><a name='#{term}' class='term-name'>#{term}</a>\n<div class='term-def'>#{capture_haml(&block).chomp}</div></div>\n"
  end

  def tip_box(&block)
    crab_img_url = "http://fairchild.github.com/poolparty/images/site/i/examples.png"
    "<div class='tip-box'><div class='crab-wrapper'><img src='#{crab_img_url}' class='crab'/></div>#{capture_haml(&block).chomp}</div>\n"
  end
end
