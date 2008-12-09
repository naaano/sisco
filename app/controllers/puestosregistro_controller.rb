class PuestosregistroController < ApplicationController
  active_scaffold :puesto do |config|
    
    config.list.columns = [:buzon, :nombre, :cargo, :usuario]
    config.create.columns = [:nombre, :cargo, :usuario, :buzon]
    config.update.columns = [:nombre, :cargo, :usuario, :buzon ]
    
    [:cargo, :usuario, :buzon ].each do |s|
      config.columns[s].form_ui = :select
    end
    [:opartes, :firmante, :editor, :ingreso_papel].each do |s|
      config.columns[s].form_ui = :checkbox  
      config.columns[s].inplace_edit = true
    end
    
    def before_create_save(record)
      record.opartes = true
      record.firmante = false
      record.editor = false
      record.ingreso_papel = true
    end
  end  
  
end
