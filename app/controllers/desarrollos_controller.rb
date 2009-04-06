class DesarrollosController < ApplicationController
  #uses_yui_editor
  active_scaffold do |config|
    config.list.columns =  [:id, :prioridad ,:titulo, :categoria, :status, :critico, :hh, :usuario]
    config.create.columns = [ :titulo, :descripcion, :categoria, :critico]
    config.update.columns = [ :titulo, :descripcion, :categoria, :critico, :status, :prioridad, :hh]
    
    config.list.sorting = { :id => :desc }
    
    config.columns[:usuario].label = "ultimo cambio"
    
    config.columns[:id].weight = 0
    config.columns[:id].label = "ticket"
    config.columns[:id].css_class = "lalala"
    config.columns[:critico].form_ui = :checkbox
    config.columns[:status].form_ui = :select
    config.columns[:categoria].form_ui = :select
    config.columns[:descripcion].form_ui = :textarea
    config.columns[:descripcion].css_class = "rich_text_editor"
    #config.columns[:descripcion].options = {:cols => 70, :rows => 20}
  end
  
  def before_create_save(record)
    record.usuario = current_user
    record.status_id = 1
    record.prioridad = 100
  end
  
  def before_update_save(record)
    record.usuario = current_user
  end
  
  
end
