class UsuariosController < ApplicationController
  active_scaffold :usuario do |config|
    config.list.columns = [:nombre, :apellido, :login, :dominio, :puesto, :admin]
    config.create.columns = [:nombre, :apellido, :login, :dominio, :password, :password_confirmation, :admin, :puesto]
    config.update.columns = [:nombre, :apellido, :login, :dominio, :password, :password_confirmation, :admin, :puesto]
    config.show.columns = [:nombre, :apellido, :login, :dominio, :puesto ]
    
    config.columns[:puesto].collapsed = true
    config.columns[:admin].form_ui = :checkbox
    config.columns[:admin].inplace_edit = true
    
    
    config.update.columns.exclude :documentos, :trazas
    
    
  end
  def do_new
    @record = active_scaffold_config.model.new(:dominio => "minrel.gov.cl")
    apply_constraints_to_record(@record)
    @record
  end
  
  
end
