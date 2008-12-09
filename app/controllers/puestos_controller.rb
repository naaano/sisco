class PuestosController < ApplicationController

  record_select :per_page => 5, 
                :search_on => ["puestos.nombre", "buzones.sigla" ], 
                :include => :buzon, 
                :full_text_search => true, 
                :label => :full_label, 
                :order_by => "buzones.sigla" 
  
  active_scaffold :puesto do |config|
    
    config.list.columns = [:buzon, :nombre, :cargo, :usuario, :opartes, :firmante, :editor, :ingreso_papel]
    config.create.columns = [:nombre, :cargo, :usuario, :buzon, :opartes, :firmante, :editor, :ingreso_papel ]
    config.update.columns = [:nombre, :cargo, :usuario, :buzon, :opartes, :firmante, :editor, :ingreso_papel ]
    
    [:cargo, :usuario, :buzon ].each do |s|
      config.columns[s].form_ui = :select
    end
    [:opartes, :firmante, :editor, :ingreso_papel].each do |s|
      config.columns[s].form_ui = :checkbox  
      config.columns[s].inplace_edit = true
    end

  end
end
