class PropioController < ApplicationController
  active_scaffold :copia do |config|
    config.label = "Mi correspondencia"  
    #config.columns[:original].form_ui = :checkbox
    #config.columns[:documento].include = [:tipo, :buzon, :accion, :clasificacion]
    
    config.actions  = [:list, :show, :nested]
    
    config.list.columns = [ :folio, :materia, :tipo, :fecha_recepcion, :notas ]
    config.show.columns = [ :folio, :materia, :creado_por, :tipo, :clasificacion, 
                           :accion, :estado, :fecha_recepcion, :puesto, :notas, :trazas ]
    config.action_links.add "xml",  :type => :record,
                                    :popup => true,
                                    :controller => 'docxml',
                                    :action => 'ver_copia'
  end
  
  def conditions_for_collection
    ["copias.puesto_id = ?", current_user.puesto.id ]
  end
  
end
