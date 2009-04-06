class PreGuiaController < ApplicationController
  helper GuiasHelper, PreGuiaHelper
  active_scaffold :destinatarios do |config|
    config.label = "Pre-Guia"
    config.list.columns = [:nombre ,:cantidad, :copias]
    config.show.columns = [:sigla, :nombre, :copias]
    config.columns[:copias].includes = [:copias]
    config.actions.exclude :update, :create, :show, :nested
    config.action_links.add 'Hoja', :type => :record, 
    :action => "hoja",
    :popup => true, 
    :crud_type => nil, 
    :inline => false    
  end
  
  def conditions_for_collection
    ['copias.estado_id in (1,6) and copias.buzon_id = ?', current_user.puesto.buzon_id]
  end
  
  def hoja
    c = Copia.find(:all, :include => [:documento], :conditions => ['copias.estado_id in (1,6) and copias.buzon_id = ? and copias.destinatario_id = ?', current_user.puesto.buzon_id , params[:id] ], :order => "documentos.folio_opartes, copias.destinatario_id, copias.origen_id, copias.id" )
    @guia = Guia.new(:copias => c, :destinatario_id => params[:id], :puesto_id => current_user.puesto.id)
    render :template => "guias/hoja", :layout => 'blanco'
    
  end
  
end
