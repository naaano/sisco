class SalidaController < ApplicationController
  active_scaffold :documento do |config|
    config.label = "Despacho Oficina de Partes"
    
    
    config.columns[:created_at].label = "ingreso"
    [:accion, :origen ,:clasificacion, :tipo, :destinatario_puesto, :origen_puesto].each{ |col| 
      config.columns[col].form_ui = :record_select
    }
    
    config.list.columns = [ :folio_texto, 
                            :origen_texto,
                            :destinatario_texto,
                            :materia, 
                            :tipo, 
                            :clasificacion, 
                            :created_at
                            ]
    
    
    config.create.label = "Ingresar Nuevo Documento"

    columnas               = [:materia,
                             :referencia,
                             :origen, 
                             :detalle_origen,
                             :externo,
                             :destinatario_puesto,  
                             :accion, 
                             :clasificacion, 
                             :tipo,                         
                             :copias]
    config.create.columns = columnas                          
    config.update.columns = columnas
    [:materia, :destinatario_puesto, :accion, :clasificacion, :tipo].each{ |c|
      config.columns[c].required = true
    }

    config.columns[:origen].label = "Originante"
    config.columns[:copias].label = "Distribución"
    config.columns[:copias].includes = [:copias]
    config.columns[:externo].label = "Nro. Externo"
    config.columns[:externo].description = "Número externo (solo números) si tiene"
    config.columns[:origen_puesto].description = "Dejar en blanco si el documento es propio (no externo)"
    config.columns[:detalle_origen].label = "Otro origen"
    config.columns[:cuerpo].form_ui = :textarea
    config.columns[:cuerpo].options = {:cols => 60, :rows => 30}
    
    
    config.columns[:origen_puesto].label = "Puesto Origen"
    config.columns[:destinatario_puesto].label = "Puesto Destinatario"
    
  end
  
  protected

  def before_create_save(record)
    record.origen_id ||= current_user.puesto.buzon_id
    record.usuario_id = current_user.id
    record.folio = nuevo_folio
    record.copias.each{ |c| 
      c.estado_id = 1 
      c.buzon_id = current_user.puesto.buzon_id
      c.origen_id ||= record.origen_id
      c.add_traza(current_user.id ,4)
    }
  end
  
  def before_update_save(record)
    record.copias.each{ |c| 
      c.estado_id = 1 
      c.buzon_id = current_user.puesto.buzon_id
      c.origen_id ||= current_user.puesto.buzon_id
      c.add_traza(current_user.id ,10)
    }
  end
  
  def conditions_for_collection
   # {:usuario_id => current_user.id , :copias => { :buzon_id => current_user.puesto.buzon_id } }
    ['documentos.usuario_id = ? AND documentos.id in (select documento_id from copias WHERE estado_id = 1 AND buzon_id = ? )', 
    current_user.id, current_user.puesto.buzon_id ]
   # ['copias.estado_id = 1 AND copias.buzon_id = ?', current_user.puesto.buzon_id]
  end
  
  def nuevo_folio
    folio = current_user.puesto.buzon.folio
    current_user.puesto.buzon.folio += 1
    current_user.puesto.buzon.save
    folio
  end
  
  def origen_conditions_for_collection
    'externo = true'
  end
 
end
