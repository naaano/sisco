module ActiveScaffold::Config
  # batch-create do not support columns of plural-associations
  class BatchCreate < Form 
    self.crud_type = :create
    def initialize(*args)
      super
      @columns = @core.create.columns.dup
      self.persistent = self.class.persistent
    end

    # global level configuration
    # --------------------------
    # the ActionLink for this action
    def self.link
      @@link
    end
    def self.link=(val)
      @@link = val
    end
    @@link = ActiveScaffold::DataStructures::ActionLink.new('new', :parameters => {:batch => true}, 
      :label => 'Batch Create New', :type => :table, :security_method => :create_authorized?)

    # provides access to the list of columns specifically meant for the Form to use
    def ignore_columns
      @ignore_columns
    end
    
    def ignore_columns=(val)
      @ignore_columns = ActiveScaffold::DataStructures::ActionColumns.new(*val)
    end
    
    def batch_columns
      @batch_columns
    end
    
    def batch_columns=(val)
      @batch_columns = ActiveScaffold::DataStructures::ActionColumns.new(*val)
    end
    

    # whether the form stays open after a create or not
    cattr_accessor :persistent
    @@persistent = true

    # instance-level configuration
    # ----------------------------
    # the label= method already exists in the Form base class
    def label
      @label ? as_(@label) : as_('Batch Create %s', @core.label.singularize)
    end

    # whether the form stays open after a create or not
    attr_accessor :persistent

    # reassemble params for batch, and make a iterator
    def each_record(record_params)
      # prepare record_params
      hash = record_params.dup
      
      batch_size = 1

      @columns.each do |column|
        column_name = column.name
        next unless column_in_batch?(column)
        column_param = ( column.singular_association? ) ? hash[column_name]['id'] : hash[column_name]
        hash[column_name] = column_param = column_param.split("\n") unless column_param.is_a?(Array)
        batch_size *= column_param.size 
      end

      # build matrix
      before_size = 1
      @columns.each do |column|
        column_name = column.name
        next unless column_in_batch?(column)

        column_param = ( column.singular_association? ) ? hash[column_name]['id'] : hash[column_name]
        after_size = batch_size / before_size / column_param.size
        if column.singular_association?
          hash[column_name]['id'] = build_matrix(hash[column_name]['id'], before_size, after_size)
        else
          hash[column_name] = build_matrix(hash[column_name], before_size, after_size)
        end

        before_size *= column_param.size
      end

      # iterator
      for i in (0..(batch_size-1))
        @columns.each do |column|
          column_name = column.name
          next unless column_in_batch?(column)
          if column.singular_association?
            record_params[column_name]['id'] = hash[column_name]['id'][i]
          else
            record_params[column.name] = hash[column.name][i]
          end
        end

        # run
        yield record_params
      end
    end

    private 
    def build_matrix(array, before_size, after_size)
      (array.collect{|item| Array.new(after_size, item) } * before_size).flatten
    end

    def column_in_batch?(column)
      @batch_columns.include?(column.name.to_sym) and !column.plural_association?
    end
  end
end

module ActiveScaffold::Actions
  module Create
    protected 

    def do_new_with_batch
      active_scaffold_config.create.label = active_scaffold_config.batch_create.label if params[:batch]
      do_new_without_batch
    end

    def do_create_with_batch
      unless params[:batch]
        do_create_without_batch
        @records = [@record]
        return
      end

      active_scaffold_config.batch_create.each_record( params[:record] ) do |record_params|
        params[:record] = record_params

        do_create_without_batch
        return unless successful?
        (@records ||= []) << @record
      end
    end

    alias_method_chain :do_new, :batch
    alias_method_chain :do_create, :batch
  end
end

module ActiveScaffold
  module Helpers
    module FormColumns
      def ignore_form_column_for(column)
        input(:record, column.name, :disabled => true, :value => as_('Ignore column'))
      end

      def batch_form_column_for(column, scope = nil)
        options = active_scaffold_input_options(column, scope)

        # first, check if the dev has created an override for this specific field
        if override_batch_form_field?(column)
          send(override_batch_form_field(column), @record, options[:name])

        # fallback: we get to make the decision
        else
          if column.association
            select_options = options_for_association(column.association)

            options[:name] += "[id][]"
            select_tag "", options_for_select(select_options), options.merge({:multiple => true, :size => 5})
          else # regular model attribute column
            # for textual fields we pass different options
            text_types = [:text, :string, :integer, :float, :decimal]
            options = active_scaffold_input_text_options(options) if text_types.include?(column.column.type)

            text_area(:record, column.name, options)
          end
        end
      end
      
      def override_batch_form_field?(column)
        respond_to?(override_batch_form_field(column))
      end

      # the naming convention for overriding form fields with helpers
      def override_batch_form_field(column)
        "#{column.name}_batch_form_column"
      end

    end
  end
end

