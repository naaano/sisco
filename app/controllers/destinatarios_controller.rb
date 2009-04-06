class DestinatariosController < ApplicationController
  record_select :per_page => 10, :search_on => 'nombre', :full_text_search => true
  active_scaffold :destinatario do |config|
    
  end
  
  def conditions_for_collection
    ["buzones.externo = false"]
  end
end
