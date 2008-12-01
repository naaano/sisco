module ActiveScaffold::DataStructures
  class ActionLink
    # true or false(nil)
    attr_accessor :macro
  end
end

module ActiveScaffold::Config
  class Core < Base
    def add_macro(action, options={})
      @action_links.add(action, 
        options.merge({:type => :table, 
          :position => false, 
          :macro => true}).
        reverse_merge({:confirm => "Are you sure execute this macro?" }))
      # TODO how to insert html to render_action_link ?
      # sample:
      # config.add_macro('batch_destroy', :label => 'Delete', :method => :delete, :security_method => :delete_authorized?)
    end
  end
end

module ActiveScaffold
  module Helpers
    module ViewHelpers
      def render_action_link_with_macro(link, url_options)
        return render_action_link_without_macro(link, url_options) unless link.macro
        url_options = url_options.clone
        url_options[:action] = link.action
        url_options[:controller] = link.controller if link.controller
        url_options.merge! link.parameters if link.parameters

        html_options = {:class => "macro " + link.action}
        url_options[:_method] = link.method
        html_options[:method] = link.method

        html_options[:confirm] = link.confirm if link.confirm?
        html_options[:position] = link.position if link.position and link.inline?
        html_options[:class] += ' action' if link.inline?
        html_options[:popup] = true if link.popup?
        html_options[:id] = action_link_id(url_options[:action],url_options[:id])

        label = url_options.delete(:link) || link.label
        link_to label, url_options, html_options
      end

      alias_method_chain :render_action_link, :macro
    end
  end
end

module ActiveScaffold::Actions
  module Delete
    def batch_destroy
      destroy_ids = params[:selection].dup
      for id in destroy_ids
        params[:id] = id
        do_destroy
        (@records ||= []) << @record
      end

      flash[:info] = as_('Deleted %s', @records.collect{|record| '"' + record.to_label + '"'}.to_sentence)
      redirect_to :controller => params[:controller]
        #type.js { render(:action => 'destroy.rjs', :layout => false) }
        #type.xml { render :xml => successful? ? "" : response_object.to_xml, :content_type => Mime::XML, :status => response_status }
        #type.json { render :text => successful? ? "" : response_object.to_json, :content_type => Mime::JSON, :status => response_status }
        #type.yaml { render :text => successful? ? "" : response_object.to_yaml, :content_type => Mime::YAML, :status => response_status }
      #end
    end
  end
end
