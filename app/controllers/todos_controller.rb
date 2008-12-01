class TodosController < ApplicationController
  active_scaffold :documento do |config|
    config.label = "Todos los documentos"
    
    config.actions.swap :search, :full_search
    config.actions = [ :show, :list, :field_search, :nested ]
    
    config.columns << :to_label
    config.columns << :created_at
    #config.list.columns = [ :folio, :titulo, :tipo, :fecha_recepcion, :puesto, :notas, :buzon ]
    config.list.columns = [:to_label, :origen, :folio, :created_at, :materia, :tipo, :clasificacion, :copias ]
    
    #   config.show.columns = [ :folio, :titulo, :original, :creado_por, :tipo, :clasificacion, 
    #                         :accion, :estado, :fecha_recepcion, :puesto, :notas, :trazas ]
    
    #  config.field_search.columns.exclude :buzon, :documento, :guias, :puesto, :trazas
    config.columns[:tipo].form_ui = :select
    config.columns[:clasificacion].form_ui = :select
    config.columns[:accion].form_ui = :select
    
    config.columns[:tipo].clear_link
    config.columns[:clasificacion].clear_link
    config.columns[:created_at].label = "Fecha ingreso"
    config.columns[:to_label].label = "Documento"
    
    
  end
  
  
end
