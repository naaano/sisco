class CarpetasController < ApplicationController
  active_scaffold :carpeta do |config|
    config.subform.columns = [:nombre]
    config.columns = [:nombre]
  end
  
  def before_create_save(record)
    record.buzon_id = current_user.puesto.buzon_id
  end
  
  def conditions_for_collection
    [ "carpetas.buzon_id = ?", current_user.puesto.buzon_id ]
  end
  
end
