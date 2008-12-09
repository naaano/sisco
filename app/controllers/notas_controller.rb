class NotasController < ApplicationController
  active_scaffold :nota do |config|
    
    config.columns[:created_at].label = "Fecha"
    config.actions.exclude :delete, :update
    config.columns = [:created_at, :puesto, :texto]
    config.subform.columns = [:created_at, :puesto, :texto]
    
    config.create.columns = :texto
    config.columns[:texto].form_ui = :textarea
    config.columns[:texto].options = {:cols => 70, :rows => 10}
  end
  
  def before_create_save(record)
    record.puesto_id = current_user.puesto.id
  end
end
