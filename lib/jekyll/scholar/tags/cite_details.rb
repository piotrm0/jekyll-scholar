module Jekyll
  class Scholar

    class CiteDetailsTag < Liquid::Tag
      include Scholar::Utilities

      def initialize(tag_name, arguments, tokens)
        super

        @config = Scholar.defaults.dup
        @keys, arguments = split_arguments arguments

        optparse(arguments)
      end

      def render(context)
        set_context_to context
        keys.map { |key|
          if @text
            cite_details key, (Liquid::Template.parse(@text).render context)
          else
            cite_details key, nil
          end
        }.join("\n")
      end
    end
  end
end

Liquid::Template.register_tag('cite_details', Jekyll::Scholar::CiteDetailsTag)
