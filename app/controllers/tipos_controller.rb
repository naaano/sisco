class TiposController < ApplicationController
  record_select :per_page => 10, :search_on => 'nombre', :full_text_search => true
  active_scaffold :tipo do |config|
    config.list.columns = [:nombre, :cantidad_de_documentos]
    config.actions.exclude :show
    config.create.columns = :nombre
  end
end
