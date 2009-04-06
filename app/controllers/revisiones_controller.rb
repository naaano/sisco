class RevisionesController < ApplicationController
  active_scaffold do |config|
    config.list.columns = [:puesto, :created_at, :observacion]
    config.create.columns = [:observacion]
    config.actions.exclude :delete, :update, :nested
    
    config.columns[:created_at].label = "Fecha"
    config.columns[:observacion].form_ui = :textarea
    config.columns[:observacion].options = {:cols => 70, :rows => 10}
  end
  
  def before_create_save(record)
    record.puesto = current_user.puesto
  end
end
