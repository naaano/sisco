class DocumentosController < ApplicationController
  active_scaffold :documento do |config|
    
    [:accion, :origen, :clasificacion, :tipo].each{ |col| 
      config.columns[col].form_ui = :select
    }
    
    config.create.columns = [:origen, 
                             :detalle_origen, 
                             :titulo, 
                             :externo, 
                             :folio, 
                             :accion, 
                             :clasificacion, 
                             :tipo,
                             :copias]

  end
end
