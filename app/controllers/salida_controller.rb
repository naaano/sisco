class SalidaController < ApplicationController
  active_scaffold :documento do |config|
    config.label = "ingreso papel"
    
    config.actions.swap :search, :field_search
    
    config.field_search.columns = [:folio_texto, :destinatario, :materia, :tipo, :folio_externo]
    config.columns[:usuario].form_ui = :select
    config.columns[:usuario].search_sql = 'usuarios.id'
    config.columns[:tipo].search_sql = 'tipos.id'
#    config.columns[:origen].form_ui = :select
    config.columns[:destinatario].search_sql = 'buzones.id'
  #  config.columns[:clasificacion].form_ui = :select
 #   config.columns[:accion].form_ui = :select
    
    [:accion, :origen ,:clasificacion, :destinatario, :origen_puesto].each{ |col| 
      config.columns[col].form_ui = :record_select
    }
    config.columns[:tipo].form_ui = :select
    config.list.columns = [ :folio_externo,
                            :folio_texto, 
                            :origen,
                            :destinatario_texto,
                            :materia, 
                            :tipo, 
                            :fecha, 
                            :usuario
                            ]
    
   #config.show.columns.exclude :id, :tipo, :clasificacion, :accion, :created_at, :updated_at, :folio_externo, :folio_interno, :usuario, :parent_id, :pfe, :pfe_ok, :cuerpo, :xml, :origen_puesto, :origen_puesto_texto, :origen_persona_texto, :destinatario, :destinatario_puesto, :destinatario_texto, :destinatario_puesto_texto, :destinatario_persona_texto, :lock, :firma, :referencia, :digital, :origen_sigla, :destinatario_sigla, :buzon, :folio_opartes

# sigue orden de SISCO 1 por mecanizacion de usuarios
    columnas               = [:tipo, 
                              :folio_externo,
                              :fecha,
                              :origen,
                              :detalle_origen,
                              :materia,
                              :accion,
                              :destinatario,
                              :clasificacion,
                            # :referencia,
                              :anexo, :sobre, :paquete,
                              :observaciones,
                             # :copia_original,
                             :copias
                            ]
                         
    config.create.columns = columnas                          
    config.update.columns = columnas
    config.show.columns = [:folio_externo, 
                           :folio_texto,
                           :folio_opartes,
                           :origen,:detalle_origen,
                           :fecha,
                           :created_at,
                           :materia,
                           :destinatarios,
                           :anexo, :sobre, :paquete,
                           :observaciones]


    [:materia, :clasificacion, :tipo].each{ |c|
      config.columns[c].required = true
    }
    [:anexo, :sobre, :paquete].each{ |c|
      config.columns[c].form_ui = :checkbox
    }
    config.columns[:copias].label = "Distribución"
