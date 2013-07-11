module LinkToUjs
  module ActionView
    module Helpers
      module JavaScriptHelper
        # Returns a link whose +onclick+ handler triggers the passed JavaScript.
        #
        # The helper receives a name, JavaScript code, and an optional hash of HTML options. The
        # name is used as the link text and the JavaScript code goes into the +onclick+ attribute.
        # If +html_options+ has an <tt>:onclick</tt>, that one is put before +function+. Once all
        # the JavaScript is set, the helper appends "; return false;".
        #
        # The +href+ attribute of the tag is set to "#" unless +html_options+ has one.
        #
        #   link_to_function "Greeting", "alert('Hello world!')", :class => "nav_link"
        #   # => <a class="nav_link" href="#" onclick="alert('Hello world!'); return false;">Greeting</a>
        #
        def link_to_ujs(name, function, html_options={})
          href = html_options[:href] || '#'
          content_tag(:a, name, html_options.merge(href: href, data: {ujs: true, ref:ujs_converter(function)}))
        end

        def ujs_converter(code)
          ref = SecureRandom.hex(5)
          set_ujs(ref, code)
          ref
        end

        def set_ujs(ref, code)
          @ujs ||= {}
          @ujs[ref] = Rails.production? ? Uglifier.compile(code) : code
        end

        def ujs_content
          content_for :ujs do
            javascript_tag "$.LinkToUjs.codeStorage = #{@ujs.to_json}"
          end
          content_for(:ujs)
        end

      end
    end
  end
end
