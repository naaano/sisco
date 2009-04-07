class EnviadosEdocsController < ApplicationController
  active_scaffold :documento do |config|
    config.label = :edocs_enviados
    config.list.columns = [ :folio_texto, :materia, :fecha, :destinatario, :copias ]
    config.actions.exclude  :create, :update
    config.columns[:destinatario].clear_link

    config.action_links.add "xml", :type => :record, :position => false,
      :popup => true, :controller => 'docxml', :action => 'ver'
  end
  
  def conditions_for_collection
    ["documentos.digital = true AND documentos.firma = true AND documentos.buzon_id = ?", current_user.puesto.buzon_id]
  end

  def self.active_scaffold_controller_for(klass)
    return CopiasViewController if klass == Copia
    return "#{klass}ScaffoldController".constantize rescue super
  end
end
