class CorreccionesController < ApplicationController
  active_scaffold :correccion do |config|
    config.label = "Errores detectados y sus correcciones"
    
    config.list.columns = [:id, :descripcion, :created_at, :usuario, :corregido, :comentarios]
    
    config.create.columns = [:descripcion, :mensajes]
    config.update.columns = [:corregido, :critico]
    
    config.actions.exclude :delete
    config.columns[:created_at].label = "Fecha"
    config.columns[:id].label = "ticket"
    
    config.columns[:critico].form_ui = :checkbox
    config.columns[:corregido].form_ui = :checkbox
    config.columns[:descripcion].form_ui = :textarea
    config.columns[:descripcion].options = {:cols => 70, :rows => 10}
    
   
 end
 
 def before_create_save(record)
   record.usuario = current_user
   
 end
end
