class GuiasPorBuzonController < ApplicationController
  active_scaffold :guia do |config|
    #Guias para oficina de partes DEDOC
    config.label = :guias_por_buzon
    
    config.columns.add :id, :created_at
    config.actions.swap :search, :field_search
    config.field_search.columns = [:id, :created_at ,:destinatario]
    config.columns[:id].search_sql = "guias.id"
    config.columns[:destinatario].search_sql = "buzones.id "
    config.columns[:buzon].search_sql = "buzones.nombre "
    config.delete.link.label = "deshacer"    
    config.columns[:destinatario].form_ui = :select
    
    
    config.list.columns = [:id, :created_at, :destinatario , :cantidad]
    config.create.columns = :buzon
    config.show.columns = [:id, :created_at, :cantidad, :copias]
    config.columns[:copias].form_ui = :checkbox
    config.actions.exclude :update, :nested
    config.action_links.add 'Hoja', :type => :record, 
    :controller => "guias",
    :action => "hoja",
    :popup => true, 
    :crud_type => nil, 
    :inline => false    
    
    config.columns[:buzon].form_ui = :select
    config.columns[:buzon].includes = [:copias]
  end
  
  
  
  # Al generar la guia, se cambia estado del documento y se traspasa al otro buzon
  def before_create_save(record)
    record.copias = Copia.find(:all, :conditions => ['destinatario_id = ? and estado_id in (1,6) and buzon_id = ?', record.buzon_id, current_user.puesto.buzon_id], :order => "copias.destinatario_id, copias.origen_id, copias.id")
    record.copias.each{|c| c.despachar }
    record.destinatario_id = record.buzon_id
  end
  
  def hoja
    @guia = Guia.find(params[:id], :include => :copias)
    render :action => "hoja", :layout => "blanco"
  end
  
  
  def conditions_for_collection
    ## se visualizan las guias creadas en el mismo buzon
    ['guias.buzon_id = ?', current_user.puesto.buzon_id]
  end
end
