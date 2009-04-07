class EnviadosController < ApplicationController
  active_scaffold :copia do |config|
    config.label = "Documentos Enviados"
    config.columns.add :folio, :materia, :fecha_recepcion, :tipo, :guias, :digital, :observaciones
    config.list.columns = [ :folio, :materia, :tipo, :fecha_recepcion, :destinatario, :notas ]
    config.actions.exclude  :create, :update
    config.actions.swap :search, :field_search
    config.field_search.columns = [:materia, :observaciones, :destinatario, :guias, :digital]
    config.columns[:guias].includes = :guias
    config.columns[:guias].form_ui = :numeric
    config.columns[:guias].search_sql = 'copias_guias.guia_id'
    config.columns[:destinatario].form_ui = :record_select
    config.columns[:destinatario].search_sql = 'buzones.id'
    config.columns[:digital].includes = :documento
    config.columns[:digital].form_ui = :checkbox
    config.columns[:digital].search_sql = 'documentos.digital'
    config.columns[:materia].search_sql = 'documentos.materia'
    config.columns[:observaciones].search_sql = 'documentos.observaciones'
    
    
    config.show.link.label = "detalles"
    
    config.action_links.add "xml", :type => :record, :position => false, :popup => true, :controller => 'docxml', :action => 'ver_copia'
   #ORDEN
   config.columns[:folio].includes = [:documento]
   config.columns[:folio].sort_by :sql => "documentos.folio_interno"
   config.columns[:materia].sort_by :sql => "documentos.materia"
   config.columns[:fecha_recepcion].sort_by :sql => "recepcion"
   config.columns[:tipo].sort_by :sql => "documentos.tipo_id" #OPTIMIZE deberia buscar por tipos.nombre, pero esta muy lejos ese join
   config.columns[:destinatario].clear_link
 end
 
 
 protected
  
  def conditions_for_collection
    otro =     "copias.id in
 (select copias.id from copias
left join copias_guias on copias_guias.copia_id = copias.id
left join guias on guias.id = copias_guias.guia_id
where guias.buzon_id = #{current_user.puesto.buzon_id}
UNION
select copias.id from copias
left join documentos on copias.documento_id = documentos.id
WHERE (documentos.digital = true AND documentos.buzon_id = #{current_user.puesto.buzon_id})
) " # este query excluye ememos reenviados.
    ["copias.id in (select copia_id from trazas where movimiento_id in (1,8) AND buzon_id = ?)", current_user.puesto.buzon_id ]
  end

end
