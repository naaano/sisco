module EntradaHelper
  def active_scaffold_column_select(column, record)
    column_value = record.send(column.name)
    if column.inplace_edit and record.authorized_for?(:action => :update, :column => column.name)
      assoc = record.class.reflect_on_association(column.name)
      id_options = {:id => record.id.to_s, :action => 'update_column', :name => column.name.to_s}
      tag_options = {:tag => "span", :id => element_cell_id(id_options)+"-containter", :class => "in_place_editor_field"}
      script = "update_column_value('#{params_for[:controller]}', #{record.id}, '#{assoc.primary_key_name}', $F('#{element_cell_id(id_options)}'));"
      filter = "#{column.name}_conditions_for_collection"
      opts = controller.respond_to?(filter) ? assoc.klass.find(:all, :conditions => controller.send(filter) ) :  assoc.klass.find(:all)
      opt_arr = [['','']] + opts.collect{|x| [x.to_label, x.id]}
      content_tag(:span, select_tag(element_cell_id(id_options), options_for_select(opt_arr, column_value ? column_value.id : nil),
{:onchange => script}) , tag_options)
    else
      column_value ? column_value.to_label : ''
    end
  end 

end
