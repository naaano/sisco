# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def active_scaffold_column_select(column,record)
    column_value = record.send(column.name)
    if column.inplace_edit and record.authorized_for?(:action => :update, :column => column.name)
      id_options = { :id => record.id.to_s, :action => 'update_column', :name =>
        column.name.to_s}
      assoc = record.class.reflect_on_association(column.name)
      script = "function(selected_id, selected_label) { update_select_column('#{url_for :controller => params_for[:controller]}', #{record.id}, '#{assoc.primary_key_name}', selected_id) }"
      record_select_field(element_cell_id(id_options),
      column_value, :controller =>
      active_scaffold_controller_for(column.association.klass).controller_path, :onchange => script)
    else
      column_value ? column_value.to_label : ''
    end
  end 
  
  
  FLASH_NOTICE_KEYS = [:error, :notice, :warning]

  def flash_messages
    return unless messages = flash.keys.select{|k| FLASH_NOTICE_KEYS.include?(k)}
    formatted_messages = messages.map do |type|      
      content_tag :div, :class => type.to_s do
        message_for_item(flash[type], flash["#{type}_item".to_sym])
      end
    end
    formatted_messages.join
  end

  def message_for_item(message, item = nil)
    if item.is_a?(Array)
      message % link_to(*item)
    else
      message % item
    end
  end

  def buzon(usuario)
    buzon = ""
    unless usuario.buzon.nil?
	buzon << usuario.buzon.sigla unless usuario.buzon.sigla.nil?
        buzon << " - "
        buzon << usuario.buzon.nombre
    end
    buzon
  end
end
