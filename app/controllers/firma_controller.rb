class FirmaController < ApplicationController
  active_scaffold :documento do |config|
    config.label = "Pendientes de Firma"
    config.actions.exclude :create, :update, :show
    config.list.columns = [:folio, :origen_texto, :destinatario_texto, :materia, :referencia]
    
    # BOTONES DE ACCIONES
    config.action_links.add 'corregir', :type => :record, :position => false          
    config.action_links.add "firmar", :type => :record, :inline => :true, :position => :after, :crud_type => nil 
    config.action_links.add "ver", :type => :record, :position => false, :popup => true, :controller => 'docxml', :action => 'ver'
    config.action_links.add "enviar", :type => :record, :position => false, :inline => true
 
  end
  
  def corregir
    record = Documento.find(params[:id])
    # if Traza.create(:copia_id => record.id, :movimiento_id => 2, :usuario => current_user)
    #   self.successful =  record.recibido
    # end
    self.successful = record.update_attribute(:lock , false)
    render :action => 'destroy.rjs', :layout => false
  end
  
  def cliente
    @doc = Documento.find(params[:id])
    render :action => 'cliente', :layout => false if request.xhr?
  end
  
  def firmar
    id = params[:copia].nil? ? params[:id] : Copia.find(params[:id]).documento_id
	redirect_to "http://10.10.255.117:3000/firma/cliente/#{id}"
    #@doc = Documento.find(params[:id])
    #render :partial => 'cliente', :id => params[:id]
    #record = Documento.find(params[:id])
    #self.successful = record.update_attribute(:firma, true)
    #active_scaffold_refresh_row(record)
  end
  
  def dll
    case params[:id]
      when 'cf'
      render :file => Rails.root + '/public/v2.0/ClienteFirmante.dll', :layout => false
      when 'vcg'
      render :file => Rails.root + '/public/v2.0/VCGLock.DLL', :layout => false
    end
  end
  
  def enviar
    begin
      doc = Documento.find(params[:id])
      doc.copias.each{ |c|
        c.estado_id = 2
        c.buzon_id = c.destinatario_id
        c.save!
        Traza.create(:copia_id => c.id, :movimiento_id => 1, :usuario => current_user)

      }
      render :action => 'destroy.rjs', :layout => false
    end
  end
  
  def update_select_column
    do_update_select_column
    render :action => 'update_select_column.rjs', :layout => false
  end
  
  def conditions_for_collection
    ["documentos.lock = TRUE AND documentos.origen_puesto_id = ?", current_user.puesto.id ]
  end
  
end
