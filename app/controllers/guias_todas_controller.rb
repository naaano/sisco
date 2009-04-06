class GuiasTodasController < ApplicationController
  active_scaffold :guias do |config|
    
    config.columns.add :id, :created_at
    config.actions.swap :search, :field_search
    config.field_search.columns = [:id, :created_at ,:destinatario, :destinos]
    #config.columns[:id].search_ui = :numeric
    config.columns[:id].search_sql = "guias.id"
    config.columns[:destinatario].search_sql = "buzones.id "
    config.columns[:buzon].search_sql = "buzones.nombre "
    
    config.columns[:destinatario].form_ui = :select
    
    config.list.columns = [:id, :buzon, :created_at, :destinatario, :destinos]
    config.list.per_page = 40
   # config.columns[:puesto].clear_link
    config.columns[:buzon].sort_by :sql => 'buzones.nombre'
    
    config.columns[:buzon].clear_link
    config.columns[:copias].clear_link
    config.actions.exclude :update, :delete, :nested
      config.action_links.add 'Hoja', :type => :record, 
      :controller => "guias",
    :action => "hoja",
    :popup => true, 
    :crud_type => nil, 
    :inline => false    
  end
end
