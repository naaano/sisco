class EnviadosEdocsController < ApplicationController
  active_scaffold :copia do |config|
    config.label = "Documentos Electrónicos Enviados"
    config.columns.add :materia
    config.list.columns = [ :folio, :materia, :tipo, :fecha_recepcion, :buzon, :estado,:notas ]
    config.actions.exclude  :create, :update

    config.columns[:materia].includes = [:documento]
    
    config.action_links.add "xml", :type => :record, :position => false, :popup => true, :controller => 'docxml', :action => 'ver_copia'
  end
  
  def conditions_for_collection
    ["documentos.digital = true AND documentos.buzon_id = ?", current_user.puesto.buzon_id]
  end
end
