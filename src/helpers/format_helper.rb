module FormatHelper
  def binary_entry(name="list", desc="")
    "<li><div class='title'><a>#{name}</a></div><div class='desc'>#{desc}</div></li>"
  end
  def option_entry(name="list", desc="")
    "<dt class='option'><a>#{name}</a><dd>#{desc}</dd></dt>"
  end
end