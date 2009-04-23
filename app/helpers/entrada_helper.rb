module EntradaHelper
  
  #para diferenciar por color el documento original de la copia
  def list_row_class(record)
    clase = ""
    clase = "original" if record.original
    clase = "#{clase} nuevo" if record.estado_id == 2
    clase
  end

  
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
  
  def trazas_column(record)
    "<ul><li>" + record.trazas.collect{|t| h(t.to_label) }.join("<li>") + "</ul>"
  end

  def notas_show_column(record)
    "<ul><li>" + record.notas.collect do |t|
      h(t.puesto.to_label) + ": " + h(t.texto)
    end.join("<li>") + "</ul>"
  end
 
  def copias_show_column(record)
    record.copias.collect{|c| c.to_label + " - " + c.buzon.sigla + " - " + c.estado.nombre + "(#{c.destinatario.sigla})"}.join(", ")
  end
 
  def id_column(record)
    check_box "record_ids[#{record.id}]", false
  end

  ## esto filtra las opciones de destinatarios a solo buzones locales
  def options_for_association_conditions(association)
    if association.name == :destinatario
      ['buzones.externo = false']
    else
      super
    end
  end
  

end
