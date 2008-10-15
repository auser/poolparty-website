require 'uv'

module CodeHelper
  def file_to_code(filename="", language="ruby", theme="blackboard")
    code_to_syntax(open(::File.join(File.dirname(__FILE__), "..", "examples", filename)).read, language, theme)
  end
  def code_to_syntax(code="", language="ruby", theme="blackboard")
     Uv.parse(code, 'xhtml', language, true, theme)
  end
end