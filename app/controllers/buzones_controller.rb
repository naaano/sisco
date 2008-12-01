class BuzonesController < ApplicationController
  record_select :per_page => 10, :search_on => 'nombre'
  
  active_scaffold :buzon do |config|
    config.list.columns = [:sigla, :nombre, :folio, :externo ]
    config.create.columns = [:sigla, :nombre, :descripcion, :folio, :externo]
    config.update.columns = [:sigla, :nombre, :descripcion, :folio, :externo]
    
    
    config.columns[:externo].form_ui = :checkbox
    config.columns[:externo].inplace_edit = :true
  end

end
