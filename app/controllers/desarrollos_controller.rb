class DesarrollosController < ApplicationController
  uses_yui_editor
  active_scaffold do |config|

    config.actions.exclude :delete

    config.list.columns =  [:id, :prioridad, :created_at ,:titulo, :categoria, :status, :critico, :hh, :usuario]
    config.create.columns = [ :titulo, :descripcion, :categoria, :critico]
    config.update.columns = [ :titulo, :descripcion, :categoria, :critico, :status, :prioridad, :hh]
    
    config.list.sorting = { :id => :desc }
 
    config.columns[:id].weight = 0
    config.columns[:id].css_class = "lalala"
    config.columns[:critico].form_ui = :checkbox
    config.columns[:status].form_ui = :select
    config.columns[:categoria].form_ui = :select
    #config.columns[:descripcion].form_ui = :textarea
    #config.columns[:descripcion].css_class = "rich_text_editor"
    #config.columns[:descripcion].options = {:cols => 70, :rows => 20}

    config.columns[:status].clear_link
    config.columns[:categoria].clear_link
    config.columns[:usuario].clear_link

    config.action_links.add 'Activos', :parameters => {:action => 'update_table',:status_id => [1,2,3]}, :page => true
  end
  
  def before_create_save(record)
    record.usuario = current_user
    record.status_id = 1
    record.prioridad = 100
  end
  
  def before_update_save(record)
    record.usuario = current_user
  end

  def destroy_authorized?
    false
  end

  def update_authorized?
    return current_user.es_admin?
  end
  
  
end
