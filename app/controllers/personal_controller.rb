class PersonalController < ApplicationController
  active_scaffold :puesto do |config|
    # config.list.columns = [:nombre, :apellido, :login, :dominio, :puesto, :admin]
    # config.create.columns = [:nombre, :apellido, :login, :dominio, :puesto, :password, :password_confirmation, :admin]
    config.list.columns = [:nombre, :cargo, :opartes, :firmante, :editor, :ingreso_papel, :usuario]
    config.create.columns = [:nombre, :cargo, :opartes, :firmante, :editor, :ingreso_papel, :usuario]
    config.update.columns = [:nombre, :cargo, :opartes, :firmante, :editor, :ingreso_papel, :usuario]
    config.columns[:cargo].form_ui = :select
    config.columns[:usuario].form_ui = :select
    [:opartes, :firmante, :editor, :ingreso_papel].each{ |o|
      config.columns[o].form_ui = :checkbox
      config.columns[o].inplace_edit = :true
    }
  end
  
  def before_create_save(record)
    record.buzon_id = current_user.puesto.buzon_id
    rotacion = Rotacion.new do |r|
      r.puesto = record
      r.usuario_id = record.usuario_id
      r.asigna = true
    end
    rotacion.save!
  end
  
  # edicion con registro de rotaciones
  def before_update_save(record)
    anterior = Puesto.find(record.id)
    unless anterior.usuario_id = record.usuario_id
      rotacion = Rotacion.new do |r|
        r.puesto = record
        r.usuario_id = record.usuario_id
        r.asigna = false
      end
      rotacion.save!
    end
  end
  def do_new
    @record = active_scaffold_config.model.new(:buzon_id => current_user.puesto.buzon_id, :dominio => 'minrel.gov.cl')
    apply_constraints_to_record(@record)
    @record
  end
  def conditions_for_collection
    ## se visualizan los documentos del buzon propio en estados en ruta(2), entrada(3) y revisado(4)
    ['puestos.buzon_id = ?', current_user.puesto.buzon_id]
  end
  
end
