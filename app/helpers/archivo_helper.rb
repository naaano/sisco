module ArchivoHelper
## afecta el edit
  def options_for_association_conditions(association)
    if association.name == :carpeta
      ['carpetas.buzon_id = ?', session[:usuario].puesto.buzon_id]
    elsif association.name == :puesto
      ['puestos.buzon_id = ?', session[:usuario].puesto.buzon_id]
    else
      super
    end
  end
  ### afecta el buscador
  def carpeta_search_column(record, input_name)
    select :record, :carpeta, Carpeta.find(:all, :conditions => ['carpetas.buzon_id = ?', session[:usuario].puesto.buzon_id]).collect{|x| [x.nombre, x.id]}, {:include_blank => as_('_select_')}, :name => input_name+"[id]"
  end
  def puesto_search_column(record, input_name)
    select :record, :puesto, Puesto.find(:all, :conditions => ['puestos.buzon_id = ?', session[:usuario].puesto.buzon_id]).collect{|x| [x.nombre, x.id]}, {:include_blank => as_('_select_')}, :name => input_name+"[id]"
  end

  
end
