class CopiasController < ApplicationController
                
  active_scaffold :copia do |config|
    [ :carpeta, :estado, :notas, :puesto, :trazas].each{ |col| 
      config.subform.columns.exclude col 
    }
    config.columns[:destinatario].label = "Destinatario"
    config.columns[:destinatario].form_ui = :record_select
    config.columns[:accion].form_ui = :select
    config.columns[:original].form_ui = :checkbox
    config.subform.columns = [:destinatario, :accion]
    config.create.columns = [:destinatario, :accion]
    
  end
end
