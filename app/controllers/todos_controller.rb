class TodosController < ApplicationController
  active_scaffold :documento do |config|
    config.label = "Todos los documentos"
    
    
    config.actions.swap :search, :full_search
    config.actions = [ :show, :list, :field_search, :nested ]
    
    config.field_search.columns = [:fecha, :folio_externo, :folio_interno, :folio_opartes, :folio_texto, :materia, :observaciones, :tipo, :origen, :detalle_origen, :buzon]
    
    config.columns << :folio_texto
    config.columns << :created_at
    #config.list.columns = [ :folio, :titulo, :tipo, :fecha_recepcion, :puesto, :notas, :buzon ]
    config.list.columns = [:folio_externo, :folio_texto, :origen, :fecha, :materia, :tipo, :clasificacion, :copias ]
    
    #   config.show.columns = [ :folio, :titulo, :original, :creado_por, :tipo, :clasificacion, 
    #                         :accion, :estado, :fecha_recepcion, :puesto, :notas, :trazas ]
    
    #  config.field_search.columns.exclude :buzon, :documento, :guias, :puesto, :trazas
    config.columns[:tipo].form_ui = :record_select
    config.columns[:tipo].search_sql = 'tipos.id'
    config.columns[:origen].form_ui = :record_select
    config.columns[:origen].search_sql = 'buzones.id'
    config.columns[:clasificacion].form_ui = :select
    config.columns[:accion].form_ui = :select
    config.columns[:buzon].form_ui = :record_select
    config.columns[:buzon].search_sql = 'documentos.buzon_id'
    config.columns[:fecha].form_ui = :date
    config.columns[:fecha].search_sql = 'documentos.fecha'
    
    
    config.columns[:tipo].clear_link
    config.columns[:clasificacion].clear_link
    config.columns[:origen].clear_link
    # config.columns[:copias].clear_link
    
    config.columns[:origen].sort_by :sql => 'buzones.nombre'
    config.columns[:copias].sort = false # no tiene sentido ordenar por copias y consume muchos recursos
    #config.list.always_show_search = true
    config.action_links.add "xml",  :type => :record,
                                    :popup => true,
                                    :controller => 'docxml',
                                    :action => 'ver'
  end
  
  def self.active_scaffold_controller_for(klass)
    RAILS_DEFAULT_LOGGER.info "clase a convertir : #{klass}"
    return CopiasViewController if klass == Copia 
    return "#{klass}ScaffoldController".constantize rescue super
  end

  
end
