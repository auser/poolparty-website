module Haml
  module Filters
    module SyntaxHighlighter
      include Haml::Filters::Base
      def initialize(text)
        @text = highlight_text(text)
      end
      def highlight_text(text, opts = {:format => "ruby", :theme => "blackboard", :lines => false})
        Uv.parse( text, "xhtml", opts[:format], opts[:lines], opts[:theme])
      end
      def render(text)
        all_lines = text.split(/\n/)
        if all_lines.first =~ /#!highlighting/
          line = all_lines.first
          the_syntax = (line =~ /syntax=([\w-]+)/) ? $1 : "ruby"
          theme = (line =~ /theme=(\w+)/) ? $1 : "blackboard"
          lines = (line =~ /lines=(\w+)/) ? ($1 == 'true') : false
          text = all_lines[1..-1].join("\n")
          Haml::Helpers.preserve(highlight_text(text.rstrip, :format => the_syntax, 
                                                             :theme => theme, 
                                                             :lines => lines))
        else
          Haml::Helpers.preserve(highlight_text(text.rstrip))
        end
      end
    end
  end
end
