require "./morganite/*"

module Morganite
  macro included
    Morganite::Morganite.new
  end

  class Morganite
    macro method_missing(call)
      def {{call.name.id}}(**args)
        tag({{call.name.id.stringify}}, **args) {% if call.block %} {{call.block}} {% else %} {} {% end %}
      end
    end

    def tag(name, **args, &block)
      o = [] of String

      open_tag = [] of String
      open_tag << "#{name}"

      args.each do |i, j|
        open_tag << "#{i}=\"#{j}\""
      end

      o << "<"
      o << open_tag.join(" ").strip
      o << ">"

      b = yield
      o << b if b

      o << "</#{name}>"
      o.join
    end
  end

  module Extras
    def title(title_text)
      title { title_text }
    end

    def stylesheet(href)
      link(rel: "stylesheet", href: href)
    end
  end
end
