require 'syntaxi'

module CodeHelper
  def file_to_code(filename="")
    code_to_syntax(open(::File.join(File.dirname(__FILE__), "..", "examples", filename)).read)
  end
  def code_to_syntax(code="")
    html = Syntaxi.new("[code lang='ruby']#{code}[/code]").process
    "<div class=\"snippet syntax syntax_ruby\">#{html}</div>"
  end
end