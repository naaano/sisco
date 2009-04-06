class UsuariosController < ApplicationController
  active_scaffold :usuario do |config|
    config.list.columns = [:nombre, :apellido, :login, :dominio, :puesto, :admin]
    config.create.columns = [:nombre, :apellido, :login, :dominio, :password, :password_confirmation, :admin, :puesto]
    config.update.columns = [:nombre, :apellido, :login, :dominio, :password, :password_confirmation, :admin, :puesto]
    config.show.columns = [:nombre, :apellido, :login, :dominio, :puesto ]
    
    config.subform.columns.exclude :admin
    config.columns[:puesto].collapsed = true
    config.columns[:admin].form_ui = :checkbox
    config.columns[:admin].inplace_edit = true
    
    config.action_links.add "respawn",  :type => :record, :page => true, :inline => false, :security_method => :respawnable?
    
#TODO: disponer el puesto pero excluyendo lo que no debiesen tocar, como cambiarlo de buzon
    config.update.columns.exclude :documentos, :trazas, :puesto
    
    
  end
  
  def editar
    redirect_to :action => 'edit', :id => current_user.id, :parent_controller => "entrada"
  end
  
  def do_new
    @record = active_scaffold_config.model.new(:dominio => "minrel.gov.cl")
    apply_constraints_to_record(@record)
    @record
  end
  
  def respawn
    session[:usuario] = Usuario.find(params[:id])
    redirect_to :controller => 'propio'
  end
  
  protected
  
  def respawnable?
    current_user.es_admin?
  end
  
end
