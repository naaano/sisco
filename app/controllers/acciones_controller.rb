class AccionesController < ApplicationController
  record_select :per_page => 10, :search_on => 'nombre', :full_text_search => true
  active_scaffold :accion do |config|
    config.list.columns = [:id, :nombre, :cantidad_de_documentos]
    config.actions.exclude :delete
    config.actions.exclude :show
    
    
    config.create.columns = :nombre
    config.update.columns = :nombre
  end
end
