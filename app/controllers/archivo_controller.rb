class ArchivoController < ApplicationController
  active_scaffold :copias do |config|
    config.label = "Documentos Archivados"
    
    config.actions = [ :delete, :show, :list, :field_search, :nested ]
    config.list.columns = [ :folio, :materia, :tipo, :updated_at, :carpeta, :notas ]
    
    config.columns[:created_at].label = "Ingresado"
    config.columns[:puesto].label = "Asignado"
    config.columns[:updated_at].label = "Recibido" # CAMBIAR, tomar el valor de la traza
    config.columns[:puesto].clear_link
    
    config.columns[:notas].set_link('nested',:parameters => {:associations => :notas})

    config.action_links.add "Recuperar", :type => :record,
                                    :action => "recuperar",
                                    :position => false,
                                    :method => :delete
  end
  
  def conditions_for_collection
    ['copias.estado_id = 5 AND copias.buzon_id = ?', current_user.puesto.buzon_id]
  end
  
  def recuperar
    record = Copia.find(params[:id])
    record.estado_id = 3
    if Traza.create(:copia_id => record.id, :movimiento_id => 11, :usuario => current_user)
      self.successful =  record.save
    end
    #TODO : hacer render de manera más limpia
    render :action => 'destroy.rjs', :layout => false 
  end

end
