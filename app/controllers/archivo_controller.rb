class ArchivoController < ApplicationController
  active_scaffold :copia do |config|
    config.label = "Documentos Archivados"
    
## TODO agregar el sort de columnas igual al de enviados y entrada
    config.actions.add :field_search
    config.actions.exclude :create
    config.list.columns = [ :folio, :materia, :tipo, :updated_at, :carpeta, :puesto, :notas ]
    config.update.columns = [:carpeta]
    
    config.columns.add :materia, :tipo, :folio, :digital
    config.columns[:materia].includes = [:documento]
    config.columns[:tipo].includes = [:documento]
    config.field_search.columns = [:materia, :origen, :carpeta, :puesto, :folio, :notas, :digital]
    config.columns[:origen].form_ui = :record_select
    config.columns[:carpeta].form_ui = :select
    config.columns[:puesto].form_ui = :select
    

    #config.columns[:carpeta].includes = nil
    config.columns[:folio].includes = [:documento]
    config.columns[:digital].includes = [:documento]
    config.columns[:notas].includes = [:notas]
    config.columns[:folio].search_sql = 'documentos.folio_texto'
    config.columns[:origen].search_sql = 'buzones.id'
    config.columns[:materia].search_sql = 'documentos.materia'
    config.columns[:carpeta].search_sql = 'copias.carpeta_id'
    config.columns[:puesto].search_sql = 'copias.puesto_id'
    config.columns[:tipo].search_sql = 'documentos.tipo_id'
    config.columns[:notas].search_sql = 'notas.texto'
    config.columns[:digital].form_ui = :checkbox
    config.columns[:digital].search_sql = 'documentos.digital'
    
    config.columns[:materia].sort_by :sql => "documentos.materia"
    config.columns[:tipo].sort_by :sql => "documentos.tipo_id"
    config.columns[:folio].sort_by :sql => "documentos.folio_interno"
    
    config.columns[:puesto].clear_link
    config.columns[:carpeta].clear_link
#    config.columns[:notas].set_link('nested',:parameters => {:associations => :notas})

    config.action_links.add "Recuperar", :type => :record,
                                    :action => "recuperar",
                                    :position => false,
                                    :method => :delete
    config.action_links.add "xml",  :type => :record,
                                    :popup => true,
                                    :controller => 'docxml',
                                    :action => 'ver_copia'
  end

  def recuperar
    record = Copia.find(params[:id])
    record.estado_id = 3
    if Traza.create(:copia_id => record.id, :movimiento_id => 11, :usuario => current_user)
      self.successful =  record.save
    end
    #TODO : hacer render de manera mas limpia
    render :action => 'destroy.rjs', :layout => false 
  end

  
  protected
  
  def conditions_for_collection
    ['copias.estado_id = 5 AND copias.buzon_id = ?', current_user.puesto.buzon_id]
  end
  
  def carpetas_conditions_for_collection
    ['carpetas.buzon_id = ?', current_user.puesto.buzon_id]
  end
  
  def puestos_conditions_for_collection
    ['puestos.buzon_id = ?', current_user.puesto.buzon_id]
  end
  

  
  
end
