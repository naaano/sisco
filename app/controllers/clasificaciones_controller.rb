class ClasificacionesController < ApplicationController
  record_select :per_page => 5, :search_on => 'nombre', :full_text_search => true
  active_scaffold :clasificacion do |config|
    config.list.columns = [:nombre, :codigo, :cantidad_de_documentos]
    config.update.columns = [:nombre, :codigo]
    config.actions.exclude :delete
    config.actions.exclude :show
    #config.actions.exclude :update
    config.create.columns = :nombre
  end
end
