class CopiasViewController < ApplicationController
  active_scaffold :copia do |config|
    [ :carpeta, :estado, :notas, :puesto, :trazas].each{ |col| 
      config.subform.columns.exclude col 
    }
    config.actions.exclude :create, :delete, :update, :show, :search
    config.columns.exclude :carpeta, :accion, :puesto
    config.columns[:destinatario].label = "Destinatario"
    config.columns[:destinatario].form_ui = :select
    config.columns[:accion].form_ui = :select
    config.columns[:original].form_ui = :checkbox
    config.subform.columns = [:destinatario, :accion]
    config.columns[:trazas].associated_limit = 15

    [:accion, :buzon, :destinatario, :documento, :guias, :origen, :estado].each{|a|
    config.columns[a].clear_link
    }
  end
end
