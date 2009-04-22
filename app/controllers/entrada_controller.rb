class EntradaController < ApplicationController
  before_filter :preconfig
  
  active_scaffold :copia do |config|
    config.label = "Recepción"

    config.columns.add :guias, :folio_texto, :materia, :id, :origen, :digital
#    config.actions.swap :search, :full_search
    config.actions = [:update, :show, :list, :field_search, :nested ]   
    config.field_search.columns = [ :guias, :origen, :folio_texto, :materia, :digital]
    config.columns[:guias].includes = :guias
    config.columns[:guias].search_ui = :integer
    config.columns[:guias].form_ui = :integer
    config.columns[:guias].search_sql = 'copias_guias.guia_id'
    #config.columns[:guias].sort_by :sql => 'guias.id'
    config.columns[:origen].form_ui = :record_select
    config.columns[:origen].search_sql = 'copias.origen_id'
    config.columns[:folio_texto].search_sql = 'documentos.folio_texto'
    config.columns[:materia].search_sql = 'documentos.materia'
    config.columns[:digital].includes = :documento
    config.columns[:digital].form_ui = :checkbox
    config.columns[:digital].search_sql = 'documentos.digital'
    
#    config.field_search.columns = [:fecha, :folio_externo, :folio_interno, :folio_opartes, :folio_texto, :materia, :observaciones]

    
    config.columns.add :folio_texto, :materia, :fecha_recepcion, :tipo
    # se excluye :id del listado (checkbox) hasta completar la funcionalidad, pues confunde a los usuarios.
    config.list.columns = [ :folio_texto, :origen, :materia, :tipo, :puesto, :notas, :nro_doc ]
    config.show.columns = [ :folio_texto, :materia, :procedencia, :detalle_procedencia, :tipo, :clasificacion,
                           :accion, :estado, :fecha_recepcion,:observaciones, :copias,:puesto, :notas, :guias, :trazas ]
    config.update.columns = [:destinatario]

    ## orden
   config.list.sorting = {:recepcion => :desc }
   config.columns[:folio_texto].includes = [:documento]
   config.columns[:folio_texto].sort_by :sql => "documentos.folio_interno"
   config.columns[:materia].sort_by :sql => "documentos.materia"
   config.columns[:fecha_recepcion].sort_by :sql => "recepcion"
   config.columns[:tipo].sort_by :sql => "documentos.tipo_id" #OPTIMIZE deberia buscar por tipos.nombre, pero esta muy lejos ese join

    
    config.update.link.label = "ReDir"
    config.columns[:destinatario].form_ui = :select
    config.columns[:puesto].form_ui = :select
    config.columns[:puesto].inplace_edit = :true
    config.columns[:puesto].clear_link
    config.columns[:notas].set_link('nested',:parameters => {:associations => :notas})
    config.columns[:origen].clear_link 
    
    config.action_links.add 'Recv', :type => :record, 
                                        :action => "recibido",
                                        :position => false, 
                                        :crud_type => nil, 
                                        :inline => true,
                                        :security_method => :puede_recibir?
                                        
    config.action_links.add "Arch", :type => :record,
                                    :action => "archivar",
                                    :position => false,
                                    :security_method => :puede_archivar?
    config.action_links.add "xml",  :type => :record,
                                    :popup => true,
                                    :controller => 'docxml',
                                    :action => 'ver_copia'
    config.action_links.add "copiar",  :type => :record,
                                        :inline => true,
                                        :crud_type => :create, 
                                    :security_method => :puede_copiar?,
                                    :position => false
                                    
  end
  
  def conditions_for_collection
    ## se visualizan los documentos del buzon propio en estados en ruta(2), entrada(3) y revisado(4)
    ['copias.estado_id IN (2,3,4) AND copias.buzon_id = ?', current_user.puesto.buzon_id]
  end
  
  def copiar
    @original_record = Copia.find(params[:id])
    @record = @original_record.clone
    @record.original = false
    @record.add_traza(current_user, 16, nil)
    @record.save!
    render :layout => false
  end
  
  def recibido
    record = Copia.find(params[:id])
    self.successful =  record.recibido #la recepcion real de la copia se hace a nivel de modelo
    active_scaffold_refresh_row(record)
  end
  
  def archivar
    record = Copia.find(params[:id])
    record.estado_id = 5
    if Traza.create(:copia_id => record.id, :movimiento_id => 3, :usuario => current_user, :buzon_id => current_user.puesto.buzon_id)
      self.successful =  record.save
    end
    render :action => 'destroy.rjs', :layout => false
  end
  
  def xml
    redirect_to :controller => 'xml', :action => 'generar', :id => Copia.find(params[:id]).documento_id
  end

  def update_select_column
    do_update_select_column
    render :action => 'update_select_column.rjs', :layout => false
  end

  protected
  
  # esto es solo para el redireccionamiento (reenvio) de copias
  def before_update_save(record)
    record.puesto_id = nil
    record.origen_id = record.buzon_id
    record.carpeta_id = nil
    record.add_traza(current_user.id, 8, current_user.puesto.buzon_id)
    if record.documento.digital 
      record.despachar
    else
      record.estado_id = 6
    end
  end

  def do_update_select_column
    @record = find_if_allowed(params[:id], :update)
    @assoc = @record.class.reflect_on_all_associations.detect{|x| x.primary_key_name == params[:column]}
    if @record.authorized_for?(:action => :update, :column => params[:column])
      @record.update_attributes(params[:column] => params[:value])
      RAILS_DEFAULT_LOGGER.info "grabando columna #{params[:column]}-#{params[:value]}"
      @record.add_traza_usuario(params[:value]) if params[:column].to_s == "puesto_id"
    end
  end 

  def puesto_conditions_for_collection
    ['buzon_id = ?', current_user.puesto.buzon_id]
  end
  
  def preconfig
    #active_scaffold_config.label = current_user.puesto.buzon.nombre
    if current_user.puesto.buzon.opartes == true
      active_scaffold_config.list.columns.exclude :asignado  
    end
  end

  private
  
  # para recibir automatico en archigral
  def auto_recibir
    g = Guia.find(params[:id])
    carpeta = 188
    buzones = g.copias.collect{|c| c.buzon_id}.uniq
    carpetas = g.copias.collect{|c| c.carpeta_id}.compact
    if buzones === [95] and carpetas.length == 0
      #FIXME falta filtrar solo los docs = oficio
      Guia.find(2863).copias.each{|c| c.recibir_auto(current_user) unless c.estado_id == 5; c.archivar_auto(current_user,carpeta); c.save}
    end
  end

end
