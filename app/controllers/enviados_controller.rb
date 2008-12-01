class EnviadosController < ApplicationController
  active_scaffold :copia do |config|
    config.label = "Documentos Enviados"
    
    config.list.columns = [ :folio, :materia, :tipo, :fecha_recepcion, :destinatario, :notas ]
    config.actions.exclude  :create, :update

    config.show.link.label = "detalles"
    
    config.action_links.add "ver", :type => :record, :position => false, :popup => true, :controller => 'docxml', :action => 'ver'
    
  end
  
  def conditions_for_collection
    ["copias.id in (select id from trazas where movimiento_id in (1,8) AND buzon_id = ?)", current_user.puesto.buzon_id ]
  end
  
end
