# filter
module ActiveScaffold::Actions
  module List
    def filter
      filter_cookie = "#{controller_name}_filter"

      filter_name = params[:name] || cookies[filter_cookie]
      cookies[filter_cookie] = filter_name if filter_name
      redirect_to (active_scaffold_config.list.get_filter_conditions(filter_name) || {}).merge({:controller => controller_name})
    end
  end
end

module ActiveScaffold::Extension
  class Filter
    attr_accessor :label, :name, :conditions, :controller

    def initialize(name, options)
      @name = name
      @label = options.delete(:label)
      @conditions = options || {}
    end

    def label
      (@label) ? @label : @name.humanize 
    end
  end
end

module ActiveScaffold::Config
  class List < Base
    def filters
      @list_filters || []
    end

    def get_filter_conditions(filter_name)
      return nil if @list_filters.blank?
      f = @list_filters.select{|f| f.name == filter_name }.first
      f.conditions if f
    end

    def add_filter(name, options)
      @list_filters ||= [ActiveScaffold::Extension::Filter.new("all", :label => as_('All'))]
      is_new_name = @list_filters.select{|f| f.name == name}.empty?
      @list_filters << ActiveScaffold::Extension::Filter.new(name, options) if is_new_name
    end
  end
end

