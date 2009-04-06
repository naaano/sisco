class CarpetasController < ApplicationController
  record_select :per_page => 5, :search_on => 'nombre', :full_text_search => true
  active_scaffold :carpeta do |config|
    #config.subform.columns = [:nombre]
    config.columns.exclude :copias, :buzon
    config.columns.add :cantidad_de_copias
    config.columns[:cantidad_de_copias].weight = 3
    config.columns[:cantidad_de_copias].label = "Documentos"
    
    config.create.columns = [:nombre]
    config.update.columns = [:nombre]
  end
  
  def before_create_save(record)
    record.buzon_id = current_user.puesto.buzon_id
  end
  
  def conditions_for_collection
    [ "carpetas.buzon_id = ?", current_user.puesto.buzon_id ]
  end
  
end
