class EntradaController < ApplicationController
  before_filter :preconfig
  
  active_scaffold :copia do |config|
    #config.label = "Entrada Oficina de Partes"
    
    config.actions = [:update, :show, :list, :field_search, :nested ]
    
    config.list.columns = [ :nro_documento, :materia, :tipo, :fecha_recepcion, :puesto, :notas ]
    config.show.columns = [ :nro_documento, :materia, :creado_por, :tipo, :clasificacion, 
                           :accion, :estado, :fecha_recepcion,:cuerpo ,:puesto, :notas, :trazas ]
    config.update.columns = [:destinatario]
    
    config.field_search.columns.exclude :buzon, :documento, :guias, :puesto, :trazas
    
    #config.columns[:fecha_recepcion].label = "Recepción"
    config.update.link.label = "redirigir"
    config.columns[:destinatario].form_ui = :select
    
    config.columns[:puesto].label = "Asignado"
    config.columns[:puesto].form_ui = :select
    config.columns[:puesto].inplace_edit = :true
    config.columns[:puesto].clear_link
    config.columns[:notas].set_link('nested',:parameters => {:associations => :notas})
    config.columns[:trazas].label = "Seguimiento"
    
    
    
    
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
  end
  
  def conditions_for_collection
    ## se visualizan los documentos del buzon propio en estados en ruta(2), entrada(3) y revisado(4)
    ['copias.estado_id IN (2,3,4) AND copias.buzon_id = ?', current_user.puesto.buzon_id]
  end
  
  
  def recibido
    record = Copia.find(params[:id])
    if Traza.create(:copia_id => record.id, :movimiento_id => 2, :usuario => current_user, :buzon_id => current_user.puesto.buzon_id)
      self.successful =  record.recibido
    end
    record.recibido
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
  
  # esto es solo para el redireccionamiento de copias
  def before_update_save(record)
    record.estado_id = 6
    record.puesto_id = nil
    record.origen_id = record.buzon_id
    record.carpeta_id = nil
  end

  def do_update_select_column
    @record = find_if_allowed(params[:id], :update)
    @assoc = @record.class.reflect_on_all_associations.detect{|x| x.primary_key_name == params[:column]}
    if @record.authorized_for?(:action => :update, :column => params[:column])
      @record.update_attributes(params[:column] => params[:value])
    end
  end 

  def puesto_conditions_for_collection
    ['buzon_id = ?', current_user.puesto.buzon_id]
  end
  
  def preconfig
    active_scaffold_config.label = current_user.puesto.buzon.nombre
  end


end