#    config.columns[:copias].form_ui = :select
    config.columns[:copias].includes = [:buzones]
    config.columns[:cuerpo].form_ui = :textarea
    config.columns[:cuerpo].options = {:cols => 60, :rows => 30}
    config.columns[:observaciones].form_ui = :textarea
    config.columns[:observaciones].options = {:cols => 60, :rows => 6}

    config.columns[:usuario].clear_link
    config.columns[:tipo].clear_link
    config.columns[:origen].clear_link
        
  end
  
  protected

  def before_create_save(record)
    record.origen_id ||= current_user.puesto.buzon_id #FIXME debería dejarse en blanco si viene en blanco, revisar el uso de origen_id en otros lados y sus consecuencias de ser nil
    record.usuario_id = current_user.id
    record.folio_interno = current_user.puesto.buzon.nuevo_folio
    record.buzon_id = current_user.puesto.buzon_id
    record.do_folio 
    record.destinatario_texto = record.destinatario.sigla unless record.destinatario.nil? #FIXME tengo entendido que el destinatario es obligatorio
    record.copias.each{ |c| 
      c.estado_id = 1 
      c.original = false
      c.buzon_id = current_user.puesto.buzon_id
      c.origen_id ||= record.origen_id
      c.add_traza(current_user.id ,4, current_user.puesto.buzon_id)
    }
    # agrega la copia original por defecto
    c = Copia.new (:original => true, :estado_id => 1, :buzon_id => current_user.puesto.buzon_id, 
	 :origen_id => record.origen_id, :destinatario => record.destinatario, :documento => record, :accion => record.accion)
    c.add_traza(current_user.id, 4, current_user.puesto.buzon_id)
    record.copias << c
  end
  # para asignar la clasificación por defecto
  def do_new
    @record = active_scaffold_config.model.new(:buzon_id => current_user.puesto.buzon_id, :clasificacion_id => 1, :fecha => Time.now )
    #@record.copia_original = Copia.new (:original => true, :estado_id => 1, :buzon_id => current_user.puesto.buzon_id, 
   #:documento => @record)
    apply_constraints_to_record(@record)
    @record
  end

  
  def before_update_save(record)
    record.destinatario_texto = record.destinatario.sigla
    record.fecha ||= record.created_at || DateTime.now #hay gente que borra la fecha...
    record.origen_id ||= current_user.puesto.buzon_id # tambien hay gente que al editar le borra el origen... :S
    record.do_folio #pueden cambiar el origen
    record.copias.each{ |c| 
      c.estado_id = 1 if c.estado_id.nil?
      c.buzon_id = current_user.puesto.buzon_id if c.buzon_id.nil?
      c.origen_id = c.origen_id.nil? ? record.origen_id : current_user.puesto.buzon_id # correccion ticket 380
      c.add_traza(current_user.id ,10, current_user.puesto.buzon_id)
      #AS lo inserta antes de este paso si es una copia nueva, asi que actualizamos los valores correctos.
      c.save! 
    }
    original = Copia.find(:first, :conditions => ['original = true and documento_id = ?',record.id])
    unless original.nil?
      original.destinatario = record.destinatario
      original.origen = record.origen # correccion ticket 380
      original.accion = record.accion
      original.save!
    else
      c = Copia.new (:original => true, :estado_id => 1, :buzon_id => current_user.puesto.buzon_id, 
   :origen_id => record.origen_id, :destinatario => record.destinatario, :documento => record, :accion => record.accion)
    c.add_traza(current_user.id, 4, current_user.puesto.buzon_id)
    #record.destinatario = record.copia_original.buzon
    record.copias << c
    end
  end
  #TODO por ahora no necesario, pero puede servir para ver docs papel al estilo xml
  def corrige_entrada(record)
    unless record.origen_puesto_id.nil?
      puesto = Puesto.find(record.origen_puesto_id)
      record.origen_id = puesto.buzon_id
      record.origen_texto = puesto.buzon.sigla
      record.origen_puesto_texto = puesto.nombre
      record.origen_persona_texto = puesto.usuario.to_label
    end
    unless record.destinatario_puesto_id.nil?
      puesto = Puesto.find(record.destinatario_puesto_id)
      record.destinatario_id = puesto.buzon_id
      record.destinatario_texto = puesto.buzon.nombre
      record.destinatario_sigla = puesto.buzon.sigla
      record.destinatario_puesto_texto = puesto.nombre
      record.destinatario_persona_texto = puesto.usuario.to_label
    end
    #record.write_xml
  end
  
  def conditions_for_collection
    ### todos los usuarios del buzon comparten los mismos documentos
   # {:usuario_id => current_user.id , :copias => { :buzon_id => current_user.puesto.buzon_id } }
    ['documentos.id in (select documento_id from copias WHERE estado_id = 1 AND buzon_id = ? )', 
    current_user.puesto.buzon_id ]
   # ['copias.estado_id = 1 AND copias.buzon_id = ?', current_user.puesto.buzon_id]
  end
  #obsoleto, usando metodo del modelo
  def nuevo_folio
    folio_interno = current_user.puesto.buzon.folio
    current_user.puesto.buzon.folio += 1
    current_user.puesto.buzon.save
    folio_interno
  end
  
  def self.active_scaffold_controller_for(klass)
    return CopiasController if klass == Copia or klass == Documento #FIXME revisar esto, copia lo llama como documento para los destinatarios
    return "#{klass}ScaffoldController".constantize rescue super
  end

end
