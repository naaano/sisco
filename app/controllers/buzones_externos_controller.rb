class BuzonesExternosController < ApplicationController
  active_scaffold :buzon do |config|
    config.label = "Buzones externos"
    
    config.actions.exclude :delete, :show
    config.list.columns = [:sigla, :nombre, :descripcion]
    config.create.columns = [:sigla, :nombre, :descripcion]
    config.update.columns = [:sigla, :nombre, :descripcion]
  end
  
  def before_create_save(record)
    record.externo = true
    record.opartes = false
    record.envia_a_todos = false
    record.recibe_de_todos = true
  end
  
  def conditions_for_collection
    "externo = true"
  end
end
