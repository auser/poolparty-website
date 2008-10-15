module FormatHelper
  def binary_entry(name="list", desc="")
    "<li><div class='title'><a>#{name}</a></div><div class='desc'>#{desc}</div></li>"
  end
end