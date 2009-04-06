class BorradorController < ApplicationController
  active_scaffold :documento do |config|
    config.label = "Ingreso Digital"
    
    config.list.columns = [:folio_texto, :origen_puesto_texto, :destinatario_texto, :materia, :referencia, :revisiones]
    config.create.label = "Crear Nuevo Documento Electrónico"
    config.create.columns = [:origen_puesto, :destinatario_puesto, :materia, :referencia, :accion, :clasificacion, :cuerpo, :copias]
    config.update.columns = [:origen_puesto, :destinatario_puesto, :materia, :referencia, :accion, :clasificacion, :cuerpo, :copias]
    
    [:accion,:clasificacion, :tipo, :destinatario_puesto].each{ |col| 
      config.columns[col].form_ui = :record_select
    }
   # AS config se crea ANTES de la instancia, 
   # por lo que session aun no existe y no se sabe nada del usuario
   # config.columns[:origen_puesto].form_ui = :record_select
   # config.columns[:origen_puesto].options = {:params => { :buzon_id => current_user.puesto.buzon_id }  }
    config.columns[:origen_puesto].form_ui = :select
    config.columns[:cuerpo].form_ui = :textarea
    config.columns[:cuerpo].options = {:cols => 70, :rows => 30}
    
    config.columns[:origen_puesto_texto].label = "Remitente"
    config.columns[:destinatario_texto].label = "Destinatario"
    config.show.link.label = "detalles"
    
    config.action_links.add 'para firma', :type => :record, 
    :action => "para_firma",
    :position => false, 
    :security_method => :update_authorized?
    config.action_links.add "ver", :type => :record, :position => false, :popup => true, :controller => 'docxml', :action => 'ver'

  end
  
  def para_firma
    record = Documento.find(params[:id])
   # if Traza.create(:copia_id => record.id, :movimiento_id => 2, :usuario => current_user)
   #   self.successful =  record.recibido
   # end
    self.successful = record.update_attribute(:lock , true)
    #render :action => 'destroy.rjs', :layout => false
    active_scaffold_refresh_row(record)
  end

  def do_new
    @record = active_scaffold_config.model.new(:clasificacion_id => 1)
    apply_constraints_to_record(@record)
    @record
  end
  
  def before_update_save(record)
    corrige_entrada(record)
    record.copias.each {|c| 
    Traza.create(:copia_id => c.id, :movimiento_id => 10, :usuario => current_user)
    }
    record.write_xml
  end
  
  def before_create_save(record)
    logger.info record.to_yaml
    record.digital = true
    record.tipo_id = 3 # MEMO SOLAMENTE
    record.usuario_id = current_user.id
    #record.buzon_id = current_user.puesto.buzon_id # el buzon corresponde a quien firma, no quien crea.
    record.folio_interno = current_user.puesto.buzon.nuevo_folio
    corrige_entrada(record)
    record.do_folio
    # agrega la copia original por defecto
    record.copias.build(:original => true, :estado_id => 1, :buzon_id => current_user.puesto.buzon_id,
    :origen_id => record.origen_id, :destinatario_id => record.destinatario_id, :documento => record, :accion => record.accion)
    #TODO traspasar esto al modelo y probar como se comporta este,el ingreso papel y copia
    record.copias.each {|c|
      c.add_traza(current_user.id ,12, current_user.puesto.buzon_id)
    }
    record.write_xml
   end
  
  def conditions_for_collection  
    "documentos.digital = TRUE AND documentos.firma = FALSE AND documentos.buzon_id in (#{current_user.puesto.buzon.parientes_ids.join(",")})"
  end
  
  private
  
  def corrige_entrada(record)
    unless record.origen_puesto_id.nil?
      logger.info record.pretty_inspect
      puesto = Puesto.find(record.origen_puesto_id)
      record.origen_id = puesto.buzon_id
      record.origen_texto = puesto.buzon.sigla
      record.origen_puesto_texto = puesto.nombre
      logger.info record.pretty_inspect
      record.origen_persona_texto = puesto.usuario.to_label
      record.buzon_id = puesto.buzon_id
    end
    unless record.destinatario_puesto_id.nil?
      puesto = Puesto.find(record.destinatario_puesto_id)
      record.destinatario_id = puesto.buzon_id
      record.destinatario_texto = puesto.buzon.nombre
      record.destinatario_sigla = puesto.buzon.sigla
      record.destinatario_puesto_texto = puesto.nombre
      record.destinatario_persona_texto = puesto.usuario.to_label
    end
  end
 
  
end
