class GuiasController < ApplicationController
  active_scaffold :guia do |config|
    config.label = "Guias"
    config.columns.add :id, :created_at
    config.actions.swap :search, :field_search
    config.field_search.columns = [:id, :created_at, :destinos]
    #config.columns[:id].search_ui = :numeric
    config.columns[:id].search_sql = "guias.id"
    config.delete.link.label = "Deshacer"    
    config.delete.link.confirm = "Esta seguro/a que desea deshacer la guia? esto elimina la guia y trae de vuelta todos los documentos al ingreso o entrada (donde estaban antes de ser enviados)"    
    config.columns.add :total_recibidos
    config.list.columns = [:id, :created_at, :destinos, :total_recibidos]
    config.create.columns = :copias
    config.show.columns = [:id, :created_at, :total_recibidos, :copias]
    config.columns[:copias].form_ui = :checkbox
    config.columns[:copias].includes = :copias
    config.actions.exclude :update
    config.action_links.add 'Hoja', :type => :record, 
    :action => "hoja",
    :popup => true, 
    :crud_type => nil, 
    :inline => false
  end
  
  
  
  # Al generar la guia, se cambia estado del documento y se traspasa al otro buzon
  def before_create_save(record)
    #record.buzon_id = current_user.puesto.buzon_id
    ids = params[:record][:copia_ids].map{|i| i.to_i}.join(",")
	#FIXME hay que validar para cuando creen guias sin copias seleccionadas
    begin
      if ids.length > 0
      copias = Copia.find(:all, :include => :destinatario, :conditions => "copias.id in (#{ids})")
      copias.each{ |c| 
        c.despachar 
        record.copias.push c
      }
      record.destinos = record.copias.collect{|c| c.destinatario.sigla}.uniq.sort.join(',')
      record.destinos = '(varios)' if record.destinos.size > 40
      record.destinatario_id = record.copias.first.destinatario_id unless record.destinos.include?(',')
      end
    end
  end
  
  def hoja
    @guia = Guia.find(params[:id], :include => :copias, :joins => "LEFT JOIN documentos ON documentos.id = copias.documento_id" ,:order => "documentos.folio_opartes, copias.destinatario_id, copias.origen_id, copias.id")
    render :action => "hoja", :layout => "blanco"
    @opartes = current_user.puesto.buzon.opartes == true ? true : false
  end
  
  
  def conditions_for_collection
    ## se visualizan las guias creadas en el mismo buzon
    ['guias.buzon_id = ?', current_user.puesto.buzon_id]
  end
  
  def delete_authorized?
    :puede_borrar?
  end

end
