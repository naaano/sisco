module ActiveScaffold
  module Helpers
    module ViewHelpers

      def ext_includes(*args)
        return "" if @ext_already_included
        @ext_already_included=true
        
        #options = (Hash === args.last) ? args.pop : {}
        #options.assert_valid_keys(:style, :format, :locale)
        #locale = options[:locale]
        
        output = []
        output << javascript_include_tag("active_scaffold_ext/active_scaffold_ext")
        #output << javascript_include_tag("active_scaffold_ext/locale/#{locale}") if locale
        output << stylesheet_link_tag("active_scaffold_ext/default.css")
        output * "\n"
      end

      def active_scaffold_includes_with_ext
        active_scaffold_includes_without_ext + ext_includes
      end
      
      alias_method_chain :active_scaffold_includes, :ext
    end
  end
end
