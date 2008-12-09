class GuiasController < ApplicationController
  active_scaffold :guia do |config|
    config.list.columns = [:id, :created_at, :cantidad]
    config.create.columns = :copias
    config.show.columns = [:id, :created_at, :cantidad, :copias]
    config.columns[:copias].form_ui = :checkbox
    config.actions.exclude :update
    config.action_links.add 'Hoja', :type => :record, 
    :action => "hoja",
    :popup => true, 
    :crud_type => nil, 
    :inline => false    
    
    config.columns[:created_at].label = "Creación"
  end
  
  
  
  # Al generar la guia, se cambia estado del documento y se traspasa al otro buzon
  def before_create_save(record)
    record.buzon_id = current_user.puesto.buzon_id
    begin
      for i in params[:record][:copia_ids] do
        c = Copia.find(i.to_i)
        c.estado_id = 2 # en ruta
        c.buzon_id = c.destinatario_id
        c.save!
        Traza.create(:copia_id => record.id, :movimiento_id => 1, :usuario => current_user, :buzon_id => current_user.puesto.buzon_id)
        record.copias.push c
      end
    end
  end
  
  def hoja
    @guia = Guia.find(params[:id], :include => :copias)
    render :action => "hoja", :layout => "blanco"
  end
  
  
  def conditions_for_collection
    ## se visualizan las guias creadas en el mismo buzon
    ['guias.buzon_id = ?', current_user.puesto.buzon_id]
  end
end
