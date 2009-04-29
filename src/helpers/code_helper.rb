require 'uv'

module CodeHelper
#   def clean(str); str.gsub(/^\s{#{str[/\s+/].length}}/, ''); end
  def clean(str, indent=2)
    str.split(/\n/).collect{ |line| line.gsub(/^\s{#{indent}}/, '-')}.join("\n")
  end

  def file_to_code(filename="", language="ruby", theme="blackboard")
    code_to_syntax(open(::File.join(File.dirname(__FILE__), "..", "examples", filename)).read, language, theme)
  end
  def code_to_syntax(code="", language="ruby", theme="blackboard")
     Uv.parse(code, 'xhtml', language, true, theme)
  end
  def dir_to_tabs(dir_hash={}, prev="  ", language="shell-unix-generic", theme="blackboard")
    out = ""
    dir_hash.map do |name, vars|
      out << "#{prev}#{name}/\n"
      out << "#{prev*2}#{vars[:files].join("\n#{prev*2}")}\n" if vars[:files]
      out << dir_to_tabs(vars[:dirs], prev*2, language, theme) if vars[:dirs]
    end
    out
  end
  def dir_to_syntax(dir_hash={}, language="shell-unix-generic", theme="blackboard")
    code_to_syntax(dir_to_tabs(dir_hash), language, theme)
  end


end