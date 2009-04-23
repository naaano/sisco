class FoliadoController < ApplicationController
  active_scaffold :documento do |config|
    config.label = "Foliado"
    config.actions.exclude :delete, :create
    config.actions.swap :search, :field_search
    config.field_search.columns = [:fecha, :folio_externo, :folio_interno, :folio_opartes, :folio_texto, :materia, :observaciones, :tipo]
    config.columns[:tipo].form_ui = :record_select
    config.columns[:tipo].search_sql = 'tipos.id'
    config.columns[:origen].form_ui = :select
    config.columns[:origen].search_sql = 'buzones.id'
    config.columns[:clasificacion].form_ui = :select
    config.columns[:accion].form_ui = :select
    config.columns[:buzon].form_ui = :select
    config.columns[:buzon].search_sql = 'documentos.buzon_id'
    config.columns[:fecha].form_ui = :date
    config.columns[:fecha].search_sql = 'documentos.fecha'
    
    config.list.columns = [:folio_externo, :fecha, :origen, :materia, :destinatario, :observaciones, :folio_opartes, :copias]
    config.update.columns = [:materia, :folio_opartes, :observaciones_foliado ,:copias]
    [:origen, :destinatario].each{|c|
    config.columns[c].clear_link
    }
    
  end
  
  def conditions_for_collection
    ## se visualizan los documentos del buzon propio en estados en ruta(2), entrada(3) y revisado(4)
    ['documentos.tipo_id != 15 AND copias.estado_id IN (3,4,6) AND copias.buzon_id = ?', current_user.puesto.buzon_id]
  end
  
  def before_update_save(record)
    record.copias.each{|c|
      val = c.buzon_id.nil? || c.buzon_id == current_user.puesto.buzon_id
      RAILS_DEFAULT_LOGGER.info "procesando copia #{c.id} - #{val} //#{c.buzon_id.nil?}//#{c.new_record?}"
      if val
        c.estado_id = 6 
        c.puesto_id = current_user.puesto.id
        c.origen_id = current_user.puesto.buzon_id
        c.buzon_id = current_user.puesto.buzon_id
        c.carpeta_id = nil
        c.save
        c.add_traza(current_user.id, 15, current_user.puesto.buzon_id)
        RAILS_DEFAULT_LOGGER.info c.inspect
        RAILS_DEFAULT_LOGGER.info "corregido #{c.id}"
      end
    }
  end
  
  def self.active_scaffold_controller_for(klass)
    RAILS_DEFAULT_LOGGER.info "clase a convertir : #{klass}"
    return CopiasViewController if klass == Copia 
    return CopiasController if klass == Documento 
    return "#{klass}ScaffoldController".constantize rescue super
  end
end
